im=(zeros(154,1050,4,1050));%initialise variable to store data 
for i=1:length(dat)
a=fitsread(dat(i).name);
for j=1:4
for k=1:5
tmp(:,:,j,k)=FourierShift2D(imresize(a(:,:,j,k),[154,1050]),[0,-i*11/210]);
end
end
im(:,:,:,i+210*4)=tmp(:,:,:,1);
im(:,:,:,i+210*3)=tmp(:,:,:,2);
im(:,:,:,i+210*2)=tmp(:,:,:,3);
im(:,:,:,i+210*1)=tmp(:,:,:,4);
im(:,:,:,i+210*0)=tmp(:,:,:,5);
end
im=permute(im,[2,4,1,3]);
v=mean(im(300:400,:,end,1),1);

for i=1:size(im,3)
im(:,:,i,1)=(im(:,:,i,1)./repmat(v,1050,1));
end
