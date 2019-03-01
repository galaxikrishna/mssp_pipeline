pro invert_ready_image,pat,im
im=fltarr(1050,154,4,1050)
tmp=fltarr(1050,154,4,5)

spawn,'dir /b '+pat+'\data*',dat

for i=0,n_elements(dat)-1 do begin 
  a=readfits(pat+'\'+dat(i))
  for j=0,3 do begin
    for k=0,4 do begin
     tmp(*,*,j,k)=supershifter(reform(congrid(a(*,*,j,k),1050,154)),-i*11.0/210.0)
    endfor
  endfor
  im(*,*,*,i+210*4)=tmp(*,*,*,0)
  im(*,*,*,i+210*3)=tmp(*,*,*,1)
  im(*,*,*,i+210*2)=tmp(*,*,*,2)
  im(*,*,*,i+210*1)=tmp(*,*,*,3)
  im(*,*,*,i+210*0)=tmp(*,*,*,4)
endfor
im=transpose(im,[3,0,1,2])
v=mean(im(*,300:400,-1,0),dimension=2)

for i=0,153 do begin
im(*,*,i,0)=(im(*,*,i,0)/repmat(v,1,1050))
endfor
end
im=reverse(im,3)