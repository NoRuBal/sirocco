game = {}

require "scene"
require "stage"
require "player"
require "collision"
require "box"
require "goal"
require "door"
require "enemy"
require "ui"

function love.load()
	--init randomizer
	math.randomseed = os.time()
	
	--load resources
	numberfont = love.graphics.newImageFont("graphics/numbers.png", "0123456789:")
	love.graphics.setFont(numberfont)
	
	imgtitle = love.graphics.newImage("graphics/title.png")
	imganykey = love.graphics.newImage("graphics/anykey.png")
	
	imgbackground = love.graphics.newImage("graphics/background.png")
	imgtile = love.graphics.newImage("graphics/tile.png")
	--imgplayer = love.graphics.newImage("graphics/player.png")
	imgbox = love.graphics.newImage("graphics/box.png")
	imggoal = love.graphics.newImage("graphics/goal.png")
	imgstartdoor = love.graphics.newImage("graphics/door_start.png")
	imgenddoor = love.graphics.newImage("graphics/door_end.png")
	--imgenemy = love.graphics.newImage("graphics/enemy.png")
	
	imgenemy = {}
	imgenemy[1] = love.graphics.newImage("graphics/enemy_1.png")
	imgenemy[2] = love.graphics.newImage("graphics/enemy_2.png")
	
	imglife = love.graphics.newImage("graphics/life.png")
	imgfloor = love.graphics.newImage("graphics/floor.png")
	imgheart = {}
	imgheart[1] = love.graphics.newImage("graphics/heart_empty.png")
	imgheart[2] = love.graphics.newImage("graphics/heart_full.png")
	
	imgplayer = {}
	imgplayer["up"] = {}
	imgplayer["up"][1] = love.graphics.newImage("graphics/sirocco_back.png")
	imgplayer["up"][2] = love.graphics.newImage("graphics/sirocco_back_walk1.png")
	imgplayer["up"][3] = love.graphics.newImage("graphics/sirocco_back.png")
	imgplayer["up"][4] = love.graphics.newImage("graphics/sirocco_back_walk2.png")
	imgplayer["down"] = {}
	imgplayer["down"][1] = love.graphics.newImage("graphics/sirocco_front.png")
	imgplayer["down"][2] = love.graphics.newImage("graphics/sirocco_front_walk1.png")
	imgplayer["down"][3] = love.graphics.newImage("graphics/sirocco_front.png")
	imgplayer["down"][4] = love.graphics.newImage("graphics/sirocco_front_walk2.png")
	imgplayer["left"] = {}
	imgplayer["left"][1] = love.graphics.newImage("graphics/sirocco_left.png")
	imgplayer["left"][2] = love.graphics.newImage("graphics/sirocco_left_walk1.png")
	imgplayer["left"][3] = love.graphics.newImage("graphics/sirocco_left.png")
	imgplayer["left"][4] = love.graphics.newImage("graphics/sirocco_left_walk2.png")
	imgplayer["right"] = {}
	imgplayer["right"][1] = love.graphics.newImage("graphics/sirocco_right.png")
	imgplayer["right"][2] = love.graphics.newImage("graphics/sirocco_right_walk1.png")
	imgplayer["right"][3] = love.graphics.newImage("graphics/sirocco_right.png")
	imgplayer["right"][4] = love.graphics.newImage("graphics/sirocco_right_walk2.png")
	imgplayer["dead"] = {}
	imgplayer["dead"][1] = love.graphics.newImage("graphics/sirocco_dead_1.png")
	imgplayer["dead"][2] = love.graphics.newImage("graphics/sirocco_dead_2.png")
	imgplayer["dead"][3] = love.graphics.newImage("graphics/sirocco_dead_3.png")
	
	imggameover = love.graphics.newImage("graphics/gameover.png")
	
	quadtile = {}
	quadtile[1] = love.graphics.newQuad(0, 0, 48, 48, 96, 48) --wall
	quadtile[2] = love.graphics.newQuad(48, 0, 48, 48, 96, 48) --blank
	
	quadgoal = {}
	quadgoal[1] = love.graphics.newQuad(0, 0, 48, 48, 96, 48) --unachieved goal
	quadgoal[2] = love.graphics.newQuad(48, 0, 48, 48, 96, 48) --achieved goal
	
	quaddoor = {}
	quaddoor[1] = love.graphics.newQuad(0, 0, 48, 48, 96, 48) --closed door
	quaddoor[2] = love.graphics.newQuad(48, 0, 48, 48, 96, 48) --opened door
	
	--set global variables
	game.scene = 0 --current scene
	game.stage = 0 --current stage
	game.solved = false --stage got solved?
	game.map = {}
	player.life = 3
	
	--set line mode
	love.graphics.setLineStyle("rough")
	love.graphics.setDefaultFilter("nearest", "nearest")
	
	--init everything
	stage.init()
	
	scene.title.load()
end

function love.update(dt)
	dt = math.min(dt, 1/30)
	
	if game.scene == 0 then --title scene
		scene.title.update(dt)
	elseif game.scene == 1 then --opening scene
		scene.opening.update(dt)
	elseif game.scene == 2 then --ingame scene
		scene.game.update(dt)
	elseif game.scene == 3 then --game over scene
		scene.gameover.update(dt)
	elseif game.scene == 4 then --ending scene
		scene.ending.update(dt)
	end
end

function love.draw()
	if game.scene == 0 then --title scene
		scene.title.draw()
	elseif game.scene == 1 then --opening scene
		scene.opening.draw()
	elseif game.scene == 2 then --ingame scene
		scene.game.draw()
	elseif game.scene == 3 then --game over scene
		scene.gameover.draw()
	elseif game.scene == 4 then --ending scene
		scene.ending.draw()
	end
end

function love.keypressed(key)
	if game.scene == 0 then --title scene
		scene.title.keypressed(key)
	elseif game.scene == 1 then --opening scene
		scene.opening.keypressed(key)
	elseif game.scene == 2 then --ingame scene
		scene.game.keypressed(key)
	elseif game.scene == 3 then --gameover scene
		scene.gameover.keypressed(key)
	end
end