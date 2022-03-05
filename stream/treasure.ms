clear
k = "0"
digitX = 960/68
digitY = 640/26
clicks = 10
clear

treasure = [floor(rnd*68),floor(rnd*26)]


while not key.pressed("escape")
	
	while mouse.button
		outer.clicks = outer.clicks - 1
		clear
		text.row = 0
		text.column = 0
		print clicks
		text.row = mouse.y/digitY
		text.column = mouse.x/digitX
		proximity = (text.row-treasure[0])+(text.column-treasure[1])
		print abs(proximity)
		wait 0.2
		if proximity == 0 then
			clear
			print "success"
			print ("do you want to go again?")
			rs = input("")
			if rs == "y" then
				run
			else
				exit
			end if
		end if
		if outer.clicks < 1 then
			clear
			print "you failed!"
			print ("do you want to go again?")
			rs = input("")
			if rs == "y" then
				run
			else
				exit
			end if
		end if
	end while
end while

