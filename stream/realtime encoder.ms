while not key.pressed("escape") 
	cW = input("input codeword")
	m=" "
	while cW 
		k = key.get
		m = m + k
		d=""
		for i in range (0,10)
			print " "
		end for
		print cW
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
		print d
		
	end while
end while