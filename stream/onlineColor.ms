cprint = function(text)
	origcolor = outer.text.color
	delimiter = outer.text.delimiter
	outer.text.delimiter = ""
	while (text.len > 0)
		if text.len > 8 and text[0:2] == "<#" and
		text[8:9] == ">" then
			outer.text.color = text[1:8]
			text = text[9:]
		else if text.indexOf("<#") != null then
			print text[0:text.indexOf("<#")]
			text = text[text.indexOf("<#"):]
		else
			print text
			text = ""
		end if
	end while
	outer.text.color = origcolor
	outer.text.delimiter = delimiter
	print ""
end function

cprint("<#ffb7C4>Hello<#19b7C4> World!")