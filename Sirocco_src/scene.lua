scene = {}
scene.title = {}
scene.opening = {}
scene.game = {}
scene.gameover = {}
scene.ending = {}

function scene.title.load()
	game.scene = 0
	scene.title.blink = false
	scene.title.tmrblink = 1
end

function scene.title.update(dt)
	scene.title.tmrblink = scene.title.tmrblink - dt
	if scene.title.tmrblink <= 0 then
		if scene.title.blink == false then
			scene.title.tmrblink = scene.title.tmrblink + 0.3
		else
			scene.title.tmrblink = scene.title.tmrblink + 1
		end
		if scene.title.blink == true then
			scene.title.blink = false
		else
			scene.title.blink = true
		end
	end
end

function scene.title.draw()
	love.graphics.draw(imgtitle)
	if scene.title.blink == false then
		love.graphics.draw(imganykey, 113, 364)
	end
end

function scene.title.keypressed(key)
	scene.opening.load() --to opening scene
end

------------------------------------------

function scene.opening.load()
	game.scene = 1
	scene.opening.sirocco = {}
	scene.opening.sirocco.x = 432
	scene.opening.sirocco.y = 306
	scene.opening.sirocco.sequence = 1 --1:walking from right side 2:turn around 3:wait 1.5 sec
	scene.opening.sirocco.animation = 1
	scene.opening.sirocco.tmrani = 0
end

function scene.opening.update(dt)
	--Opening Animation
	if scene.opening.sirocco.sequence == 1 then
		scene.opening.sirocco.tmrani = scene.opening.sirocco.tmrani + dt
		if scene.opening.sirocco.tmrani >= 0.2 then
			scene.opening.sirocco.tmrani = scene.opening.sirocco.tmrani - 0.2
			if scene.opening.sirocco.animation == 4 then
				scene.opening.sirocco.animation = 1
			else
				scene.opening.sirocco.animation = scene.opening.sirocco.animation + 1
			end
		end
		scene.opening.sirocco.x = scene.opening.sirocco.x - 100 * dt
		if scene.opening.sirocco.x <= 68 then
			scene.opening.sirocco.x = 68
			 scene.opening.sirocco.sequence = 2
			 scene.opening.sirocco.tmrani = 0
		end
	elseif scene.opening.sirocco.sequence == 2 then
		scene.opening.sirocco.tmrani = scene.opening.sirocco.tmrani + dt
		if scene.opening.sirocco.tmrani >= 1.5 then
			scene.opening.sirocco.tmrani = 0
			scene.game.load(1) --load stage 1
		end
	end
end

function scene.opening.draw()
	love.graphics.draw(imgbackground)
	if scene.opening.sirocco.sequence == 1 then
		love.graphics.draw(imgplayer["left"][scene.opening.sirocco.animation], scene.opening.sirocco.x, scene.opening.sirocco.y)
	else
		love.graphics.draw(imgplayer["up"][1], scene.opening.sirocco.x, scene.opening.sirocco.y)
	end
end

function scene.opening.keypressed(key)
	scene.game.load(1) --load stage 1
end

-------------------------------------------

