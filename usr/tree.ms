frame1 = file.loadImage("/usr/sprites/tree1.png")
frame2 = file.loadImage("/usr/sprites/tree2.png")
frame3 = file.loadImage("/usr/sprites/tree3.png")
frame4 = file.loadImage("/usr/sprites/tree4.png")

frames = [frame1,frame2,frame3,frame4]

i = 0

display(4).clear
tree = new Sprite
tree.image = frame1
tree.x=350
tree.y=350
tree.plant = function
	startTime = time
	stage1 = startTime + 5
	stage2 = startTime + 10
	stage3 = startTime + 15
	while time < stage1
		self.image = frame2
	end while
	while time < stage2
		self.image = frame3
	end while
	while time < stage3
		self.image = frame4
	end while
end function
display(4).sprites.push tree



words = ["Zero","One","Two","Three","Four","Five","Six","Seven","Eight","Nine"]

numbersToWords = function (num)
	numbers = str(num)
	result = []
	for s in numbers
		result.push(words[s.val])
	end for
	print result.join
end function

numbersToWords 0
numbersToWords 42
numbersToWords 123
