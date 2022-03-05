clear
k=0
digitX = 960/68
digitY = 640/26
clear
while not key.pressed("escape")
	if key.available then
		k = key.get
	end if
	while mouse.button
		text.column = mouse.x/digitX
		text.row = mouse.y/digitY
		print k
	end while
end while