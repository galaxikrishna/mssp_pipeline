%----------------------calibration unit matrix generation------------------

%it is found that only 7 files are useful for analysis. file num
%0,1,2,3,5,6,7. file num 4 is same as 0th file and is redundant. We dont
%have complete 180 deg rotation so files beyond 7 are not of complete use
%hence tey are discarded too


function polcal_mssp(loc,dat_siz)
dat=dir(strcat(loc,'curve_corrected',filesep,'polcal_*'));
fil_read=[1,2,3,4,6,7,8];%files to be read
th=[-180,-157.5,-135,-112.5,-67.5,-45,-22.5];%retarder angles for those files
%th=[8,27,32,16,78];
%d1=[45,135,135,225];%ret of lcvr1
d1=[61.0496,151.8356,151.8356,235.1809];%new suspected values
%d2=[54.74,125.26,234.74,54.74];%ret of lcvr2
d2=[51.4326,111.6751,216.4352,51.4326];%new suspected values

cnt=1;
%for i=1:length(th)
for i=1:length(fil_read) %4 times cos each file has 4 measurements
    for j=1:4
    mat(cnt,:)=polcal_mssp_row_gen(87.643,d1(j),d2(j),th(i));%this forms n x 16 modulation matrix
    cnt=cnt+1;
    end
end
stacked=zeros(cnt-1,dat_siz(1),dat_siz(2));

cnt=1;
for i=1:length(fil_read)
a=fitsread(strcat(loc,'curve_corrected',filesep,dat(fil_read(i)).name));
for j=1:4
    stacked(cnt,:,:)=a(:,:,j);%this forms  n * imgsz_x * imgsz_y  matrix
    cnt=cnt+1;
end
end
stacked=squeeze(reshape(stacked,cnt-1,[]));
final_mat=mat\stacked; %inv(mat) * stacked => (16 * n) X (n * imgsz_x * imgsz_y) => 16 * imgsz_x * imgsz_y
%so final_mat contains the muller matrix of each pixel
% stacked=zeros(size(final_mat));
% final_mat=reshape(final_mat,16,dat_siz(1),dat_siz(2));
% for i=1:length(x)
%     stacked(:,(x(i)-5)-17:(x(i)+5)+20,:)=final_mat(:,(x(i)-5)-17:(x(i)+5)+20,:);
% end
    
%final_mat=reshape(final_mat,4,4,dat_siz(1),dat_siz(2));

for i=16:-1:1
final_mat(i,:)=final_mat(i,:)./final_mat(1,:);
end
final_mat=reshape(final_mat,4,4,dat_siz(1),dat_siz(2));

fitswrite(final_mat,strcat(loc,'curve_corrected',filesep,'ref_muller_mat.fits'));
end



%polcal_mssp_row_gen generates a row vector for given d,d1,d2,th. We need
%atleast 16 such measurements i;e 16 combo of d,d1,d2,th. In our polcal d
%is fixed at 87.643deg

function out=polcal_mssp_row_gen(d,d1,d2,th)%d = crystar retardar's retardance, d1=lcvr1 retardance
%d2=lcvr2 retardance, th=crystal retarder angle

g(1)=1;
g(2)=-sind(d1)*sind(d2);
g(3)=cosd(d2);
g(4)=-cosd(d1)*sind(d2);
x(1)=1;
x(2)=0.5*(1+cosd(d))+0.5*(1-cosd(d))*cosd(4*th);
x(3)=0.5*(1-cosd(d))*sind(4*th);
x(4)=sind(d)*sind(2*th);

cnt=1;
out=zeros(1,16);
for i=1:4
    for j=1:4
        out(cnt)=g(i)*x(j);
        cnt=cnt+1;
    end
end
end