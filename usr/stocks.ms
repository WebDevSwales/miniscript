//stocks
dis = display(5)
clear
xSpace = 10
xMin = 20
yMin = 20
scale = 3

Stock = {"name":"name","code":"code","left":0,"bottom":50,"length":150,"height":100,"prices":[0,0,0,0,0,0,0,0,0,0,0,0,0,0],"color":color.white,"usn":0}
Stock.space = function
	self.left = (self.usr * 50)+((self.usr-1)*120)
	
end function

Stock.draw = function
	dis.fillRect self.left,self.bottom,self.length,self.height,color.white
	for i in range(0,self.prices.len - 2)
		dis.line (i*xSpace)+self.left,self.prices[i],((i+1)*xSpace)+self.left,self.prices[i+1],self.color,2
		dis.line (i*xSpace)+self.left,self.prices[i],((i+1)*xSpace)+self.left,self.prices[i+1],color.black,1
	end for
	dis.drawRect self.left,self.bottom,self.length,self.height,color.yellow
end function

Stock.update = function
	self.prices.push floor(rnd*self.height)+self.bottom
	if self.prices.len > 15 then
		self.prices.pull
	end if
end function



heartCo = new Stock
heartCo.name = "Heart Co."
heartCo.usr = 1
heartCo.space
heartCo.prices = Stock.prices[:]
heartCo.code = "HCO"
heartCo.color = color.red


orangeInc = new Stock
orangeInc.name = "Orange Inc."
orangeInc.usr = 2
orangeInc.space
orangeInc.prices = Stock.prices[:]
orangeInc.code = "OIN"
orangeInc.color = color.orange


opOil = new Stock
opOil.name = "OP Oil"
opOil.usr = 3
opOil.space
opOil.prices = Stock.prices[:]
opOil.code = "OPO"
opOil.color= color.blue

mini = new Stock
mini.name = "MiniScript Co"
mini.usr = 4
mini.space
mini.prices = Stock.prices[:]
mini.code = "MNS"
mini.color = color.teal

crypto = new Stock
crypto.name = "CryptoCash"
crypto.usr = 5
crypto.space
crypto.prices = Stock.prices[:]
crypto.code = "CTC"
crypto.color = color.maroon


while true 
	wait 
	
	dis.clear
	
	heartCo.update
	orangeInc.update
	opOil.update
	mini.update
	crypto.update
	
	heartCo.draw
	orangeInc.draw
	opOil.draw
	mini.draw
	crypto.draw
	
	text.row = 6
	text.column = 3
	print " HeartCo    OrangeInc    OP OIL      Miniscript   CryptoCash"
end while
