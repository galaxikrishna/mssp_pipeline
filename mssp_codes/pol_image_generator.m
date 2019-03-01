%user can modify this code according to his needs. The pol is found to be
%consistant along the slit. There is no major variation from slit to slit
%either. Using this as the basis a final muller matrix of beam path is
%generated which is then used in generating demodulation matrix 

function [do,de]=pol_image_generator(loc,x,dat_siz)

%---Theoritical telescope muller matrix. Workes well as of july 2017.
%We suspect that the coating is bare silver. Future recoating may introduce
%oxide layers as recoating process for the mirrors are unknown. So coating in inert 
%gas environment is most important to preserve the telescope polarisatioin
%understanding of MAST.-------------------%
[azi,alt,p]=SolarAzEl(datetime(2016,12,24,12,58,35),24.6043,0,0);
telmat=mast_mulmat(alt,azi,p,0.056862,4.2559);%input is alt,azi, tilt of sun's north pole, Refractive index (n,k) 
% telmat=[0.8484   -0.0599   -0.0072    0.0296
%     0.0420   -0.1914   -0.4103    0.7156
%    -0.0463    0.7812    0.1488    0.2916
%    -0.0248    0.2683   -0.7244   -0.3451];
% telmat=[0.8487   -0.0550    0.0168    0.0410
%     0.0371   -0.0802   -0.3038    0.7861
%    -0.0510    0.8434   -0.0095    0.0799
%    -0.0318    0.0219   -0.7894   -0.3043];
% telmat=[    0.8482   -0.0367   -0.0484    0.0226
%     0.0607   -0.2041   -0.7512    0.3361
%    -0.0118    0.4500    0.1880    0.6911
%    -0.0196    0.6874   -0.3434   -0.3538];
%telmat=eye(4,4);
mulmat=fitsread(strcat(loc,'curve_corrected',filesep,'ref_muller_mat.fits'));
mulmat(isnan(mulmat))=0;
mulmat(isinf(mulmat))=0;
%mulmat=permute(mulmat,[2,1,3,4]);% 2,1 permute rectifies the row - column change introduced due
%to reshaping from 16 to 4 X 4 and 4,3 permute rectifies the image i;e the
%transpose of the image is taken
a1=[45 135 135 225];
a2=[54.74 125.26 234.74 54.74];
mulmat=mean(mulmat(:,:,:,1024-150:1024+150),4);%only 300 pixels about 
%the center is taken, remaining section of the image is discarded
for i=1:length(x)
    mat(:,:,i)=(mean(mulmat(:,:,(x(i)-5)-17:(x(i)-5)),3)+mean(mulmat(:,:,(x(i)+5):(x(i)+5)+20),3))./2;%continum around
    %the central telluric line is taken and the rest of the image is neglected.
    %mat is the final muller matrix of each of the 10 slits
end

for j=1:10
for i=1:4
    if rem(j,2)==0;
m=polariser(135)*retarder(a2(i),90)*retarder(a1(i),45)*mat(:,:,j)*telmat;%2nd retarder should be at 90 
%not at 0 as calculations are done keeping that in mind.
me(i,:,j/2)=m(1,:);
    else
        m=polariser(45)*retarder(a2(i),90)*retarder(a1(i),45)*mat(:,:,j)*telmat;%2nd retarder should be at 90 
%not at 0 as calculations are done keeping that in mind.
mo(i,:,(j+1)/2)=m(1,:);
    end
end
end
%mm(4,4,:)=-1;%I found that the value is higher than 1 hence the value is forced back to 1

for j=1:5
    do(:,:,j)=squeeze(inv(mo(:,:,j)));
    de(:,:,j)=squeeze(inv(me(:,:,j)));%demodulation matrix is generated
end

%----------after generating demodulation matrix pol images are generated------------

dat=dir(strcat(loc,'curve_corrected',filesep,'data_*'));
%first flat's strokes I is needed
flat=fitsread(strcat(loc,'curve_corrected',filesep,'master_flat.fits'));
[oray,eray]=polimag_subroutine(do,de,x,flat,dat_siz);
flto=oray(:,:,1,:);%oray slit's flat
flte=eray(:,:,1,:);%eray slit's flat
flat=zeros(dat_siz(1),dat_siz(2));

for i=1:10
if x(i)<98%1st slit willhave this problem so flto is used
    flat(1:56+x(i),:)=flto(1+(98-x(1)):154,:,1,i);
elseif x(i)>1992%last slit will have this problem so flte is used
    flat(x(i)-97:2048,:)=flte(1:(2048-x(end))+98,:,1,i/2);
else
    if rem(i,2)==0
        flat(x(i)-97:x(i)+56,:)=flte(:,:,1,i/2);
    else
        flat(x(i)-97:x(i)+56,:)=flto(:,:,1,(i+1)/2);
    end