function scene.game.load(stg)
	game.stage = stg
	game.solved = false
	
	--init stage
	box.init()
	goal.init()
	enemy.init()
	
	if stg == 1 then
		door.init(5, 8, 5, 2)
		goal.new(2, 5)
		box.new(7, 5)
	elseif stg == 2 then
		door.init(2, 8, 8, 2)
		goal.new(5, 5)
		box.new(5, 6)
	elseif stg == 3 then
		door.init(8, 5, 3, 4)
		goal.new(8, 3)
		goal.new(8, 6)
		box.new(6, 4)
		box.new(7, 4)
	elseif stg == 4 then
		door.init(7, 5, 4, 5)
		goal.new(7, 4)
		goal.new(5, 6)
		box.new(5, 5)
		box.new(6, 5)
	elseif stg == 5 then
		door.init(5, 5, 8, 3)
		goal.new(8, 5)
		goal.new(8, 6)
		box.new(6, 5)
		box.new(7, 5)
	elseif stg == 6 then
		door.init(2, 8, 2, 2)
		enemy.new((8 - 1) * 48 + 4, (4 - 1) * 48 + 4, "left")
		enemy.new((2 - 1) * 48 + 4, (6 - 1) * 48 + 4, "right")
	elseif stg == 7 then
		door.init(5, 2, 5, 5)
		goal.new(2, 5)
		goal.new(8, 5)
		goal.new(5, 8)
		box.new(3, 5)
		box.new(7, 5)
		box.new(5, 7)
		enemy.new((6 - 1) * 48 + 4, (5 - 1) * 48 + 4, "right")
	elseif stg == 8 then
		door.init(7, 8, 3, 7)
		goal.new(3, 3)
		goal.new(3, 4)
		goal.new(3, 5)
		box.new(7, 4)
		box.new(7, 5)
		box.new(7, 6)
		enemy.new((3 - 1) * 48 + 4, (5 - 1) * 48 + 4, "right")
	elseif stg == 9 then
		door.init(8, 5, 2, 5)
		goal.new(4, 3)
		goal.new(5, 3)
		goal.new(4, 4)
		goal.new(6, 4)
		goal.new(4, 5)
		goal.new(6, 5)
		goal.new(4, 6)
		goal.new(6, 6)
		goal.new(4, 7)
		goal.new(5, 7)
		box.new(3, 3)
		box.new(6, 3)
		box.new(7, 3)
		box.new(5, 4)
		box.new(3, 5)
		box.new(7, 5)
		box.new(5, 6)
		box.new(3, 7)
		box.new(6, 7)
		box.new(7, 7)
	elseif stg == 10 then
		door.init(5, 8, 5, 3)
		goal.new(3, 4)
		goal.new(4, 4)
		goal.new(5, 4)
		goal.new(6, 4)
		goal.new(7, 4)
		goal.new(3, 5)
		goal.new(5, 5)
		goal.new(7, 5)
		goal.new(5, 6)
		goal.new(5, 7)
		box.new(4, 4)
		box.new(6, 4)
		box.new(4, 5)
		box.new(6, 5)
		box.new(4, 6)
		box.new(6, 6)
		box.new(3, 7)
		box.new(4, 7)
		box.new(6, 7)
		box.new(7, 7)
	elseif stg == 11 then
		door.init(2, 8, 3, 2)
		goal.new(8, 4)
		goal.new(8, 5)
		goal.new(8, 6)
		box.new(3, 6)
		box.new(3, 7)
		box.new(4, 7)
		enemy.new((4 - 1) * 48 + 4, (2 - 1) * 48 + 4, "down")
	elseif stg == 12 then
		door.init(8, 5, 3, 6)
		goal.new(6, 4)
		goal.new(7, 4)
		goal.new(8, 4)
		box.new(7, 3)
		box.new(7, 4)
		box.new(7, 5)
		enemy.new((5 - 1) * 48 + 4, (2 - 1) * 48 + 4, "down")
		enemy.new((4 - 1) * 48 + 4, (6 - 1) * 48 + 4, "down")
	elseif stg == 13 then
		door.init(3, 4, 8, 8)
		goal.new(5, 6)
		goal.new(6, 6)
		goal.new(7, 6)
		box.new(6, 4)
		box.new(6, 5)
		box.new(6, 6)
		enemy.new((3 - 1) * 48 + 4, (6 - 1) * 48 + 4, "right")
		enemy.new((7 - 1) * 48 + 4, (3 - 1) * 48 + 4, "down")
	elseif stg == 14 then
		door.init(3, 7, 3, 3)
		goal.new(6, 3)
		goal.new(6, 4)
		goal.new(6, 6)
		goal.new(6, 7)
		box.new(5, 3)
		box.new(5, 4)
		box.new(5, 6)
		box.new(5, 7)
		enemy.new((5 - 1) * 48 + 4, (5 - 1) * 48 + 4, "up")
		enemy.new((6 - 1) * 48 + 4, (5 - 1) * 48 + 4, "down")
	elseif stg == 15 then
		door.init(5, 5, 2, 2)
		goal.new(3, 3)
		goal.new(5, 3)
		goal.new(7, 3)
		goal.new(4, 4)
		goal.new(6, 4)
		goal.new(3, 5)
		goal.new(7, 5)
		goal.new(4, 6)
		goal.new(6, 6)
		goal.new(3, 7)
		goal.new(5, 7)
		goal.new(7, 7)
		box.new(4, 3)
		box.new(6, 3)
		box.new(3, 4)
		box.new(5, 4)
		box.new(7, 4)
		box.new(4, 5)
		box.new(6, 5)
		box.new(3, 6)
		box.new(5, 6)
		box.new(7, 6)
		box.new(4, 7)
		box.new(6, 7)
		enemy.new((7 - 1) * 48 + 4, (2 - 1) * 48 + 4, "down")
		enemy.new((2 - 1) * 48 + 4, (3 - 1) * 48 + 4, "right")
		enemy.new((3 - 1) * 48 + 4, (8 - 1) * 48 + 4, "up")
		enemy.new((8 - 1) * 48 + 4, (7 - 1) * 48 + 4, "left")
	end
	
	game.map = stage.map[stg]
		
	player.init((door.start.x - 1) * 48 + 4, (door.start.y - 1) * 48 + 4) --init player axis according to game.startx/starty
	
	if goal.check() == true then
		game.solved = true
	else
		game.solved = false
	end
	
	game.scene = 2
	
