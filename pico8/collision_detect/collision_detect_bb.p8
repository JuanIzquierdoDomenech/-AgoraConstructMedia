pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
function _init()
 a = {x=64, y=64, w=3, h=3}
 b = {x=80, y=80, w=5, h=5}
 is_collision = false
end

function _update()
 move_a()
 move_b()
 
 is_collision = detect_collision(a,b)
end

function detect_collision(el1,el2)
 if el1.x+el1.w >= el2.x
 and el2.x+el2.w >= el1.x
 and el1.y+el1.h >= el2.y
 and el2.y+el2.h >= el1.y then
  return true
 end
 
 return false
end

function move_a()
 if btn(➡️,0) then
  a.x += 1
 end
 
 if btn(⬅️,0) then
  a.x -= 1
 end
 
 if btn(⬇️,0) then
  a.y += 1
 end
 
 if btn(⬆️,0) then
  a.y -= 1
 end
end

function move_b()
 if btn(➡️,1) then
  b.x += 1
 end
 
 if btn(⬅️,1) then
  b.x -= 1
 end
 
 if btn(⬇️,1) then
  b.y += 1
 end
 
 if btn(⬆️,1) then
  b.y -= 1
 end
end

function _draw()
 cls()
  
 -- draw a
 rectfill(a.x,a.y,a.x+a.w,a.y+a.h,5)
 
 -- draw b
 rectfill(b.x,b.y,b.x+b.w,b.y+b.h,3)

 print(a.x .. " " .. a.y,0,0,5)
 print(a.x+a.w .. " " .. a.y+a.h,0,10,5)
 print("collision: " .. (is_collision and 'yas' or 'no'), 0, 20, 4)
end
