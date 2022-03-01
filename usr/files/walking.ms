frame1 = "/usr/sprites/sprite-0001.png"
frame2 = "/usr/sprites/sprite-0002.png"
frame3 = "/usr/sprites/sprite-0001.png"
frame4 = "/usr/sprites/sprite-0003.png"
i = 0
frames = [frame1,frame2,frame3,frame4]
clear 

john = new Sprite
john.image = file.loadImage("/usr/sprites/sprite-0001.png")
display(4).sprites.push john
john.x = 400
john.y = 400

john.moveLeft =function
	outer.i = outer.i +1
	print outer.i
	if outer.i > 3 then
		outer.i=0
	end if
	clear
	print k.code
	john.x = john.x - 5
	john.image = file.loadImage(frames[i])
	display(4).sprites.push john
end function

john.moveRight = function
	outer.i = outer.i +1
	print outer.i
	if outer.i > 3 then
		outer.i=0
	end if
	clear
	print k.code
	john.x = john.x + 5
	john.image = file.loadImage(frames[i])
	display(4).sprites.push john
end function

loop = function
	k = key.get
	if k.code == 17 then
		john.moveLeft
	else if k.code == 18 then
		john.moveRight
	end if
	loop
end function
loop