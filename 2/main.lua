file = io.open("input", "r")
code = ""
x = 1
y = 1

for data in file:lines() do
	for i = 1, #data do
		c = data:sub(i,i)

		if (c == "U" and y ~= 0) then
			y = y - 1
		elseif (c == "D" and y ~= 2) then
			y = y + 1
		elseif (c == "R" and x ~= 2) then
			x = x + 1
		elseif (c == "L" and x ~= 0) then
			x = x - 1
		end
	end

	code = code .. (1 + x + (y*3))
end

file:close()
print("1: " .. code)

file = io.open("input", "r")
code = ""
x = 0
y = 2
valid_locations = {}
valid_locations["02"] = "5"
valid_locations["11"] = "2"
valid_locations["12"] = "6"
valid_locations["13"] = "A"
valid_locations["20"] = "1"
valid_locations["21"] = "3"
valid_locations["22"] = "7"
valid_locations["23"] = "B"
valid_locations["24"] = "D"
valid_locations["31"] = "4"
valid_locations["32"] = "8"
valid_locations["33"] = "C"
valid_locations["42"] = "9"

for data in file:lines() do
	for i = 1, #data do
		c = data:sub(i,i)

		if (c == "U" and valid_locations[x .. (y-1)] ~= nil) then
			y = y - 1
		elseif (c == "D" and valid_locations[x .. (y+1)] ~= nil) then
			y = y + 1
		elseif (c == "R" and valid_locations[(x+1) .. y] ~= nil) then
			x = x + 1
		elseif (c == "L" and valid_locations[(x-1) .. y] ~= nil) then
			x = x - 1
		end
	end

	code = code .. valid_locations[x .. y]
end

file:close()
print("2: " .. code)