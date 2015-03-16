box = {}

function box.init()
	local a
	for a = 1, #box do
		box[a].enabled = false
	end
end

function box.new(x, y)
	local index
	local a
	index = #box + 1
	for a = 1, #box do
		if box[a].enabled == false then
			index = a
			break
		end
	end
	
	box[index] = {}
	box[index]["x"] = x --tile x of the box
	box[index]["y"] = y --tile y of the box
	box[index]["timer"] = 0
	box[index]["state"] = "static" --static/left/right/up/down
	
	box[index].enabled = true
end

function box.update(dt)
	local a
	for a = 1, #box do
		if box[a].enabled == true then
			if box[a].timer > 0 then
				box[a].timer = box[a].timer - dt
			elseif box[a].timer <= 0 then
				box[a].timer = 0
				if not(box[a].state == "static") then
					box[a].state = "static"
				end
			end
		end
	end
end

function box.move(index, direction)
	local fakex
	local fakey
	local moved
	local a
	
	fakex = box[index].x
	fakey = box[index].y
	
	if not (box[index].state == "static") then
		return false
	end
	
	moved = true
	
	--collision with wall
	if direction == "up" then
		if game.map[fakex][fakey - 1] == 0 then
			fakey = fakey - 1
		end
	elseif direction == "down" then
		if game.map[fakex][fakey + 1] == 0 then
			fakey = fakey + 1
		end
	elseif direction == "left" then
		if game.map[fakex - 1][fakey] == 0 then
			fakex = fakex - 1
		end
	elseif direction == "right" then
		if game.map[fakex + 1][fakey] == 0 then
			fakex = fakex + 1
		end
	end
	
	--collision with box
	for a = 1, #box do
		if box[a].enabled == true then
			if (box[a].x == fakex) and (box[a].y == fakey) then
				if not(a == index) then
					fakex = box[index].x
					fakey = box[index].y
				end
			end
		end
	end
	
	if (fakex == box[index].x) and (fakey == box[index].y) then
		moved = false
	end
	
	box[index].x = fakex
	box[index].y = fakey
	
	if goal.check() == true then
		game.solved = true
	else
		game.solved = false
	end
	
	if moved == true then
		box[index]["state"] = direction
		box[index]["timer"] = 0.3
	end
	
	return moved
end

function box.draw()
	local a
	for a = 1, #box do
		if box[a].enabled == true then
			if box[a].state == "static" then
				love.graphics.draw(imgbox, (box[a].x - 1) * 48, (box[a].y - 1) * 48)
			elseif box[a].state == "up" then
				love.graphics.draw(imgbox, (box[a].x - 1) * 48, (box[a].y - 1) * 48 + 24)
			elseif box[a].state == "down" then
				love.graphics.draw(imgbox, (box[a].x - 1) * 48, (box[a].y - 1) * 48 - 24)
			elseif box[a].state == "left" then
				love.graphics.draw(imgbox, (box[a].x - 1) * 48 + 24, (box[a].y - 1) * 48)
			elseif box[a].state == "right" then
				love.graphics.draw(imgbox, (box[a].x - 1) * 48 - 24, (box[a].y - 1) * 48)
			end
		end
	end
end