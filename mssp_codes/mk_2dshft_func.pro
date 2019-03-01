;	mk_2dshft_func.pro
;
;	hsc		11/20/90		
;	slk		written 11/20/90 by steve keil
;
;	This function, the dimensions of that array that you wish to  
;	to shift, and the shift values, will calculate the fourier 
;	shift function to be used  with the supershifter.pro
;	function.
;
;           ------------INPUT-------------			
;
;	nx	-	The number of columns in the desired array. 
;			type: scalar,integer
;
;	ny	-	The number of rows in the desired array. 
;			type: scalar,integer

;	sx	-	The value of the decimal shift in the x-direction. 
;			type: scaler,floating point
;
;	sy	-	The value of the decimal shift in the y-direction. 
;			type: scaler,floating point
;
;           ------------OUTPUT------------			
;
;	sf	-	The two dimensional shift function.
;			type: array,floating point,fltarr(nx,ny)

function mk_2dshft_func,nx,ny,delx,dely

;print,'mk_2dshft_func is running'

pi = 3.14159265359
pi2 = 2.*pi
sf = complexarr(nx,ny)
oddevenx = (nx-1) mod 2
oddeveny = (ny-1) mod 2

mx = findgen(nx/2+1)*delx/nx*pi2
ex = exp ( complex(replicate(0.0,nx/2+1),-mx))

for j=0,ny/2 do begin
  my = j*dely/ny*pi2
  ey = exp(complex(0,-my))
  sf(0:nx/2,j) = ex*ey
endfor

ex2 = complex ( reverse(float(ex)),-reverse(imaginary(ex)))
ex2= ex2(oddevenx:nx/2-1)

for j=0,ny/2 do begin
  my = j*dely/ny*pi2
  ey = exp(complex(0,-my))
  sf(nx/2+1:nx-1,j) = ex2*ey
endfor


for j=ny-1,ny/2+1,-1 do begin
  my = (ny-j)*dely/ny*pi2
  ey = conj( exp(complex(0,-my)) )
  sf(0:nx/2,j) = ex*ey
  sf(nx/2+1:nx-1,j) = ex2*ey
endfor

return,sf

end
	

