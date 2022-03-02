//stocks
Stock = {"name":"name","code":"code","left":0,"bottom":50,"length":150,"height":100,"prices":[50,50,50,50,50,50,50,50,50,50,50,50,50,50],"color":color.white,"usn":0}

Stock.update = function
	cp = self.prices[self.prices.len-1]
	chance = floor(rnd*2)
	if chance == 1 then
		cp = cp * 1.1
		if cp > 100 then
			cp = 100
		end if
	else 
		cp = cp*0.9
		if cp < 0 then
			cp = 0
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
heartCo.prices = Stock.prices[:]
heartCo.code = "HCO"
heartCo.color = color.red

orangeInc = new Stock
orangeInc.name = "Orange Inc."
orangeInc.usr = 2
orangeInc.prices = Stock.prices[:]
orangeInc.code = "OIN"
orangeInc.color = color.orange

opOil = new Stock
opOil.name = "OP Oil"
opOil.usr = 3
opOil.prices = Stock.prices[:]
opOil.code = "OPO"
opOil.color= color.blue

mini = new Stock
mini.name = "MiniScript Co"
mini.usr = 4
mini.prices = Stock.prices[:]
mini.code = "MNS"
mini.color = color.teal

crypto = new Stock
crypto.name = "CryptoCash"
crypto.usr = 5
crypto.prices = Stock.prices[:]
crypto.code = "CTC"
crypto.color = color.maroon






