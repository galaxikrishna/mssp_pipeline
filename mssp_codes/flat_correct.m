%This is jst a test code and actual flat fielding is included within
%spectra_curve_corrector.m itself
function tmp=flat_correct(loc,x,dat_siz,tel_sel)%here tel_sel is used to preserve telluric line
%or remove it.
xxx=x;
mkdir(strcat(loc,'curve_corrected',filesep,'flat_corrected'));
dat=dir(strcat(loc,'curve_corrected',filesep,'flat_0*'));
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