end

function scene.game.update(dt)
	player.update(dt)
	enemy.update(dt)
	box.update(dt)
end

function scene.game.keypressed(key)
	if key == "r" then
		--restart level
		if not(player.state == "dead") then
			scene.game.load(game.stage)
		end
	end
end

function scene.game.draw()
	--draw map
	local a
	local b
	
	for a = 1, 9 do
		for b = 1, 9 do
			love.graphics.draw(imgtile, quadtile[game.map[b][a] + 1], 0, (a - 1) * 48)
		end
	end
	
	--draw door
	door.draw()
	
	--draw box
	box.draw()
	
	--draw goal
	goal.draw()
	
	--draw enemy
	enemy.draw()
	
	--draw player
	player.draw()
	
	--draw ui
	ui.draw()
end
-------------------------------------------

function scene.gameover.load()
	game.scene = 3
	
end

function scene.gameover.update(dt)
	
end

function scene.gameover.keypressed(key)
	if key == "r" then
		player.life = 3
		scene.game.load(game.stage)
	elseif key == "q" then
		love.event.quit()
	end
end

function scene.gameover.draw()
	love.graphics.draw(imggameover)
end

-------------------------------------------

function scene.ending.load()
	game.scene = 4
	scene.ending.sirocco = {}
	scene.ending.sirocco.x = 68
	scene.ending.sirocco.y = 306
	scene.ending.raindrop = {}
	scene.ending.tmrrain = 0
	scene.ending.sequence = 1 --1:rain 2:wait 1.5 sec
end

function scene.ending.update(dt)
	if scene.ending.sequence == 1 then
		if not(#scene.ending.raindrop > 100) then
			scene.ending.tmrrain = scene.ending.tmrrain + dt
			if scene.ending.tmrrain >= 0.1 then
				scene.ending.tmrrain = scene.ending.tmrrain - 0.1
				scene.ending.raindrop[#scene.ending.raindrop + 1] = {}
				scene.ending.raindrop[#scene.ending.raindrop].x = math.random(0, 432)
				scene.ending.raindrop[#scene.ending.raindrop].y = math.random(0, 432)
				scene.ending.raindrop[#scene.ending.raindrop].height = math.random(10, 35)
				scene.ending.raindrop[#scene.ending.raindrop].width = 8
			end
		else
			scene.ending.sequence = 2
			scene.ending.tmrrain = 0
		end
	elseif scene.ending.sequence == 2 then
		scene.ending.tmrrain = scene.ending.tmrrain + dt
		if scene.ending.tmrrain >= 2 then
			scene.title.load() --to title scene
		end
	end
end

function scene.ending.draw()
	local a
	love.graphics.draw(imgbackground)
	love.graphics.draw(imgplayer["down"][1], scene.ending.sirocco.x, scene.ending.sirocco.y)
	for a = 1, #scene.ending.raindrop do
		love.graphics.setColor(37, 0, 200)
		love.graphics.rectangle("fill", scene.ending.raindrop[a].x, scene.ending.raindrop[a].y, scene.ending.raindrop[a].width, scene.ending.raindrop[a].height)
		love.graphics.setColor(255, 255, 255)
	end
end

-------------------------------------------