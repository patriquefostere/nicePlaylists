Run, iTunes,, max
WinWaitActive, iTunes
i:= 0
while(i<11)
{	
	Sleep, 500
	a:= 651+36*i ; iTunes coordinates are off by 11, playlist buttons are 36 tall
	Click, 91, %a%
	Send, !f
	Sleep, 200
	Send, bo{Enter}
	WinWaitActive, Confirm Save As,, 2
	if (ErrorLevel)
		Send, !y
	i := i+1
}
return 