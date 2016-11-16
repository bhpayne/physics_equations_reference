
:: echo give me the name of the tex file
::set /p filename=(without the .tex): 

: here we assume the filename
set filename=equations

: note that latex needs to be run twice in order for bibliography to be recompiled

latex -enable-installer -time-statistics %filename%.tex

:pause

latex -enable-installer -time-statistics %filename%.tex

ping -n 2 127.0.0.1

latex -enable-installer -time-statistics %filename%.tex

ping -n 2 127.0.0.1

: the following doesn't work with .eps pictures:
:latex -output-format=PDF %filename%.tex

:latex %filename%.tex

:pause

dvips %filename%.dvi

ps2pdf %filename%.ps

: output is a pdf file

erase /q *.ps
erase /q *.dvi
erase /q *.aux
erase /q *.log
erase /q *.out
erase /q *.toc
erase /q *.brf
erase /q *.lot
erase /q *.lof
erase /q *.bbl
erase /q *.blg
erase /q *.aaa
:pause