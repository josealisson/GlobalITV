local menu_background = canvas:new('patternmenubar.png') -- Associates the figure patternmenubar to the menu_background var
local dx, dy = menu_background:attrSize() -- dx e dy gets the size of the image patternmenubar
local menu = { img = menu_background, x=10 , y=10, dx=dx, dy=dy } -- Menu with image, position x e y and sizes dx, dy, respectively

local buttons = {'btncondition.png', 'btndisease.png', 'btnservice.png'} -- Array of the images of the buttons

function loadMenuButtons (buttons)
  local menu_btns = {}
  local button
  
  for key, value in ipairs(buttons) do
    button = { img = canvas:new(value) }
    button.dmbx, button.dmby = button.img:attrSize()
    button.x = menu.dx/5
    button.y = menu.dy/5 + key*button.dmby
    table.insert(menu_btns, button)
  end
  return menu_btns
end

menu.buttons = loadMenuButtons(buttons)

local img_cursor = canvas:new('monkey.png')
local cursor = {img=img_cursor, x=menu.buttons[0].dmbx + menu.buttons[self.index].x, y=menu.buttons[self.index].y, dx=menu.buttons[0].dmbx, dy=menu.buttons[0].dmby, index=0}

function redraw ()
	canvas:attrColor('black')
	canvas:drawRect('fill', 0,0, canvas:attrSize())
  canvas:compose(menu.x, menu.y, menu.img)
	for i = 0, 2, 1 do
	 canvas:compose(menu.buttons[i].x, menu.buttons[i].y, menu.buttons[i].img)
	end
	canvas:compose(cursor.x, cursor.y, cursor.img)
	canvas:flush()
end

-- Funcao de colisao:
-- chamada a cada tecla pressionada
-- checa se o macaco esta em cima da banana
--function collide (A, B)
--	local ax1, ay1 = A.x, A.y
--	local ax2, ay2 = ax1+A.dx, ay1+A.dy
--	local bx1, by1 = B.x, B.y
--	local bx2, by2 = bx1+B.dx, by1+B.dy
--
--	if ax1 > bx2 then
--		return false
--	elseif bx1 > ax2 then
--		return false
--	elseif ay1 > by2 then
--		return false
--	elseif by1 > ay2 then
--		return false
--	end
--
--	return true
--end
--
--local IGNORE = false

-- Funcao de tratamento de eventos:
function handler (evt)
	if IGNORE then
		return
	end
  
  array = {"Lua", "Tutorial"}
  for key,value in ipairs(array) 
  do
     print(key, value)
  end
	-- apenas eventos de tecla me interessam
	if evt.class == 'key' and evt.type == 'press'
	then
		-- apenas as setas movem o macaco
		if evt.key == 'CURSOR_UP' then
			cursor.y = cursor.y - menu.buttons[0].dmby
			cursor.index = cursor.index - 1
			if cursor.index == -1 then
			  cursor.index = 2
			end
		  print('pressed up')
		elseif evt.key == 'CURSOR_DOWN' then
			cursor.y = cursor.y - menu.buttons[0].dmby
			cursor.index = cursor.index + 1
      if cursor.index == 3 then
        cursor.index = 0
      end
      print('pressed down')
		end
    event.post {
        class  = 'ncl',
        type   = 'presentation',
        label  = 'menu',
        action = 'start',
    }
	end
    -- redesenha a tela toda
    --redraw()
end

event.register(handler)
