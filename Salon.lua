--[[
    autor zasobu: Sylwegs
    wykonano dla: Reven
]]--

local blips = {
    {1625.27, -1537.68, 13.64},
    {1711.82, -1778.93, 14.39},
    {1099.84, -1688.40, 13.55},
}

for i,v in ipairs(blips) do 
     local blip = createBlip(v[1], v[2], v[3], 55, 1, 255, 255, 255, 255, 1, 1000)
end

local signpainter = dxCreateFont('Signpainter.ttf', 44/zoom)
local bold = dxCreateFont('Roboto-Bold.ttf', 14/zoom)
local signpainter2 = dxCreateFont('Signpainter.ttf', 20/zoom)
local reg = dxCreateFont('Roboto-Regular.ttf', 17/zoom)



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

local noti = exports['chojnas-noti']

function click(b, s)
    local job = getElementData(localPlayer, 'player:job')
    local jail = getElementData(localPlayer, 'player:jail')

    if b == 'left' and s == 'down' then 
        if mouse(1386/zoom, 679/zoom, 55/zoom, 52/zoom) and not job and not jail then 
            if not getElementData(localPlayer, 'player:premium') then 
                noti:alert('error', 'Ta funkcja dostepna jest tylko dla graczy z kontem premium!')
                return 
            end
            local g,f,d = getElementPosition(localPlayer)
            setElementData(localPlayer, 'salon:pos', {
                x = g, 
                y = f, 
                z = d,
                dim = getElementDimension(localPlayer),
            })
            removeEventHandler('onClientRender', root, gui)
            removeEventHandler('onClientClick', root, click)
            triggerServerEvent('test:car', localPlayer)
        elseif mouse(1463/zoom, 679/zoom, 55/zoom, 52/zoom) and not job and not jail then 
            triggerServerEvent('buy:car', localPlayer)

        elseif mouse(1310/zoom, 679/zoom, 55/zoom, 52/zoom) then 
            removeEventHandler('onClientRender', root, gui)
            removeEventHandler('onClientClick', root, click)
        end
    end
end

