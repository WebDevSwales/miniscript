standard=["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

low=["f", "r", "o", "e", "y", "p", "i", "v", "j", "b", "z", "k", "d", "x", "g", "s", "t", "h", "m", "q", "a", "c", "u", "l", "w", "n"]
high=["D", "V", "R", "N", "Z", "Y", "Q", "E", "O", "L", "M", "H", "G", "C", "X", "T", "K", "J", "W", "F", "P", "A", "U", "S", "I", "B"]
spec=["£","!","<",">","?","@","{","+","*","~",".",",",":"]
num=[6, 1, 0, 2, 3, 4, 9, 8, 5, 7]

ar = []
password = ""

pass = function()
	site = input ("site"+ char(13))
	noun = input("word"+ char(13))
	combo = site+noun
	
	for i in combo
		ar.push(standard.indexOf(i))
	end for
	
	for i in ar.indexes
		if i%4 == 0 then
			password = password + str(num[ar[i%ar.len]%num.len])
		else if i%4 == 1 then
			password = password + str(spec[i%spec.len])
		else if i%4 == 2 then
			password = password + str(high[i])+str(spec[i%spec.len])
		else if i%4 == 3 then
			password = password + str(low[i]) + str(num[ar[i%ar.len]%num.len])
		end if
		
	end for
	
	print password
end function
