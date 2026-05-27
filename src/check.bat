@set FILES=top_tb.vhd

@ghdl -s %FILES%
@if %ERRORLEVEL%==1 exit /b 1

@echo All Good!