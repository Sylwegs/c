--[[
    autor zasobu: Sylwegs
    wykonano dla: Reven
]]--

local blips = {
    {x, y, z},
}

for i,v in ipairs(blips) do 
     local blip = createBlip(v[1], v[2], v[3], 55, 1, 255, 255, 255, 255, 1, 1000)
end

local signpainter = dxCreateFont('Signpainter.ttf', 24/zoom)
local bold = dxCreateFont('Roboto-Bold.ttf', 14/zoom)

name = getVehicleName()

function gui()
    dxDrawImage(398/zoom, 124/zoom, 1171/zoom, 684/zoom, "window.png", 0, 0, 0, tocolor(255, 255, 255, 253), false)
    dxDrawText(name, 711/zoom, 200/zoom, 1194/zoom, 196/zoom, tocolor(255, 255, 255, 255), 1.00, signpainter, "center", "center", false, false, false, false, false)
 end)
   
   function mouse ( x, y, width, height )
	if ( not isCursorShowing( ) ) then
		return false
	end
    local sx, sy = guiGetScreenSize ( )
    local cx, cy = getCursorPosition ( )
    local cx, cy = ( cx * sx ), ( cy * sy )
    if ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) then
        return true
    else
        return false
    end
end


function click(b, s)
    local job = getElementData(localPlayer, 'player:job')
    if b == 'left' and s == 'down' then 
        if mouse(1463/zoom, 679/zoom, 55/zoom, 52/zoom) and not job and not jail then 
            triggerServerEvent('buy:car', localPlayer)
        elseif mouse(1310/zoom, 679/zoom, 55/zoom, 52/zoom) then 
            removeEventHandler('onClientRender', root, gui)
            removeEventHandler('onClientClick', root, click)
        end
    end
end

