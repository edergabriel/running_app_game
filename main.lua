--------------------------------------------------------------------------------
-- Perspective Demo
--------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)

--------------------------------------------------------------------------------
-- Localize
--------------------------------------------------------------------------------
local require = require
local physics = require( "physics" )
local perspective = require("perspective")
playerInAir = true; -- Set a boolean of whether our guy is in the air or not
playerDirection = true;

physics.start()
physics.setGravity( 0, 100 )

local function forcesByAngle(totalForce, angle) local forces = {} local radians = -math.rad(angle) forces.x = math.cos(radians) * totalForce forces.y = math.sin(radians) * totalForce return forces end

--------------------------------------------------------------------------------
-- Build Camera
--------------------------------------------------------------------------------
local camera = perspective.createView()

BG = display.newImage( "img/sky.jpg" );
BG:translate( 160, 240 );
BG.x = display.contentCenterX;
BG.y = display.contentCenterY;
BG.anchorX = 0.5;
BG.anchorY = 0.5;

camera:add(BG, 8)

BG_buildings1 = display.newImage( "img/sky_buildings.png" );
BG_buildings1:translate( 160, 240 );
BG_buildings1.x = display.contentCenterX;
BG_buildings1.y = display.contentCenterY;
BG_buildings1.anchorX = 0.5;
BG_buildings1.anchorY = 0.5;

camera:add(BG_buildings1, 4)

BG_buildings1 = display.newImage( "img/sky_buildings1.png" );
BG_buildings1:translate( 160, 240 );
BG_buildings1.x = display.contentCenterX;
BG_buildings1.y = display.contentCenterY;
BG_buildings1.anchorX = 0.5;
BG_buildings1.anchorY = 0.5;

camera:add(BG_buildings1, 6)

local cs_options1 = 
{
  -- Required params
  width = 30,
  height = 100,
  numFrames = 6,
  -- content scaling
  sheetContentWidth = 256,
  sheetContentHeight = 128,
}

arrowStaticSheet = graphics.newImageSheet( "img/arrow_ss.png", cs_options1 )

arrow = display.newSprite( arrowStaticSheet, { name="arrowSS", start=1, count=6, time=700 } )
arrow:translate( 160, 240 );
arrow.x = display.contentCenterX;
arrow.y = display.contentCenterY +270;
arrow.anchorX = 0.5;
arrow.anchorY = 0.5;
--physics.addBody(arrow1, "static", {density=1, bounce=0, friction=1, isSensor=true})
arrow.name = "arrow";
arrow.group = "obstacle1"
arrow.whichBall = "red"

arrow:play()
camera:add(arrow, 1)

garrafa1 = display.newImageRect( "img/bottle.png", 20, 40 );
garrafa1:translate( 160, 240 );
garrafa1.x = display.contentCenterX;
garrafa1.y = display.contentCenterY + 380;
garrafa1.anchorX = 0.5;
garrafa1.anchorY = 0.5;
physics.addBody(garrafa1, "static", {density=1, bounce=0, friction=1, isSensor=true})
garrafa1.name = "garrafa";
garrafa1.group = "obstacle1"
garrafa1.whichBall = "red"

camera:add(garrafa1, 1)


arrow1 = display.newSprite( arrowStaticSheet, { name="arrowSS", start=1, count=6, time=700 } )
arrow1:translate( 160, 240 );
arrow1.x = display.contentCenterX -500;
arrow1.y = display.contentCenterY +270;
arrow1.anchorX = 0.5;
arrow1.anchorY = 0.5;
--physics.addBody(arrow1, "static", {density=1, bounce=0, friction=1, isSensor=true})
arrow1.name = "arrow";
arrow1.group = "obstacle2"
arrow1.whichBall = "red"

arrow1:play()
camera:add(arrow1, 1)

garrafa1 = display.newImageRect( "img/bottle.png", 20, 40 );
garrafa1:translate( 160, 240 );
garrafa1.x = display.contentCenterX - 500;
garrafa1.y = display.contentCenterY + 380;
garrafa1.anchorX = 0.5;
garrafa1.anchorY = 0.5;
physics.addBody(garrafa1, "static", {density=1, bounce=0, friction=1, isSensor=true})
garrafa1.name = "garrafa";
garrafa1.group = "obstacle2"
garrafa1.whichBall = "red"
--garrafa1 = {value = arrow1}

