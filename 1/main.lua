file = io.open("input", "r")
data = file:read()
file:close()

x = 0
y = 0
current_d = 0	-- 0=U, 1=R, 2=D, 3=L
path = {}
twice = nil

for i in data:gmatch("%S+") do
	l = i:len()

	if (i:sub(l,l) == ",") then
		i = i:sub(1, l-1)
		l = l-1;
	end

	d = i:sub(1,1)
	i = tonumber(i:sub(2))

	if (d == "R") then
		current_d = current_d + 1
	else
		current_d = current_d - 1
	end

	while (current_d < 0) do
		current_d = current_d + 4
	end

	while (current_d > 3) do
		current_d = current_d - 4
	end

	while (i > 0) do
		if (twice == nil) then
			pos = x .. "," .. y

			if path[pos] == nil then
				path[pos] = 1
			else
				twice = math.abs(x) + math.abs(y)
			end
		end

		if (current_d == 0) then
			y = y + 1
		elseif (current_d == 1) then
			x = x + 1
		elseif (current_d == 2) then
			y = y - 1
		else
			x = x - 1
		end

		i = i - 1
	end
end

print ("1: " .. (math.abs(x) + math.abs(y)))
print ("2: " .. twice)