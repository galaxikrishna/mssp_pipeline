
function [slop,o]=spectral_curve_corrector(loc,x,y,dat_siz,tel_sel)% here x is the position of telluric line for different slitsgot
%from spectral_curve_idl_caller.m and loc is the path to the location where
%data is stored.dat_siz telles weather the given data is spectroscopy (1) or 
%spectropolarimetry (4) images per fits file. The last element of dat_siz
%gives this value. This code corrects curvature and shift in 2 beams of a
%slit. It also corrects the tilt in slit caused by the camera. Finally it
%flatfield's the image and stores 2 copies, one is jst curve corrected 2nd
%is flat corrected. tel_sel is a switch used to preserve the telluric line
%in flatened image or remove it. If tel_sel is 1 then telluric line is
%preserved else its removed


ft=fittype('a*exp(-(x-b)^2/(2*c^2))+d');
%--------------------for flat----------------------------------------------
    xxx=x;
    curv=fitsread(strcat(loc,'line_pos_flat.fits'));
    curv(isinf(curv))=0;
    curv(isnan(curv))=0;
    curv(curv>2048)=2048-59;%my window starts from 97 and goes up to 59
    curv(curv<0)=97;
    mkdir(strcat(loc,'curve_corrected')); 
    if dat_siz(3)==1
    mkdir(strcat(loc,'curve_corrected',filesep,'flat_corrected'));
    end
    dat=dir(strcat(loc,'flat_0*'));
for ct=1:length(dat)%for all files
        o=zeros(10,4);%o stores the shift in y-axis b/w o-e rays of a slit
        a=fitsread(strcat(loc,dat(ct).name));
        for cnt=1:dat_siz(3) %for I1, I2, I3, I4
    
    for i=1:length(x)
       
        if i==1 || i==2
            w=zeros(2048,1);
            w(800:1600)=10;
        else
             w=ones(2048,1);
             w(50:1910)=10;
        end
        crv{i,cnt,ct}=fit([1:2048]',squeeze(curv(i,:,cnt,ct))','poly2','weights',w);%i am saving it for all files so that it can be used for future
    end

          
        end
