%this is exactly same as polcal_mssp_prep.m but uses flat field's spectral
%curvature. As signal in some of polcal images are too low to perform
%decent curve fit we use this work around. This is faster and reliablly more accurate 


%math for current polcal unit is written in my observation log book. This
%code is based on those calculations. I perform curve correction saperately
%on it coz polcal need not be taken for every observation. User has to
%choose according to the situation and needs

%----------------firstcorrect spectral curvature---------------------------
function polcal_mssp_prep_fast(loc,slop,x,y,o,dat_siz)


    ft=fittype('a*exp(-(x-b)^2/(2*c^2))+d');
    xxx=x;
    curv=fitsread(strcat(loc,'line_pos_flat.fits'));%we assume number of flat files are more than polcal files
    curv(isinf(curv))=0;
    curv(isnan(curv))=0;
    curv(curv>2048)=2048-59;%my window starts from 97 and goes up to 59
    curv(curv<0)=97;
    dat=dir(strcat(loc,'polcal_*'));
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
        
         
       
        

        if xxx(i) < 98
            img(1:xxx(i)+56,:,cnt)=FourierShift2D(tmp(1:xxx(i)+56,:,cnt),[0,o(i,4)]);
        elseif xxx(i) > 1989
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
                tmp(k,:,:)=reshape(FourierShift2D(squeeze(tmp(k,:,:)),[-slop*(77-size(tmp,1)+k-1),0]),1,dat_siz(2),dat_siz(3));
            end
            tmpv(1:x(j)+56,:,:)=tmp;
        elseif x(j)+56 > 2048
            tmp=a(x(j)-97:2048,:,:);
            for k=1:size(tmp,1)
                tmp(k,:,:)=reshape(FourierShift2D(squeeze(tmp(k,:,:)),[-slop*(k-78),0]),1,dat_siz(2),dat_siz(3));
            end
            tmpv(x(j)-97:2048,:,:)=tmp;
        else
            tmp=a(x(j)-97:x(j)+56,:,:);
            for k=1:size(tmp,1)
                tmp(k,:,:)=reshape(FourierShift2D(squeeze(tmp(k,:,:)),[-slop*(k-78),0]),1,dat_siz(2),dat_siz(3));
            end
            tmpv(x(j)-97:x(j)+56,:,:)=tmp;
        end
    end
       img=tmpv;
     
    
    fitswrite(img,strcat(loc,'curve_corrected',filesep,dat(ct).name));
end