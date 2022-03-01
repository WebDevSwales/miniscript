clear

loop = function
	while not key.pressed("escape")
		
		if mouse.button then
			for tree in display(4).sprites
				if tree.contains(mouse.x,mouse.y) and tree.state > 300 then
					display(4).sprites.remove(tree)
				else continue
				end if
			end for
			makeTree
		end if
		
		for tree in display(4).sprites
			tree.grow
		end for
		
		yield
	end while
end function


makeTree = function
	m ={}
	m.x = mouse.x
	m.y = mouse.y
	tree = new Sprite
	tree.image = file.loadImage("/usr/sprites/tree1.png")
	tree.x = m.x
	tree.y = m.y
	tree.state = 0
	tree.localBounds = new Bounds
	tree.localBounds.width = tree.image.width
	tree.localBounds.height = tree.image.height
	tree.grow = function
		self.state = self.state + 1
		if self.state > 300 then
			tree.image = file.loadImage("/usr/sprites/tree4.png")
		else if self.state > 200 then
			tree.image = file.loadImage("/usr/sprites/tree3.png")
		else if self.state > 100 then
			tree.image = file.loadImage("/usr/sprites/tree2.png")
		end if
	end function
	display(4).sprites.push tree
end function

loop