clear tmp
img=zeros(2048,2048,dat_siz(3));
tic
for cnt=1:dat_siz(3)
 
    for i=1:length(x)
        tst=crv{i,cnt,ct}(1:2048);%this is the telluric line curve
        for j=1:2048
            tmp(:,j,cnt)=fshift(a(:,j,cnt),tst(y(1))-tst(j));%shift with respect to a given y location selected on the 1st point 
        end
        
        
        tst=floor(tst);
            [~,mval]=min(tmp(tst(y(1))-10:tst(y(1))+10,y(1),cnt),[],1);
            mval=mval+tst(y(1))-10-1;
            tst(y(1))=mval;%to locate the minimum position of gaussian
            p1=-tmp(tst(y(1)),y(1),cnt);
            p2=max(tmp(tst(y(1))-10:tst(y(1))+10,y(1),cnt));
            mn=fit([tst(y(1))-10:tst(y(1))+10]',tmp(tst(y(1))-10:tst(y(1))+10,y(1),cnt),ft,'StartPoint',[-10000,tst(y(1)),1,0],'Lower',[-10000,tst(y(1))-2,0.5,0],'Upper',[0,tst(y(1))+2,2.5,10000]);
            tmp(:,:,cnt)=FourierShift2D(tmp(:,:,cnt),[xxx(i)-mn.b,0]);

%              p1=-tmp(xxx(i),1000,1);
%             p2=max(a(xxx(i)-10:xxx(i)+10,1000,1));
%              mn=fit([xxx(i)-10:xxx(i)+10]',tmp(xxx(i)-10:xxx(i)+10,1000,1),ft,'StartPoint',[p1,xxx(i),1,p2],'Lower',[p1+p1/3,xxx(i)-2,0.5,p2-(p2-p1)/3],'Upper',[p1-p1/3,xxx(i)+2,2,p2+(p2-p1)/3]);
%              tmp(:,:,cnt)=FourierShift2D(tmp(:,:,cnt),[xxx(i)-mn.b,0]);
        
         
       
        
      if ct==1
        if tst(y(1)) < 98
            img(1:xxx(i)+56,:,cnt)=tmp(1:xxx(i)+56,:,cnt);
        elseif tst(y(1)) > 1989
            img(xxx(i)-97:2048,:,cnt)=tmp(xxx(i)-97:2048,:,cnt);
        else
            img(xxx(i)-97:xxx(i)+56,:,cnt)=tmp(xxx(i)-97:xxx(i)+56,:,cnt);
        end
      else
         if tst(y(1)) < 98
            img(1:xxx(i)+56,:,cnt)=FourierShift2D(tmp(1:xxx(i)+56,:,cnt),[0,o(i,4)]);
        elseif tst(y(1)) > 1989
            img(xxx(i)-97:2048,:,cnt)=FourierShift2D(tmp(xxx(i)-97:2048,:,cnt),[0,o(i,4)]);
        else
            img(xxx(i)-97:xxx(i)+56,:,cnt)=FourierShift2D(tmp(xxx(i)-97:xxx(i)+56,:,cnt),[0,o(i,4)]);
        end
      end
    end
end
a=img;
    if ct==1%this section corrects for camera tilt and shift between 2 polarisations of a slit
        a=img;
        imagesc(a(:,:,1)')%holds for spectroscopy and spectropolarimetry
        disp('Select a region with horizontal lines to zoom in. Then click any key');
        pause % this gives user the time to select a region and click on a key to continue execution
        disp('Select points that lie on horizontal axis to determine camera tilt');
        [x1,y1]=getpts;
        ft_ln=fit(x1,y1,'poly1');
        slop=ft_ln.p1;
    end
        
        tmpv=zeros(size(a));
    for j=1:10
        if x(j)-97 < 1
            tmp=a(1:x(j)+56,:,:);
            for k=1:size(tmp,1)
                tmp(k,:,:)=reshape(FourierShift2D(reshape(tmp(k,:,:),dat_siz(2),dat_siz(3)),[-ft_ln.p1*(77-size(tmp,1)+k-1),0]),1,dat_siz(2),dat_siz(3));
            end
            if ct==1 && rem(j,2)==0
                o(j,:)=dftregistration(fft2(a(x(j-1)-30:x(j-1)+30,:,1)),fft2(a(x(j)-30:x(j)+30,:,1)),5000);
            
            for k=1:dat_siz(3)
                tmp(:,:,k)=FourierShift2D(tmp(:,:,k),[0,o(j,4)]);
            end
            end
                tmpv(1:x(j)+56,:,:)=tmp;
        elseif x(j)+56 > 2048
            tmp=a(x(j)-97:2048,:,:);
            for k=1:size(tmp,1)
                tmp(k,:,:)=reshape(FourierShift2D(reshape(tmp(k,:,:),dat_siz(2),dat_siz(3)),[-ft_ln.p1*(k-78),0]),1,dat_siz(2),dat_siz(3));
            end
            if ct==1 && rem(j,2)==0
                o(j,:)=dftregistration(fft2(a(x(j-1)-30:x(j-1)+30,:,1)),fft2(a(x(j)-30:x(j)+30,:,1)),5000);
            
            for k=1:dat_siz(3)
                tmp(:,:,k)=FourierShift2D(tmp(:,:,k),[0,o(j,4)]);
            end
            end
            tmpv(x(j)-97:2048,:,:)=tmp;
        else
            tmp=a(x(j)-97:x(j)+56,:,:);
            for k=1:size(tmp,1)
                tmp(k,:,:)=reshape(FourierShift2D(reshape(tmp(k,:,:),dat_siz(2),dat_siz(3)),[-ft_ln.p1*(k-78),0]),1,dat_siz(2),dat_siz(3));
            end
            if rem(j,2)==0
                o(j,:)=dftregistration(fft2(a(x(j-1)-30:x(j-1)+30,:,1)),fft2(a(x(j)-30:x(j)+30,:,1)),5000);
            
            for k=1:dat_siz(3)
                tmp(:,:,k)=FourierShift2D(tmp(:,:,k),[0,o(j,4)]);
            end
            end
            tmpv(x(j)-97:x(j)+56,:,:)=tmp;
        end
    end
       img=tmpv;
    
        
    fitswrite(img,strcat(loc,'curve_corrected',filesep,dat(ct).name));
    tm=toc;
    if ct==2
        disp(strcat('estimated time to complete flat correction is 0',num2str(tm*length(dat)-1),' seconds'));
    end
end
 
%------------------------------now create master flat ---------------------


tmp=zeros(dat_siz);
for i=1:length(dat)
    tmp=fitsread(strcat(loc,'curve_corrected',filesep,dat(i).name))+tmp;
end
tmp=tmp/i;
for i=1:10
    loc1=round(xxx(i));

    avgfe1=squeeze(mean(tmp(loc1-50:loc1-21,:,:),2));%this is avg iron line profile
    %at 6302.5 taken all along the slit
  if loc1+50>2048
      avgfe2=squeeze(mean(tmp(loc1+15:2048,:,:),2));%this problem is only for the last slit
  else
    avgfe2=squeeze(mean(tmp(loc1+15:loc1+50,:,:),2));%this is avg iron line profile
    %at 6301.5 taken all along the slit
  end
  if loc1-63<1
      avgte1=squeeze(mean(tmp(1:loc1-50,:,:),2));%this problem is only for 1st slit
  else
    avgte1=squeeze(mean(tmp(loc1-63:loc1-50,:,:),2));%this is avg iron line profile
    %at 6303 taken all along the slit
  end

    avgte2=squeeze(mean(tmp(loc1-10:loc1+10,:,:),2));%this is avg iron line profile
    %at 6302 taken all along the slit

    

    if tel_sel %this option is selected to preserve telluric line. If it is 0 then telluric line will be removed from the data
        for j=1:2048
            for k=1:dat_siz(3)
            tmp(loc1-50:loc1-21,j,k)=squeeze(tmp(loc1-50:loc1-21,j,k))./(avgfe1(:,k)/max(avgfe1(:,k)));%remove 1st fe line at 6302.5 and replace with 6302.5 to 6302 continum
            if loc1+50>2048
                tmp(loc1+15:2048,j,k)=squeeze(tmp(loc1+15:2048,j,k))./(avgfe2(:,k)/max(avgfe2(:,k)));
            else
            tmp(loc1+15:loc1+50,j,k)=squeeze(tmp(loc1+15:loc1+50,j,k))./(avgfe2(:,k)/max(avgfe2(:,k)));%remove 2nd fe line at 6301.5 and replace with 6302 to 6301.5 continum
            end
            if loc1-63<1
                tmp(1:loc1-50,j,k)=squeeze(tmp(1:loc1-50,j,k))./(avgte1(:,k)/max(avgte1(:,k)));
            else
            tmp(loc1-63:loc1-50,j,k)=squeeze(tmp(loc1-63:loc1-50,j,k))./(avgte1(:,k)/max(avgte1(:,k)));%remove 1st telluric line at 6303
            end
            tmp(loc1-10:loc1+10,j,k)=squeeze(tmp(loc1-10:loc1+10,j,k))./(avgte2(:,k)/max(avgte2(:,k)));%remove 2nd telluric line at 6302
            end
             

        end
    else
         for j=1:2048
             for k=1:dat_siz(3)
             tmp(loc1-50:loc1-21,j,k)=tmp(loc1-50:loc1-21,j,k)./(avgfe1(:,k)/max(avgfe1(:,k)));%remove 1st fe line at 6302.5 and replace with 6302.5 to 6302 continum
             if loc1+50>2048
                 tmp(loc1+15:2048,j,k)=tmp(loc1+15:2048,j,k)./(avgfe2(:,k)/max(avgfe2(:)));
             else
             tmp(loc1+15:loc1+50,j,k)=tmp(loc1+15:loc1+50,j,k)./(avgfe2(:,k)/max(avgfe2(:)));%remove 2nd fe line at 6301.5 and replace with 6302 to 6301.5 continum
             end
            
             end

         end
    end
end

tmp(tmp==0)=1e5;%set it to a very large value so that it won't affect ur data

master_flat=tmp;
fitswrite(master_flat,strcat(loc,'curve_corrected',filesep,'master_flat.fits'));
%---------------------------master flat is being created-------------------


%-------------------------for data-----------------------------------------


xxx=x;
    curv=fitsread(strcat(loc,'line_pos_data.fits'));
    curv(isinf(curv))=0;
    curv(isnan(curv))=0;
    curv(curv>2048)=2048-59;%my window starts from 97 and goes up to 59
    curv(curv<0)=97;
    dat=dir(strcat(loc,'data_*'));
for ct=1:length(dat)%for all files
        a=fitsread(strcat(loc,dat(ct).name));
        for cnt=1:dat_siz(3) %for I1, I2, I3, I4
    
    for i=1:length(x)
       
        if i==1 || i==2
            w=zeros(2048,1);
            w(800:1600)=10;
        else
             w=ones(2048,1);
             w(50:1910)=10;
        end
        crv{i,cnt,ct}=fit([1:2048]',squeeze(curv(i,:,cnt,ct))','poly2','weights',w);%i am saving it for all files so that it can be used for future
    end

          
        end
clear tmp
img=zeros(2048,2048,dat_siz(3));
tic
for cnt=1:dat_siz(3)
 
    for i=1:length(x)
        tst=crv{i,cnt,ct}(1:2048);%this is the telluric line curve
        for j=1:2048
            tmp(:,j,cnt)=fshift(a(:,j,cnt),tst(y(1))-tst(j));%shift with respect to a given y location selected on the 1st point 
        end
        
        
        tst=floor(tst);
            [~,mval]=min(tmp(tst(y(1))-10:tst(y(1))+10,y(1),cnt),[],1);
            mval=mval+tst(y(1))-10-1;
            tst(y(1))=mval;%to locate the minimum position of gaussian
            p1=-tmp(tst(y(1)),y(1),cnt);
            p2=max(tmp(tst(y(1))-10:tst(y(1))+10,y(1),cnt));
            mn=fit([tst(y(1))-10:tst(y(1))+10]',tmp(tst(y(1))-10:tst(y(1))+10,y(1),cnt),ft,'StartPoint',[-10000,tst(y(1)),1,0],'Lower',[-10000,tst(y(1))-2,0.5,0],'Upper',[0,tst(y(1))+2,2.5,10000]);
            tmp(:,:,cnt)=FourierShift2D(tmp(:,:,cnt),[xxx(i)-mn.b,0]);

%              p1=-tmp(xxx(i),1000,1);
%             p2=max(a(xxx(i)-10:xxx(i)+10,1000,1));
%              mn=fit([xxx(i)-10:xxx(i)+10]',tmp(xxx(i)-10:xxx(i)+10,1000,1),ft,'StartPoint',[p1,xxx(i),1,p2],'Lower',[p1+p1/3,xxx(i)-2,0.5,p2-(p2-p1)/3],'Upper',[p1-p1/3,xxx(i)+2,2,p2+(p2-p1)/3]);
%              tmp(:,:,cnt)=FourierShift2D(tmp(:,:,cnt),[xxx(i)-mn.b,0]);
        
         
       
        

        if tst(y(1)) < 98
            img(1:xxx(i)+56,:,cnt)=FourierShift2D(tmp(1:xxx(i)+56,:,cnt),[0,o(i,4)]);
        elseif tst(y(1)) > 1989
            img(xxx(i)-97:2048,:,cnt)=FourierShift2D(tmp(xxx(i)-97:2048,:,cnt),[0,o(i,4)]);
        else
            img(xxx(i)-97:xxx(i)+56,:,cnt)=FourierShift2D(tmp(xxx(i)-97:xxx(i)+56,:,cnt),[0,o(i,4)]);
        end
    end
end

a=img;
%---------------------correcting camera tilt----------------------------
tmpv=zeros(size(a));
    for j=1:10
        if x(j)-97 < 1
            tmp=a(1:x(j)+56,:,:);
            for k=1:size(tmp,1)
                tmp(k,:,:)=reshape(FourierShift2D(reshape(tmp(k,:,:),dat_siz(2),dat_siz(3)),[-ft_ln.p1*(77-size(tmp,1)+k-1),0]),1,dat_siz(2),dat_siz(3));
            end
            tmpv(1:x(j)+56,:,:)=tmp;
        elseif x(j)+56 > 2048
            tmp=a(x(j)-97:2048,:,:);
            for k=1:size(tmp,1)
                tmp(k,:,:)=reshape(FourierShift2D(reshape(tmp(k,:,:),dat_siz(2),dat_siz(3)),[-ft_ln.p1*(k-78),0]),1,dat_siz(2),dat_siz(3));
            end
            tmpv(x(j)-97:2048,:,:)=tmp;
        else
            tmp=a(x(j)-97:x(j)+56,:,:);
            for k=1:size(tmp,1)
                tmp(k,:,:)=reshape(FourierShift2D(reshape(tmp(k,:,:),dat_siz(2),dat_siz(3)),[-ft_ln.p1*(k-78),0]),1,dat_siz(2),dat_siz(3));
            end
            tmpv(x(j)-97:x(j)+56,:,:)=tmp;
        end
    end
       img=tmpv;
     
    
    fitswrite(img,strcat(loc,'curve_corrected',filesep,dat(ct).name));
    
    if dat_siz(3)==1 %only for spectroscopy flat corrected data is generated here. For spectro polarimetry
        %master flat is demodulated to get I,Q,U,V then that strokes I is used to flatten all images 
    dsp=dftregistration(fft2(img(x(5)-30:x(5)+30,:,1)),fft2(master_flat(x(5)-30:x(5)+30,:,1)),500);
    for i=1:dat_siz(3)
        flat(:,:,i)=FourierShift2D(master_flat(:,:,i),[0,dsp(4)]);
    end
    %fitswrite(master_flat,strcat(loc,'curve_corrected',filesep,'master_flat.fits'))
    
    fitswrite(img./flat,strcat(loc,'curve_corrected',filesep,'flat_corrected',filesep,dat(ct).name))
    end
    tm=toc;
    if ct==1
        disp(strcat('estimated time to complete data correction is 0',num2str(tm*length(dat)),' seconds'));
    end
    end
    

end
