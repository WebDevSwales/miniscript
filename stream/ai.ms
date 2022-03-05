c=0

Food = {"x":0,"y":0,"icon":"f"}
things = []

character  = {}
character.name = "Lewis"
character.x = 10
character.y = 10
character.task = ""
character.energy = 100
character.hunger = 100
character.level = 1
character.exp = 0
character.health = 100
character.symbol = "@"
character.color = "#AF0508"

character.name = input("name your hero")

character.findFood = function
	while self.x != things[0].x or self.y != things[0].y 
		if self.x > things[0].x then
			self.x = self.x-1
		else if self.x < things[0].x then
			self.x = self.x+1
		end if
		
		if self.y > things[0].y then
			self.y = self.y-1
		else if self.y < things[0].y then
			self.y = self.y+1
		end if
		character.update
		wait 0.1
	end while
	self.hunger = self.hunger + 90
	wait 
	things.remove 0
end function

character.wander = function
	character.update
	c = floor(rnd*4)
	print c
	if c == 0 then
		self.x = self.x + 1
	else if c == 1 then
		self.x = self.x-1
	else if c == 2 then
		self.y = self.y - 1
	else if c == 3 then
		self.y = self.y + 1
	end if
	
	character.update
end function

character.sleep = function
	i=0
	while self.energy < 100 
		i = i + 1
		self.energy = self.energy + 3
		self.hunger = self.hunger +1.5
		text.row =self.y
		text.column = self.x
		if i%2 == 0 then
			print "x"
		else 
			print "o"
		end if
		text.row = self.y + 1
		text.column = self.x + 1
		if i%2 == 1 then
			print "z"
		else
			print " "
		end if
		wait 0.1
		character.update
	end while
end function

character.update = function
	clear
	if character.hunger < 50 then
		if things.len < 3 then
			placeFood
		end if
	end if
	self.energy = self.energy-1
	self.hunger = self.hunger -2 
	self.exp = self.exp + 0.1
	
	if self.exp > self.level*self.level then
		self.level = self.level + 1
	end if
	if self.energy < 0 or self.hunger < 0 then
		self.health = self.health - 1
		if self.health < 0 then
			text.row = 10
			text.column = 10
			print "you died!"
			print self.name +" was "+ self.level+" when he died!"
			
			input("")
			exit
		end if
	end if
	
	if things.len then
		for i in things
			text.row = i.y
			text.column = i.x
			print "f"
		end for
	end if
	
	text.row = self.y
	text.column = self.x
	text.color = character.color
	print character.symbol
	text.color = color.orange
	
	text.row = 1
	text.column = 0
	print "Energy: " + character.energy 
	text.row = 2
	text.column = 0
	print "Experience: " + character.exp
	text.row = 3
	text.column = 0
	print "Hunger: " + character.hunger
	text.row = 4
	text.column = 0
	print "level: " + character.level
	text.row = 5
	text.column = 0
	print "health: " + character.health
	wait 0.1
	
end function

placeFood = function
	f = floor(rnd*30)
	if f > 20 then
		food = new Food
		food.x = floor(rnd*66)+1
		food.y = floor(rnd*24)+1
		things.push(food)
	end if
end function

while not key.pressed("escape")
	clear
	if character.hunger < 70 then
		if things.len > 0 then
			character.findFood
		end if
		
	end if
	character.wander
	if character.energy < 1 then
		character.sleep
	end if
	if things.len > 0 then
		for i in things
			text.row = i.y
			text.column = i.x
			print i.icon
		end for
	end if
	wait 0.1
end while