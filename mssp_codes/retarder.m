function m=retarder(ret,tilt)
g=0.5*(1+cosd(ret));
h=0.5*(1-cosd(ret));
m=[1,0,0,0;
    0,g+h*cosd(4*tilt),h*sind(4*tilt),-sind(ret)*sind(2*tilt);
    0,h*sind(4*tilt),g-h*cosd(4*tilt),sind(ret)*cosd(2*tilt);
    0,sind(ret)*sind(2*tilt),-sind(ret)*cosd(2*tilt),cosd(ret)];
end