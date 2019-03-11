%(l,k) are x and y values of centroid. It will have 2 elements
% 1st is for 1 gaussian 2nd is for the next gaussian
% generated due to dual beam from beam splitter. img
% is the image of dual beam and split is the X-position where the 2 beams are saperated. This 
%will be the point upto which the 1st portion of the code will consider to
%fit the gaussian and the other portion is considered by the 2nd part of
%the code for gaussfit
%NOTE this code was originally written for fitsread command so if u find
%and discripency in x and y values send "transpose" of img
function [l,k]=calib1(img,split)
 data=zeros(size(img));
 data(1:split,:)=img(1:split,:); %this is 1st section of the image
 I=int16(data);%int16(load(char(file)));
 BW = im2bw(I, graythresh(I));
[x,y]= find(BW);
x0=min(x);y0=min(y);%2-sigma val
x1=max(x);y1=max(y);
z=data(x0:x1,y0:y1);
xm=((x1-x0)/2)+x0;
ym=((y1-y0)/2)+y0;%the mean values
xs=(x1-x0)/2;ys=(y1-y0)/2;%sigma values
d=median(median(data));%constant or noise floor
amp=data(round(xm),round(ym));
p  = reshape(z,[],1);
[v,w]=ndgrid(x0:x1,y0:y1);
v= reshape(v,[],1);
w =reshape(w,[],1);
g=fittype('ampt*exp(-((v-xm).^2/xs.^2+(w-ym).^2/ys.^2))+d','independent',{'v','w'},'dependent',{'p'},'coefficients',{'ampt','ym','xm','ys','xs','d'});
surffit = fit([v,w],p,g,'Lower',[0.5*amp,0.5*ym,0.5*xm,0.5*ys,0.5*xs,0.5*d],'StartPoint',[amp,ym,xm,ys,xs,d], 'Upper',[5*amp,1.2*ym,1.2*xm,2*ys,2*xs,3*d+1]);
  k(1)=surffit.ym;
  l(1)=surffit.xm;
  
  
  %now for gaussfit of 2nd part of the image
  
   data=zeros(size(img));
 data(split:end,:)=img(split:end,:); %this is 2nd section of the image
 I=int16(data);%int16(load(char(file)));
 BW = im2bw(I, graythresh(I));
[x,y]= find(BW);
x0=min(x);y0=min(y);%2-sigma val
x1=max(x);y1=max(y);
z=data(x0:x1,y0:y1);
xm=((x1-x0)/2)+x0;
ym=((y1-y0)/2)+y0;%the mean values
xs=(x1-x0)/2;ys=(y1-y0)/2;%sigma values
d=median(median(data));%constant or noise floor
amp=data(round(xm),round(ym));
p  = reshape(z,[],1);
[v,w]=ndgrid(x0:x1,y0:y1);
v= reshape(v,[],1);
w =reshape(w,[],1);
g=fittype('ampt*exp(-((v-xm).^2/xs.^2+(w-ym).^2/ys.^2))+d','independent',{'v','w'},'dependent',{'p'},'coefficients',{'ampt','ym','xm','ys','xs','d'});
surffit = fit([v,w],p,g,'Lower',[0.5*amp,0.5*ym,0.5*xm,0.5*ys,0.5*xs,0.5*d],'StartPoint',[amp,ym,xm,ys,xs,d], 'Upper',[5*amp,1.2*ym,1.2*xm,2*ys,2*xs,3*d+1]);
  k(2)=surffit.ym;
  l(2)=surffit.xm;
  