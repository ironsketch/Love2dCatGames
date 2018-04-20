debug = true
require("AnAL")


-- Variables
totallove = 0
currency = 0
presstime = 0
stime = 0


function love.load(arg)
   
   -- Screen Resolution
   love.window.setMode(450, 800, {resizable=false, vsync=false, minwidth=450, minheight=800})

   -- Music

   -- Sound Affects

   -- Images
   background = love.graphics.newImage('assets/newback.png')
   cat = love.graphics.newImage('assets/kit2.png')
   catwidth = cat:getWidth( )
   catheight = cat:getHeight( )
   currlovebar = love.graphics.newImage('assets/bar.png')

   -- Animations
   loveImg = love.graphics.newImage('assets/addlove.png')
   pickup = love.graphics.newImage('assets/pickup.png')

end

function love.update(dt)
   if love.keyboard.isDown('escape') then
      love.event.push('quit')
   end
   -- Animation updates
   -- earanim:update(dt)
   if plusanim then
      plusanim:update(dt)
   end
   if cpickup then
      cpickup:update(dt)
   end
   
   
end

-- Pressing the Mouse

function love.mousepressed(x, y, button)
   if x > 100 and x < 300 and
   y > 500 and y < 700 then
      stime = love.timer.getTime()
   end
end

-- Releasing the Mouse

function love.mousereleased(x, y, button)
   etime = love.timer.getTime()
   presstime = etime - stime
   if x > 100 and x < 100 + catwidth and
   y > 500 and y < 500 + catheight  and presstime < .69 then
      px = x - 25
      py = y - 25
      plusanim = newAnimation(loveImg, 50, 50, 0.1, 0)
      plusanim:setMode("once")
      totallove = totallove + 1
      currency = currency + 1
   elseif x > 100 and x < 300 and
   y > 500 and y < 700  and presstime >= .69 then
      px = catheight / 2
      py = catwidth / 2
     cpickup = newAnimation(pickup, 208, 260, 0.1, 0)
      cpickup:setMode("loop")
   end

end

function love.draw(dt)
   
   love.graphics.draw(background, 0, 0)
   
   if cpickup then
      x, y = love.mouse.getPosition( )
      cpickup:draw(px, py)
   else
      
      love.graphics.draw(cat, 100, 500)
      if plusanim then
	 plusanim:draw(px, py)
      end
      
   end
   love.graphics.draw(currlovebar, 225, 743)
   love.graphics.print(totallove, 245, 768)
   love.graphics.print(presstime, 265, 10)
   
   
end
   
