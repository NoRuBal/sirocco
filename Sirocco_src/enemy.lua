enemy = {}

function enemy.init()
	local a
	for a = 1, #enemy do
		enemy[a].enabled = false
	end
	
	enemy.speed = 80
	enemy.tmrani = 0
	enemy.animation = 1
end

function enemy.new(x, y, direction)
	local index
	local a
	index = #enemy + 1
	for a = 1, #enemy do
		if enemy[a].enabled == false then
			index = a
			break
		end
	end
	
	enemy[index] = {}
	enemy[index].x = x
	enemy[index].y = y
	enemy[index].direction = direction --left/right/up/down
	enemy[index].enabled = true
end

function enemy.update(dt)
	--move enemy
	local a
	for a = 1, #enemy do
		if enemy[a].enabled == true then
			enemy.move(a, enemy[a].direction, enemy.speed * dt)
		end
	end
	
	--enemy animation
	enemy.tmrani = enemy.tmrani + dt
	if enemy.tmrani >= 0.5 then
		enemy.tmrani = enemy.tmrani - 0.5
		if enemy.animation == 1 then
			enemy.animation = 2
		else
			enemy.animation = 1
		end
	end
end

function enemy.move(index, direction, speed)
	local fakex
	local fakey
	local tx1
	local ty1
	local tx2
	local ty2
	
	fakex = enemy[index].x
	fakey = enemy[index].y
	
	if direction == "up" then
		fakey = fakey - speed
		
		tx1, ty1 = collision.postotile(collision.objtocorner(fakex, fakey, 0))
		tx2, ty2 = collision.postotile(collision.objtocorner(fakex, fakey, 2))
		
		if game.map[tx1][ty1] == 1 or game.map[tx2][ty2] == 1 then
			fakey = ty1 * 48
			enemy[index].direction = "down"
		end
		
	elseif direction == "down" then
		fakey = fakey + speed
		
		tx1, ty1 = collision.postotile(collision.objtocorner(fakex, fakey, 1))
		tx2, ty2 = collision.postotile(collision.objtocorner(fakex, fakey, 3))
		
		if game.map[tx1][ty1] == 1 or game.map[tx2][ty2] == 1 then
			fakey = (ty1 - 1) * 48 - player.height
			enemy[index].direction = "up"
		end
		
	elseif direction == "left" then
		fakex = fakex - speed
		
		tx1, ty1 = collision.postotile(collision.objtocorner(fakex, fakey, 0))
		tx2, ty2 = collision.postotile(collision.objtocorner(fakex, fakey, 1))
		
		if game.map[tx1][ty1] == 1 or game.map[tx2][ty2] == 1 then
			fakex = tx1 * 48
			enemy[index].direction = "right"
		end
		
	elseif direction == "right" then
		fakex = fakex + speed
		
		tx1, ty1 = collision.postotile(collision.objtocorner(fakex, fakey, 2))
		tx2, ty2 = collision.postotile(collision.objtocorner(fakex, fakey, 3))
		
		if game.map[tx1][ty1] == 1 or game.map[tx2][ty2] == 1 then
			fakex = (tx1 - 1) * 48 - player.width
			enemy[index].direction = "left"
		end
		
	end
	
	--collision with player
	if not(player.invincible == true) then
		if collision.check(fakex, fakey, 40, 40, player.x, player.y, player.width, player.height) then
			player.life = player.life - 1
			if player.life <= 0 then
				--if life <= 0, kill player
				if not(player.state == "dead") then
					player.state = "dead"
					player.animation = 1
					player.tmrani = 0
				end
			else
				player.invincible = true
				player.tmrinvin = 0
				player.tmrblink = 0
				player.blink = false
			end
		end
	end
	
	enemy[index].x = fakex
	enemy[index].y = fakey
end

function enemy.draw()
	--draw enemy
	local a
	for a = 1, #enemy do
		if enemy[a].enabled == true then
			love.graphics.draw(imgenemy[enemy.animation], enemy[a].x, enemy[a].y)
		end
	end
end