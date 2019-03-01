function new_pol_img_generator(loc,x)

dat=dir(strcat(loc,'curve_corrected',filesep,'flat_corrected',filesep,'data*'));

for ct=1:length(dat)
    a=fitsread(strcat(loc,'curve_corrected',filesep,'flat_corrected',filesep,dat(ct).name));
    for i=1:4
        a(:,:,i)=FourierShift2D(a(:,:,i),[0,-15*ct/230]);
    end
    ai=0.25*sum(a,3);
    aq=0.433*(a(:,:,1)+a(:,:,2)-a(:,:,3)-a(:,:,4))./ai;
    au=0.433*(a(:,:,1)-a(:,:,2)-a(:,:,3)+a(:,:,4))./ai;
    av=0.433*(a(:,:,1)-a(:,:,2)+a(:,:,3)-a(:,:,4))./ai;
    tmpq=aq;
    tmpu=au;
    aq=aq-1.3*av;
    au=au+1.4*av;
    av=av+tmpq-tmpu;
   tmpo=zeros(154,2048,4,5);
   tmpe=tmpo;
for i=1:10 
    if x(i)-98<1 %only the 1st slit will have this problem
         tmpo(1+(98-x(i)):154,:,1,(i+1)/2)=ai(1:x(i)+56,:);
         tmpo(1+(98-x(i)):154,:,2,(i+1)/2)=aq(1:x(i)+56,:);
         tmpo(1+(98-x(i)):154,:,3,(i+1)/2)=au(1:x(i)+56,:);
         tmpo(1+(98-x(i)):154,:,4,(i+1)/2)=av(1:x(i)+56,:);
         %i can use x directly over here as its lower value and happens only for 1st slit  
    elseif x(i)+56>2048
        tmpe(1:154-(2048-x(i)),:,1,(i)/2)=ai(x(i)-97:2048,:);
        tmpe(1:154-(2048-x(i)),:,2,(i)/2)=aq(x(i)-97:2048,:);
        tmpe(1:154-(2048-x(i)),:,3,(i)/2)=au(x(i)-97:2048,:);
        tmpe(1:154-(2048-x(i)),:,4,(i)/2)=av(x(i)-97:2048,:);
        %this happens only for last slit hence its i/2 and not (i+1)/2 also its
        %e-ray so tmpe and not tmpo
    else
        if rem(i,2)==0
                tmpe(:,:,1,i/2)=ai(x(i)-97:x(i)+56,:);
                tmpe(:,:,2,i/2)=aq(x(i)-97:x(i)+56,:);
                tmpe(:,:,3,i/2)=au(x(i)-97:x(i)+56,:);
                tmpe(:,:,4,i/2)=av(x(i)-97:x(i)+56,:);
        else
            tmpo(:,:,1,(i+1)/2)=ai(x(i)-97:x(i)+56,:);
            tmpo(:,:,2,(i+1)/2)=aq(x(i)-97:x(i)+56,:);
            tmpo(:,:,3,(i+1)/2)=au(x(i)-97:x(i)+56,:);
            tmpo(:,:,4,(i+1)/2)=av(x(i)-97:x(i)+56,:);
        end
    end
end

tmpo(:,:,1,:)=(tmpo(:,:,1,:)+tmpe(:,:,1,:))/2;
for i=2:4
    tmpo(:,:,i,:)=(tmpo(:,:,i,:)-tmpe(:,:,i,:))/2;
end
fitswrite(tmpo,strcat(loc,'curve_corrected',filesep,'strokes_data',filesep,dat(ct).name));
end