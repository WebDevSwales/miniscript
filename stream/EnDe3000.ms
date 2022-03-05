w="keep your secrets secret ;)"
m=""
c=""
cW=""
d=""
o=""
e=""

live = function()
	outer.cW = input("input codeword")
	loop
end function

loop = function()
	print "enter ""en:"" or ""de:"" at start of message or (q)uit"
	k = input("")
	if cW then
		if k[0] == "e" then
			m = m + k[3:]
			en(m,cW,false)
			loop
		else if k[0] == "d" then
			for i in cW
				j=code(i)
				j=j+1
				c = c + char(j)
			end for
			m = c + char(10000) + k[3:]
			de(m)
		else if k[0] == "q" then
			run
		end if
		loop
	end if
	loop
end function

en = function(m,cW,p)
	for i in m.indexes
		a = str(cW[i%cW.len])
		b = str(m[i])
		c =  code(a) + code(b)
		d = d + char(c)
	end for
	for i in cW
		e=code(i)
		e=e+1
		o = o + char(e)
	end for
	if p == true then
		print o+char(10000)+d
	else if p == false then
		print d
	end if
end function

de = function(e)	
	if not e.indexOf(char(10000)) then
		c = input("codeword: ")
		for i in c
			j=code(i)
			j=j+1
			cW = cW + char(j)
		end for
		m = e
	else if e.indexOf(char(10000)) then
		cW = slice(e,0,e.indexOf(char(10000)))
		m = slice(e,e.indexOf(char(10000))+1,e.len)
	end if
	
	for i in m.indexes
		a = code(m[i])
		b = code(cW[i%cW.len])
		c = a-b
		d = d + char(c+1)
	end for
	print"message: "+ d	
end function

print"welcome to EnDe3000"
print"keep your secrets secret"


print " "
s = input ("(e)ncrypt : (d)ecrypt : (l)ive : (q)uit")
if s == "e" then
	l = input ("Security level: (1),(2),(3)")
	m = input("message: ")
	if l == "1" then
		cW = char(100)
		en(m,cW,true)
	else if l == "2" then
		cW = input("codeword: ")
		en(m,cW,true)
	else if l == "3" then
		cW = input("codeword: ")
		en(m,cW,false)
	end if
	print ""
else if s == "d" then
	e = input("input encrypted code: ")
	de(e)
else if s == "l" then
	print "copying data: select,ctrl+c,release mouse"
	live
else if s == "q" then
	exit
end if


input()
run
