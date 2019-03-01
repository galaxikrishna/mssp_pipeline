;	supershifter.pro
;
;	hsc		11/20/90		
;
;	This function, given an 2d array will shift that array either 
;	in the x-direction, y-dirextion or both to decimal accuracy
;	and return the shifted array in floating point format.
;	i.e.  Apply a shift to an array of 2.5 and 3.33333. 
;	This routine may add high frequency noise to the array if 
;	it is used on array sizes that are odd. i.e. nx=odd or ny=odd.
;
;           ------------INPUT-------------			
;
;	a	-	The 2d array that will be shifted.
;			type: array,any type,arr(nx,ny)
;
;	sx	-	The value of the decimal shift in the x-direction. 
;			type: scalar,floating point
;
;	sy	-	The value of the decimal shift in the y-direction. 
;			type: scalar,floating point
;
;           ------------OUTPUT------------			
;
;	as	-	The shifted 2d array.
;			type: array,floating point,fltarr(nx,ny)

function supershifter,a,sx,sy

  ;Determine sizes and convert 2d array to floating point.

  ssz=size(a)

  ; H.Lin modification 19990908
  ; Modified to work on one-dimensional array
  ; check if a is 1-dimensional array
  if (ssz(0) eq 1) then begin
    nx=ssz(1)
	ny=1
	a=reform(a,nx,1)
  endif else begin
    nx=ssz(1)
    ny=ssz(2)
  endelse

  IF n_elements(sy) EQ 0 THEN sy=0.

  a=float(a)

  ;Compute shift function.
  fs=mk_2dshft_func(nx,ny,sx,sy)

  ;Apply shift.
  as=float(fft(fs*fft(a,-1),1))

return,as

end
