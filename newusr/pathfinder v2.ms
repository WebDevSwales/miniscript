import "mapUtil"
import "listUtil"

toCheck=[]
checked=[]
costArray=[]
pathArray=[]
blockers = []
path = []

findNeighbours = function(x=22,y=22,destinX=38,destinY=10,cle=true,path=pathArray)
	tempArray = []
	
	if cle == true then
		x = ceil(rnd*67)
		y = ceil(rnd*24)
		destinX = ceil(rnd*67)
		destinY = ceil(rnd*24)
		path = pathArray
		
		if blockers.contains([x,y]) then
			overlay = blockers.indexOf([x,y])
			print "s: "+ overlay
			blockers.remove(overlay)
		end if
		
		if blockers.contains([destinX,destinY]) then
			overlay = blockers.indexOf([destinX,destinY])
			print "g:"+ overlay
			blockers.remove(overlay)
		end if
	end if
	
	
	success(x,y,destinX,destinY,path)
	
	text.setCellColor destinX,destinY,color.white
	text.setCell destinX,destinY,"G"
	
	checked.push([x,y])
	path.push([x,y])
	print path
	input""
	
	text.setCellColor x,y,color.blue
	text.setCell x,y,"O"
	
	if not blockers.contains([x-1,y]) then
		if x > 1 then
			cost = abs(x-1-destinX)+abs(y-destinY)
			//p = path.deepCopy
			//p.push([x-1,y])
			cell = [x-1,y,cost,path[:]]
			tempArray.push(cell)
			text.setCell x-1,y,"x"
		end if
	end if
	
	if not blockers.contains([x+1,y]) then
		if x < 12 then
			cost = abs(x+1-destinX)+abs(y-destinY)
			//p = path.deepCopy
			//p.push([x+1,y])
			cell = [x+1,y,cost,path[:]]
			tempArray.push(cell)
			text.setCell x+1,y,"x"
		end if
	end if
	
	if not blockers.contains([x,y-1]) then
		if y > 1 then
			cost = abs(x-destinX)+abs(y-1-destinY)
			//p = path.deepCopy
			//p.push([x,y-1])
			cell = [x,y-1,cost,path[:]]
			tempArray.push(cell)
			text.setCell x,y-1,"x"
		end if
	end if
	
	if not blockers.contains([x,y+1]) then
		if y < 40 then
			cost = abs(x-destinX)+abs(y+1-destinY)
			//p = path.deepCopy
			//p.push([x,y+1])
			cell = [x,y+1,cost,path[:]]
			tempArray.push(cell)
			text.setCell x,y+1,"x"
		end if
	end if
	
	input ""
	for i in checked
		for j in tempArray
			if str(j[0]) == str(i[0]) and str(j[1]) == str(i[1]) then
				tempArray.remove(tempArray.indexOf(j))
			end if
		end for
	end for
	
	if tempArray.len > 0 then
		for i in tempArray
			toCheck.push(i)	
		end for
	end if
	
	
	if toCheck.len > 0 then
		for i in range (0,100)
			for j in toCheck
				if str(j[2]) == str(i) then
					
					findNeighbours(j[0],j[1],destinX,destinY,false,j[3])
				end if	
			end for
		end for
	end if
	
	print "no path"
end function

clearArray = function(array)
	while array.len>0
		array.remove(0)
	end while
end function

placeblocks = function()
	clearArray(blockers)
	for i in range (0,600)
		blockers.push([ceil(rnd*67),ceil(rnd*25)])
	end for
	
	for b in blockers
		text.setCellColor b[0],b[1],color.red
		text.setCell b[0],b[1],"B"
		
	end for
end function

success = function(x,y,destinX,destinY,path=path)
	if x == destinX and y == destinY then
		file.writeLines "result.txt",path
		clearArray(toCheck)
		clearArray(checked)
		text.setCell x,y,"s"
		print "success"
		exit
	end if
end function

clear
placeblocks
findNeighbours

