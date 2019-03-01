matlab_var=command_line_args()
cd,'E:\optics and project related stuff\mssp_data_analysis_gui\mssp_codes\'
;.r spectral_curve
print,matlab_var
spectral_curve,matlab_var
wait,1
exit
end