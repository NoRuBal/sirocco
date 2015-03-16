player = {}

function player.init(x, y)
	player.x = x
	player.y = y
	player.width = 32
	player.height = 32
	player.speed = 150
	
	player.direction = "down"
	player.state = "stop" --stop/walking/dead
	player.animation = 1
	player.tmrani = 0
	player.deadtmr = 0
	
	player.invincible = false
	player.blink = false
	player.tmrinvin = 0
	player.tmrblink = 0
end

function player.update(dt)
	--invincible player
	if player.invincible == true then
		--blinking
		player.tmrblink = player.tmrblink + dt
		if player.tmrblink >= 0.2 then
			player.tmrblink = player.tmrblink - 0.2
			if player.blink == false then
				player.blink = true
			else
				player.blink = false
			end
		end
		
		player.tmrinvin = player.tmrinvin + dt
		if player.tmrinvin >= 1.5 then
			player.invincible = false
			player.blink = false
		end
		
	end
	
	if (player.state == "stop") or (player.state == "walk") then
		if love.keyboard.isDown("up") then
			player.move("up", player.speed * dt)
		elseif love.keyboard.isDown("down") then
			player.move("down", player.speed * dt)
		elseif love.keyboard.isDown("left") then
			player.move("left", player.speed * dt)
		elseif love.keyboard.isDown("right") then
			player.move("right", player.speed * dt)
		else
			player.state = "stop"
			player.animation = 1
		end
	end
	
	--player animation
	if player.state == "walk" then
		player.tmrani = player.tmrani + dt
		if player.tmrani >= 0.2 then
			player.tmrani = player.tmrani - 0.2
			if player.animation == 4 then
				player.animation = 1
			else
				player.animation = player.animation + 1
			end
		end
	elseif player.state == "dead" then
		player.tmrani = player.tmrani + dt
		if player.tmrani >= 0.2 then
			
			player.tmrani = player.tmrani - 0.2
			if player.animation == 3 then
				player.deadtmr = player.deadtmr + 1
				if player.deadtmr >= 5 then
					scene.gameover.load() --game over scene
				end
			else
				player.animation = player.animation + 1
			end
		end
	end
end

function player.move(direction, speed)
	local fakex
	local fakey
	local tx1, ty1
	local tx2, ty2
	local a
	
	--player cannot move while box is moving
	for a = 1, #box do
		if box[a].enabled == true then
			if not(box[a].state == "static") then
				return
			end
		end
	end
	
	player.state = "walk"
	player.direction = direction
	
	fakex = math.floor(player.x)
	fakey = math.floor(player.y)
	
	if direction == "up" then
		fakey = fakey - speed
		
		tx1, ty1 = collision.postotile(collision.objtocorner(fakex, fakey, 0))
		tx2, ty2 = collision.postotile(collision.objtocorner(fakex, fakey, 2))
		
		if game.map[tx1][ty1] == 1 or game.map[tx2][ty2] == 1 then
			fakey = ty1 * 48
		end
		
		--collision with box
		for a = 1, #box do
			if box[a].enabled == true then
				if collision.check(fakex, fakey, player.width, player.height, (box[a].x - 1) * 48, (box[a].y - 1) * 48, 48, 48) then
					--push the box, and check if box was pushed or not
					if box.move(a, direction) == false then
						fakey = (box[a].y) * 48
					end
				end
			end
		end
		
	elseif direction == "down" then
		fakey = fakey + speed
		
		tx1, ty1 = collision.postotile(collision.objtocorner(fakex, fakey, 1))
		tx2, ty2 = collision.postotile(collision.objtocorner(fakex, fakey, 3))
		
		if game.map[tx1][ty1] == 1 or game.map[tx2][ty2] == 1 then
			fakey = (ty1 - 1) * 48 - player.height
		end
		
		--collision with box
		for a = 1, #box do
			if box[a].enabled == true then
				if collision.check(fakex, fakey, player.width, player.height, (box[a].x - 1) * 48, (box[a].y - 1) * 48, 48, 48) then
					--push the box, and check if box was pushed or not
					if box.move(a, direction) == false then
						fakey = (box[a].y - 1) * 48 - player.width
					end
				end
			end
		end
		
	elseif direction == "left" then
		fakex = fakex - speed
		
		tx1, ty1 = collision.postotile(collision.objtocorner(fakex, fakey, 0))
		tx2, ty2 = collision.postotile(collision.objtocorner(fakex, fakey, 1))
		
		if game.map[tx1][ty1] == 1 or game.map[tx2][ty2] == 1 then
			fakex = tx1 * 48
		end
		
		--collision with box
		for a = 1, #box do
			if box[a].enabled == true then
				if collision.check(fakex, fakey, player.width, player.height, (box[a].x - 1) * 48, (box[a].y - 1) * 48, 48, 48) then
					--push the box, and check if box was pushed or not
					if box.move(a, direction) == false then
						fakex = (box[a].x) * 48
					end
				end
			end
		end
		
	elseif direction == "right" then
		fakex = fakex + speed
		
		tx1, ty1 = collision.postotile(collision.objtocorner(fakex, fakey, 2))
		tx2, ty2 = collision.postotile(collision.objtocorner(fakex, fakey, 3))
		
		if game.map[tx1][ty1] == 1 or game.map[tx2][ty2] == 1 then
			fakex = (tx1 - 1) * 48 - player.width
		end
		
		--collision with box
		for a = 1, #box do
			if box[a].enabled == true then
				if collision.check(fakex, fakey, player.width, player.height, (box[a].x - 1) * 48, (box[a].y - 1) * 48, 48, 48) then
					--push the box, and check if box was pushed or not
					if box.move(a, direction) == false then
						fakex = (box[a].x - 1) * 48 - player.width
					end
				end
			end
		end
		
	end
	
	--collision with opened door
	if game.solved == true then
		if collision.check(fakex, fakey, player.width, player.height, (door.next.x - 1) * 48, (door.next.y - 1) * 48, 48, 48) then
			if game.stage == #stage.map then
				--ending scene if last scene
				scene.ending.load()
			else
				scene.game.load(game.stage + 1) 
				return
			end
		end
	end
	
	player.x = fakex
	player.y = fakey
end

function player.draw()
	--love.graphics.draw(imgplayer, player.x, player.y)
	if player.blink == false then
		if player.state == "dead" then
			love.graphics.draw(imgplayer["dead"][player.animation], player.x - 4, player.y - 4)
		else
			if player.blink == false then
				love.graphics.draw(imgplayer[player.direction][player.animation], player.x - 4, player.y - 4)
			end
		end
	end
end