camera:add(garrafa1, 1)


arrow2 = display.newSprite( arrowStaticSheet, { name="arrowSS", start=1, count=6, time=700 } )
arrow2:translate( 160, 240 );
arrow2.x = display.contentCenterX +240;
arrow2.y = display.contentCenterY +270;
arrow2.anchorX = 0.5;
arrow2.anchorY = 0.5;
--physics.addBody(arrow1, "static", {density=1, bounce=0, friction=1, isSensor=true})
arrow2.name = "arrow";
arrow2.group = "obstacle3"
arrow2.whichBall = "red"

arrow2:play()
camera:add(arrow2, 1)


local image1 = { type="image", filename="img/pneu.png" }
local image2 = { type="image", filename="img/pneu.png" }

pneu1 = display.newImageRect( "img/pneu.png", 35, 32 );
pneu1:translate( 160, 240 );
pneu1.x = display.contentCenterX + 240;
pneu1.y = display.contentCenterY + 385;
pneu1.anchorX = 0.5;
pneu1.anchorY = 0.5;
physics.addBody(pneu1, "static", {density=1, bounce=0, friction=1, isSensor=true})
pneu1.name = "pneu";
pneu1.group = "obstacle3";
pneu1.fill = image1
pneu1.whichBall = "red"

camera:add(pneu1, 1)





   local solidTower2 = display.newRect(display.contentCenterX - 1330, display.contentCenterY + 400, 2400, 500)
   solidTower2.anchorX = 0
   solidTower2.anchorY = 0
   solidTower2.name = "ground"
   solidTower2.fill = { type="image", filename="img/ground.jpg" }
   physics.addBody(solidTower2, "static", {density=1, bounce=0.1, friction=.2})
   camera:add(solidTower2, 1)

   local solidTower3 = display.newImageRect('img/buildings.png',500, 800)
   solidTower3.anchorX = 0
   solidTower3.anchorY = 0
   solidTower3.x = display.contentCenterX - 1530
   solidTower3.y = display.contentCenterY - 400
   solidTower3.name = "wall"
   physics.addBody(solidTower3, "static", {density=1, bounce=0.1, friction=.2})
   camera:add(solidTower3, 1)



   local solidTower3 = display.newImageRect('img/house.jpg',200, 250)
   solidTower3.anchorX = 0
   solidTower3.anchorY = 0
   solidTower3.x = display.contentCenterX - 430
   solidTower3.y = display.contentCenterY + 150
   solidTower3.name = "ground"
   solidTower3.collType = "passthru"
   physics.addBody(solidTower3, "static", {density=1, bounce=0.1, friction=.2})
   camera:add(solidTower3, 1)

   local solidTower4 = display.newImageRect('img/buildings.png',500	, 800)
   solidTower4.anchorX = 0
   solidTower4.anchorY = 0
   solidTower4.x = display.contentCenterX + 630
   solidTower4.y = display.contentCenterY - 400
   solidTower4.name = "wall"
   physics.addBody(solidTower4, "static", {density=1, bounce=0.1, friction=.2})
   camera:add(solidTower4, 1)
   --[[
   local ground1 = display.newRect(display.contentCenterX - 400, display.contentCenterY + 200, 300, 300)
   ground1.anchorX = 0
   ground1.anchorY = 0
   ground1.name = "ground"
   ground1.collType = "passthru"
   --object.fill = { type="image", filename="img/corona-logo.png" }
   physics.addBody(ground1, "static", {density=1, bounce=0.1, friction=.2})
   camera:add(ground1, 1)

	local ground2 = display.newRect(display.contentCenterX - 400, display.contentCenterY,100, 100)
	ground2.anchorX = 0
	ground2.anchorY = 0
	ground2.name = "ground"
	ground2.collType = "passthru"
	--object.fill = { type="image", filename="img/corona-logo.png" }
	physics.addBody(ground2, "static", {density=1, bounce=0.1, friction=.2})
	camera:add(ground2, 1)
	]]--

--------------------------------------------------------------------------------
-- Build Player
--------------------------------------------------------------------------------

   local cs_options = 
   {
     -- Required params
     width = 36,
     height = 50,
     numFrames = 4,
     -- content scaling
     sheetContentWidth = 128,
     sheetContentHeight = 128,
   }

   playerStaticSheet = graphics.newImageSheet( "img/player_ss.png", cs_options )


  local player =  display.newSprite( playerStaticSheet, { name="playerSS", start=1, count=4, time=500 } )

