goal = {}

function goal.init()
	local a
	for a = 1, #goal do
		goal[a].enabled = false
	end
end

function goal.new(x, y)
	local index
	local a
	index = #goal + 1
	for a = 1, #goal do
		if goal[a].enabled == false then
			index = a
			break
		end
	end
	
	goal[index] = {}
	goal[index]["x"] = x --tile x of the goal
	goal[index]["y"] = y --tile y of the goal
	
	goal[index].enabled = true
end

function goal.draw()
	local a
	local b
	local achieved
	for a = 1, #goal do
		if goal[a].enabled == true then
			achieved = 1
			for b = 1, #box do
				if box[b].enabled == true then
					if (goal[a].x == box[b].x) and (goal[a].y == box[b].y) then
						if box[b].state == "static" then
							achieved = 2
							break
						end
					end
				end
			end
			
			love.graphics.draw(imggoal, quadgoal[achieved], (goal[a].x - 1) * 48, (goal[a].y - 1) * 48)
		end
	end
end

function goal.check()
	--check every goals if they are active
	local a
	local b
	local achieved
	for a = 1, #goal do
		if goal[a].enabled == true then
			achieved = 1
			for b = 1, #box do
				if box[b].enabled == true then
					if (goal[a].x == box[b].x) and (goal[a].y == box[b].y) then
						achieved = 2
						break
					end
				end
			end
			
			if achieved == 1 then
				return false
			end
		end
	end
	
	return true
end