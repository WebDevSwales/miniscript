main = {}
main.set = function(state)
	self.name = stocks[state].name
	self.code = stocks[state].code
	self.left = 50
	self.bottom = 200
	self.length = 500
	self.height = 500
	self.prices = stocks[state].prices
	self.color = stocks[state].color
	self.update = function
		for i in range(0,self.prices.len - 2)
			dis.line ((i*xSpace)*4)+self.left,self.prices[i]*4,(((i+1)*xSpace)*4)+self.left,self.prices[i+1]*4,self.color,4
			//dis.line (i*xSpace)+self.left,self.prices[i],((i+1)*xSpace)+self.left,self.prices[i+1],color.black,1
		end for
	end function
	
	self.draw = function
		dis.fillRect self.left,self.bottom,self.length+100,self.height
		dis.drawRect self.left,self.bottom,self.length+100,self.height,self.color,3
	end function
end function
main.checkState = function
	if key.pressed("1") then
		outer.state = 0
	else if key.pressed("2") then
		outer.state=1
	else if key.pressed("3") then
		outer.state=2
	else if key.pressed("4") then
		outer.state=3
	else if key.pressed("5") then
		outer.state=4
	end if
	main.set(state)
end function