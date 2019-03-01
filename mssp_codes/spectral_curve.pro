pro spectral_curve,dat_path ;the program should be in the folder having data ans line_pos.txt file. Inputs are current path 
cd,dat_path
readcol,'line_pos.txt',a,b
a=floor(a)-1
b=floor(b)-1

spawn,'dir /b data_*',dat
im=size(readfits(dat(0)))
if im(0) eq 2 then begin
curv=fltarr(2048,n_elements(a),1,n_elements(dat))
itr_num=0 ;this is for the loop to go through 4 elements or 1 element
endif else begin
curv=fltarr(2048,n_elements(a),4,n_elements(dat))
itr_num=3
endelse
for ct=0,n_elements(dat)-1  do begin
im=readfits(dat(ct))
tmp=im
for i=0,itr_num do begin
im(*,*,i)=transpose(reform(tmp(*,*,i)))
endfor
tmp=0
for cnt=0,itr_num do begin
tmp=0
for i=0,n_elements(a)-1 do begin
tmp=a(i)
for j=b(i),2047 do begin
dummy=min(im(tmp-10:tmp+10,j,cnt),tmp1)
tmp=tmp-10+tmp1 
if tmp lt 10 || tmp gt 2036 then tmp=10
res=gaussfit(findgen(21)+tmp-10,im(tmp-10:tmp+10,j,cnt),coef,nterms=4,estimates=[-im(tmp,j,cnt),tmp,1.25,max(im(tmp-10:tmp+10,j,cnt))])
curv(j,i,cnt,ct)=coef(1);curv is stored ad j,i,*,* coz matlab interchanges the 1st and 2nd dimension
endfor
tmp=a(i)
for j=b(i),0,-1 do begin
dummy=min(im(tmp-10:tmp+10,j,cnt),tmp1)
tmp=tmp-10+tmp1 
if tmp lt 10 || tmp gt 2036 then tmp=10
res=gaussfit(findgen(21)+tmp-10,im(tmp-10:tmp+10,j,cnt),coef,nterms=4,estimates=[-im(tmp,j,cnt),tmp,1.2,max(im(tmp-10:tmp+10,j,cnt))])
curv(j,i,cnt,ct)=coef(1)
endfor

endfor
endfor
print,'done '+num2str(ct)+' data-files'
endfor

writefits,'line_pos_data.fits',curv




;-------------

spawn,'dir /b flat_*',dat
im=size(readfits(dat(0)))
if im(0) eq 2 then begin
curv=fltarr(2048,n_elements(a),1,n_elements(dat))
itr_num=0 ;this is for the loop to go through 4 elements or 1 element
endif else begin
curv=fltarr(2048,n_elements(a),4,n_elements(dat))
itr_num=3
endelse
for ct=0,n_elements(dat)-1  do begin
im=readfits(dat(ct))
tmp=im
for i=0,itr_num do begin
im(*,*,i)=transpose(reform(tmp(*,*,i)))
endfor
tmp=0
for cnt=0,itr_num do begin
tmp=0
for i=0,n_elements(a)-1 do begin
tmp=a(i)
for j=b(i),2047 do begin
dummy=min(im(tmp-10:tmp+10,j,cnt),tmp1)
tmp=tmp-10+tmp1 
if tmp lt 10 || tmp gt 2036 then tmp=10
res=gaussfit(findgen(21)+tmp-10,im(tmp-10:tmp+10,j,cnt),coef,nterms=4,estimates=[-im(tmp,j,cnt),tmp,1.25,max(im(tmp-10:tmp+10,j,cnt))])
curv(j,i,cnt,ct)=coef(1);curv is stored ad j,i,*,* coz matlab interchanges the 1st and 2nd dimension
endfor
tmp=a(i)
for j=b(i),0,-1 do begin
dummy=min(im(tmp-10:tmp+10,j,cnt),tmp1)
tmp=tmp-10+tmp1 
if tmp lt 10 || tmp gt 2036 then tmp=10
res=gaussfit(findgen(21)+tmp-10,im(tmp-10:tmp+10,j,cnt),coef,nterms=4,estimates=[-im(tmp,j,cnt),tmp,1.2,max(im(tmp-10:tmp+10,j,cnt))])
curv(j,i,cnt,ct)=coef(1)
endfor

endfor
endfor
print,'done '+num2str(ct)+' flat-files'
endfor

writefits,'line_pos_flat.fits',curv

exit
end
