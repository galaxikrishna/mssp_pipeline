d=dir('data*');
for i=1:240
tmp=fitsread(d(i).name);
tmp=tmp(:,:,1)';
for j=1:5
o(i+240*(6-j)+1,:)=tmp(:,x(2*j-1));
e(i+240*(6-j)+1,:)=tmp(:,x(2*j));
end
end