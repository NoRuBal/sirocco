ui = {}

function ui.load()
	
end

function ui.update(dt)
	
end

function ui.draw()
	local a
	local str
	love.graphics.draw(imglife, 21, 445)

	for a = 1, 3 do
		if player.life >= a then
			love.graphics.draw(imgheart[2], 126 + (37 * (a - 1)), 446)
		else
			love.graphics.draw(imgheart[1], 126 + (37 * (a - 1)), 446)
		end	
	end
		
	love.graphics.draw(imgfloor, 260, 445)
	
	str = game.stage
	if str < 10 then
		str = "0"..str
	end
	
	love.graphics.print(str, 367, 447)
	
end