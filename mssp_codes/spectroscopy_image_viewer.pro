;this can be used on curve corrected data. To see the region at different wavelengths

for i=0,239 do begin & $
  tmp=transpose(supershifter((readfits('G:\mohan_data\specpol_apr27_with_tiptilt\spectroscopy\curve_corrected\'+dat(i))),i*11.0/210,0)) & $
  im1(i+240*4,*,*)=reform(transpose(tmp(96-54:96+55,*)),1,2048,110)& $ ;96 etc are points at which telluric line is present. This is got 
  im1(i+240*3,*,*)=reform(transpose(tmp(518-54:518+55,*)),1,2048,110)& $ ;from line_pos.txt file 
  im1(i+240*2,*,*)=reform(transpose(tmp(934-54:934+55,*)),1,2048,110)& $
  im1(i+240*1,*,*)=reform(transpose(tmp(1343-54:1343+55,*)),1,2048,110)& $
  im1(i+240*0,*,*)=reform(transpose(tmp(1745-54:1745+55,*)),1,2048,110)& $
  endfor