end
end
flat(flat==0)=1;
flat=repmat(flat,1,1,4);
%--------------------------------------now we start data reduction-------------------------
disp('Polarimetric data is being generated...........');
mkdir(strcat(loc,'curve_corrected',filesep,'strokes_data'));
for i=73:length(dat)
    %data=fitsread(strcat(loc,'curve_corrected',filesep,'flat_corrected',filesep,dat(i).name));
    data=fitsread(strcat(loc,'curve_corrected',filesep,dat(i).name));
    data=data./flat;
    for cr=1:4%this corrects the lateral shift due to scanning at an angle scan
        data(:,:,cr)=FourierShift2D(data(:,:,cr),[0,-15*i/230]);
    end
    [oray,eray]=polimag_subroutine(do,de,x,data,dat_siz);
    %test=inv(mat(:,:,2)')*reshape(permute(oray,[3,1,2,4]),4,[]);
    oray(:,:,2:4,:)=oray(:,:,2:4,:)./repmat(oray(:,:,1,:),[1,1,3,1]);
    eray(:,:,2:4,:)=eray(:,:,2:4,:)./repmat(eray(:,:,1,:),[1,1,3,1]);
    %---------------temporarily added crosstalk removal values -------------------%
%     tqo=oray(:,:,2,:);%these 4 "t" variables are temporary and are used to remove crosstalk into V
%     tqe=eray(:,:,2,:);
%     tuo=oray(:,:,3,:);
%     tue=eray(:,:,3,:);
%     oray(:,:,2,:)=oray(:,:,2,:)-1.3*oray(:,:,4,:);
%     eray(:,:,2,:)=eray(:,:,2,:)-1.3*eray(:,:,4,:);
%     oray(:,:,3,:)=oray(:,:,3,:)+1.3*oray(:,:,4,:);
%     eray(:,:,3,:)=eray(:,:,3,:)+1.3*eray(:,:,4,:);
%     oray(:,:,4,:)=oray(:,:,4,:)+tqo-tuo;
%     eray(:,:,4,:)=eray(:,:,4,:)+tqe-tue;
    %-----------------------------------------------------------------------------%
    for j=2:4
        oray(:,:,j,:)=(oray(:,:,j,:)-eray(:,:,j,:))/4;%2 for averaging and 2 for demodulation which wasnt included 
    end
    tmp=oray(:,:,3,:);
    oray(:,:,3,:)=oray(:,:,4,:);
    oray(:,:,4,:)=tmp;%This places strokes images in the order I,Q,U,V
    %fitswrite(oray,strcat(loc,'curve_corrected',filesep,'strokes_data',filesep,dat(i).name)); 
end
end



%-------------------strokes IQUV generation subroutine----------------------------------------

function [tmpo,tmpe]=polimag_subroutine(do,de,x,data,dat_siz)%do is demodulation matrix of oray, de is demodulation ,matrix of eray
    %x is location of slits or telluric line , data is the data to be
    %reduced dat_siz is the size of that data
a=data;
%a=fitsread(strcat(loc,'curve_corrected',filesep,'master_flat.fits'));
tmpo=zeros(154,dat_siz(2),4,5);% the format is (x,y,stroke's,slit)
tmpe=zeros(154,dat_siz(2),4,5);%same stuff for e-ray

for i=1:10 
    if x(i)-98<1 %only the 1st slit will have this problem
        for j=1:4
            v=zeros(size(a(1:x(i)+56,:,1)));
            for k=1:4
                v=do(j,k,(i+1)/2)*a(1:x(i)+56,:,k)+v;
            end
         tmpo(1+(98-x(i)):154,:,j,(i+1)/2)=v;%i can use x directly over here as its lower value and happens only for 1st slit
        end
    elseif x(i)+56>2048
        
        for j=1:4
            v=zeros(size(a(x(i)-97:2048,:,1)));
            for k=1:4
                v=de(j,k,(i)/2)*a(x(i)-97:2048,:,k)+v;
            end
        tmpe(1:size(v,1),:,j,(i)/2)=v;%this happens only for last slit hence its i/2 and not (i+1)/2 also its
        %e-ray so tmpe and not tmpo
        end
    else
        if rem(i,2)==0
            for j=1:4
            v=zeros(size(a(1:154,:,1)));
            for k=1:4
                v=de(j,k,(i)/2)*a(x(i)-97:x(i)+56,:,k)+v;
            end
                tmpe(:,:,j,i/2)=v;
            end
        else
             for j=1:4
            v=zeros(size(a(1:154,:,1)));
            for k=1:4
                v=do(j,k,(i+1)/2)*a(x(i)-97:x(i)+56,:,k)+v;
            end
            tmpo(:,:,j,(i+1)/2)=v;
             end
        end
    end
end
end   
    %now tmpo and tmpe have I,Q,U,V of master_flat. Strokes I will be used
    %for flat fielding
   
    