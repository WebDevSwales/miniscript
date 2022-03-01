//stocks
dis = display(5)


display(4).mode = displayMode.pixel


clear

display(4).line 100,200,500,200,color.red	



xSpace = 10
xMin = 20
yMin = 20
nextTime = 10
stocks = []
state = 2

Stock = {"name":"name","code":"code","left":0,"bottom":50,"length":150,"height":100,"prices":[50,50,50,50,50,50,50,50,50,50,50,50,50,50],"color":color.white,"usn":0}
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
	cp = self.prices[self.prices.len-1]
	chance = floor(rnd*2)
	if chance == 1 then
		cp = cp * 1.1
		if cp > 150 then
			cp = 150
		end if
	else 
		cp = cp*0.9
		if cp < 50 then
			cp = 50
		end if
	end if
	
	self.prices.push cp
	if self.prices.len > 16 then
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

stocks.push (heartCo)
stocks.push (orangeInc)
stocks.push (opOil)
stocks.push (mini)
stocks.push (crypto)

main = {}
main.set = function
	self.name = stocks[state].name
	self.code = stocks[state].code
	self.left = 50
	self.bottom = 200
	self.length = 500
	self.height = 500
	self.prices = stocks[state].prices
	self.update = function
		for i in range(0,self.prices.len - 2)
			dis.line ((i*xSpace)*4)+self.left,self.prices[i]*4,(((i+1)*xSpace)*4)+self.left,self.prices[i+1]*4,color.black,4
			//dis.line (i*xSpace)+self.left,self.prices[i],((i+1)*xSpace)+self.left,self.prices[i+1],color.black,1
		end for
	end function
	
	self.draw = function
		dis.fillRect self.left,self.bottom,self.length+100,self.height
	end function
end function

main.set

while not key.pressed("escape")
	if time > nextTime then
		for i in stocks
			i.update
			i.draw
		end for
		
		main.draw
		main.update
		
		
		
		text.row = 6
		text.column = 3
		print " HeartCo    OrangeInc    OP OIL      Miniscript   CryptoCash"
		nextTime = time + 0.5
	end if
end while

text.row = 30
