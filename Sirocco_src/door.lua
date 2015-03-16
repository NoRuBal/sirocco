door = {}
door.start = {}
door.next = {}

function door.init(startx, starty, nextx, nexty)
	door.start.x = startx
	door.start.y = starty
	door.next.x = nextx
	door.next.y = nexty
end

function door.draw()
	love.graphics.draw(imgstartdoor, (door.start.x - 1) * 48, (door.start.y - 1) * 48)
	if game.solved == true then
		love.graphics.draw(imgenddoor, quadgoal[2], (door.next.x - 1) * 48, (door.next.y - 1) * 48)
	else
		love.graphics.draw(imgenddoor, quadgoal[1], (door.next.x - 1) * 48, (door.next.y - 1) * 48)
	end
end