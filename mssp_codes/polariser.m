function p = polariser(tilt)
t=tilt;
p=0.5*[1,cosd(2*t),sind(2*t),0;
    cosd(2*t),cosd(2*t)^2,sind(2*t)*cosd(2*t),0;
    sind(2*t),sind(2*t)*cosd(2*t),sind(2*t)^2,0;
0,0,0,0];
end
