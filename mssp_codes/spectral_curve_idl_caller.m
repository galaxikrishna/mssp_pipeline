[name,loc]=uigetfile('*');
a=fitsread(strcat(loc,name));
dat_siz=size(a);
if size(dat_siz,2) >2
    imagesc(a(:,:,1)'),colormap('gray')
else
    dat_siz(3)=1;%this ensures consistensy for spectroscopy and other codes that follow
    imagesc(a'),colormap('gray')
end

    disp('Select the central telluric line of each spectral band (preferabally at the centre along the slit direction)');
    [x,y]=getpts;
    x=floor(x);
    y=floor(y);
    dlmwrite(strcat(loc,'line_pos.txt'),[x,y],'delimiter',',');
    s=strcat('"C:\Program Files\Exelis\IDL84\bin\bin.x86_64\idl.exe"',{' '},'"E:\optics and project related stuff\mssp_data_analysis_gui\mssp_codes\call_idl.pro" -arg',{' '},loc);
    dos([s{:}]);
 
    