player.anchorX = 0.5 -- Slightly more "realistic" than center-point rotating
physics.addBody(player, "dynamic", {density=1, bounce=0, friction=1})  --- CORREçâo!!!!!!! ApENAS PROTOTIPO :::dynamic // static
-- Some various movement parameters
player.angularVelocity = 0           -- Speed at which player rotates
player.angularAcceleration = 1.05    -- Angular acceleration rate
player.angularDamping = 0.9          -- Angular damping rate
player.angularMax = 10               -- Max angular velocity
player.moveSpeed = 0                 -- Current movement speed
player.linearDamping = 0             -- Linear damping rate
player.linearAcceleration = 1.05     -- Linear acceleration rate
player.linearMax = 10                -- Max linear velocity
player.name = "player"
player.playerVelocity = 10;
player.setAsSensor = false
player.isFixedRotation = true -- rotação fixa

player:play()

camera:add(player, 1) -- Add player to layer 1 of the camera

camera:setParallax(1, 0.9, 0.8, 0.7, 0.6, 0.5, 0.4, 0.3) -- Here we set parallax for each layer in descending order

--------------------------------------------------------------------------------
-- Runtime Loop
--------------------------------------------------------------------------------
local function enterFrame(event)

	player.x = player.x + player.playerVelocity


	
	--player:rotate(player.angularVelocity)
end

local function onScreenTouch(event)
	if ( event.phase == "began" and playerInAir == false) then
		if (player.playerVelocity > 0) then
			player:applyForce(350, -1900, player.x, player.y)
		else
			player:applyForce(-350, -1900, player.x, player.y)
		end
		playerInAir = true
	end
	return true
end
-- Detect whether the player is in the air or not
function onCollision( event )

	--print("event.object1.name: ", event.object1.name)
	if(event.object1.name == "ground" and event.object2.name == "player") then
		playerInAir = false;
	end


	if (event.phase == "began" and event.object1.name == "wall") then
		
		if(event.object1.name == "wall" and event.object2.name == "player") then
			playerDirection = true
			if (player.playerVelocity > 0) then
				player.playerVelocity = -10
				player.xScale = -1
			else
				player.playerVelocity = 10
				player.xScale = 1
			end
		end
	end

	if (event.phase == "began" and event.object1.name == "pneu" and event.object2.name == "player") then
		if ( pneu1.whichBall == "red" ) then
		   pneu1.fill = image2
		   pneu1.whichBall = "blue"
		--[[else
		   pneu1.fill = image1
		   pneu1.whichBall = "red"]]--
		   if arrow2.group == event.object1.group then
		   	arrow2.alpha = 0
		   end
		end
	end


	if (event.phase == "began" and event.object1.name == "garrafa" and event.object2.name == "player") then
		event.object1.yScale = -1
		
		print(event.object1.group)


			if arrow1.group == event.object1.group then
				arrow1.alpha = 0
			end

			if arrow.group == event.object1.group then
				arrow.alpha = 0
			end



	end
end

function player:preCollision( event )


	if ( event.other.collType == "passthru" ) then



		local charBase = self.y+20
		local platTop = event.other.y-32

		print("charBase: ", charBase, "platTop: ", platTop+38)

		if ( charBase > platTop+38 and event.contact ~= nil ) then
			event.contact.isEnabled = false
			--self.isSensor = true ; 
			--self.setAsSensor = true
			self.playerInAir = false;
		end

		--[[local vx,vy = self:getLinearVelocity()
		if ( vy < 0 ) then
			event.contact.isEnabled = false
			self.isSensor = true ; self.setAsSensor = true
		end]]--

	end
end


function player:collision( event )
	if ( event.phase == "ended" ) then
		self.isSensor = false ; self.setAsSensor = false
		self.playerInAir = false;
	end
end


--------------------------------------------------------------------------------
-- Add Listeners
--------------------------------------------------------------------------------
player:addEventListener( "preCollision" )
player:addEventListener( "collision" )
Runtime:addEventListener("enterFrame", enterFrame)
Runtime:addEventListener( "collision", onCollision )
Runtime:addEventListener("touch", onScreenTouch)
camera.damping = 10 -- A bit more fluid tracking
camera:setFocus(player) -- Set the focus to the player
camera:track() -- Begin auto-tracking