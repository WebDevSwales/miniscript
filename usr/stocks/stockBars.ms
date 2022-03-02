
StockBox = {}
StockBox.left = 37.5
StockBox.bottom = 32.5
StockBox.width = 150
StockBox.height = 150
StockBox.color = color.white

StockBox.draw = function
	display(5).drawRect self.left,self.bottom,self.width,self.height,color.red
end function

stockBox1 = new StockBox
stockBox1.color = stocks[0].color

stockBox2 = new StockBox
stockBox2.left = 37.5+240

stockBox3 = new StockBox
stockBox3.left = 37.5+480

stockBox4 = new StockBox
stockBox4.left = 37.5+720

stockBox1.draw
stockBox2.draw
stockBox3.draw
stockBox4.draw
