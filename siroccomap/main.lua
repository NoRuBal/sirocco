function love.load()
	map = {
		  {1, 1, 1, 1, 1, 1, 1, 1, 1}, 
		  {1, 1, 1, 1, 1, 1, 1, 1, 1}, 
		  {1, 1, 1, 1, 1, 1, 1, 1, 1}, 
		  {1, 1, 1, 1, 1, 1, 1, 1, 1}, 
		  {1, 1, 1, 1, 1, 1, 1, 1, 1}, 
		  {1, 1, 1, 1, 1, 1, 1, 1, 1}, 
		  {1, 1, 1, 1, 1, 1, 1, 1, 1}, 
		  {1, 1, 1, 1, 1, 1, 1, 1, 1}, 
		  {1, 1, 1, 1, 1, 1, 1, 1, 1}
		  }
end

function love.mousepressed(x, y, button)
	local tx, ty
	tx = math.floor(x / 48) + 1
	ty = math.floor(y / 48) + 1
	if map[tx][ty] == 1 then
		map[tx][ty] = 0
	else
		map[tx][ty] = 1
	end
end

function love.keypressed(key)
	local tmp
	
	tmp = ""
	
	local a
	local b
	for a = 1, 9 do
		for b = 1, 9 do
			tmp = tmp .. map[a][b] .. ", "
		end
		tmp = tmp .. "\r\n"
	end
	
	local file
	file = love.filesystem.newFile("map.txt")
	file:open("w")
	file:write(tmp)
	file:close()
end

function love.draw()
	local a
	local b
	for a = 1, 9 do
		for b = 1, 9 do
			if map[b][a] == 0 then
				love.graphics.setColor(0, 0, 0)
				love.graphics.rectangle("fill", (b - 1) * 48, (a - 1) * 48, 48, 48)
			else
				love.graphics.setColor(255, 255, 255)
				love.graphics.rectangle("fill", (b - 1) * 48, (a - 1) * 48, 48, 48)
			end
		end
	end
end