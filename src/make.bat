@REM @set FILES=clock_div.vhd hdmi_ctrl.vhd pixel_pusher.vhd picture.vhd hdmi_top.vhd rbg2dvi.vhd wrapper.vhd wrapper_tb.vhd
@REM @set ENTITY=wrapper_tb

@set FILES=clock_div.vhd hdmi_ctrl.vhd pixel_pusher.vhd picture.vhd hdmi_top.vhd hdmi_top_tb.vhd
@set ENTITY=hdmi_top_tb

@REM @set FILES=hdmi_ctrl_tb.vhd hdmi_ctrl.vhd
@REM @set ENTITY=hdmi_ctrl_tb

@ghdl -a %FILES%
@if %ERRORLEVEL%==1 exit /b 1
@ghdl -e %ENTITY%
@ghdl -r %ENTITY% --vcd=sim.vcd

@echo Ran Successfully