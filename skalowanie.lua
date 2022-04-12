local sx, sy = guiGetScreenSize()
zmienna = 1920/sx

function zlaomasz()
	dxDrawText("Wymiary twojej roździelczości są bliższe kwadratowi niż prostokątowi.\nZalecana roździelczość: 1920 x 1080, 1600x900, 1280x720\nNa twojej roździelczości niektóre elementy gui mogą nie działać poprawnie!\nAby wyłączyć tą wiadomość wpisz /zrozumialem", 11/zmienna, 11/zmienna, 1911/zmienna, 72/zmienna, tocolor(0, 0, 0, 255), 1.2/zmienna, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawText("Wymiary twojej roździelczości są bliższe kwadratowi niż prostokątowi.\nZalecana roździelczość: 1920 x 1080, 1600x900, 1280x720\nNa twojej roździelczości niektóre elementy gui mogą nie działać poprawnie!\nAby wyłączyć tą wiadomość wpisz /zrozumialem", 10/zmienna, 10/zmienna, 1910/zmienna, 71/zmienna, tocolor(255, 0, 0, 255), 1.2/zmienna, "default-bold", "center", "center", false, false, false, false, false)
end

function sprawdzstart() 
	dzielenie = sx/sy 
	if tostring(string.format("%.04s", dzielenie)) ~= "1.77" then 
		addEventHandler ("onClientRender", root, zlaomasz)
	return end
end
sprawdzstart()
addEventHandler ("onPlayerConnect", getRootElement(), sprawdzstart)

function ok()
	if isEventHandlerAdded( 'onClientRender', root, zlaomasz) then
		removeEventHandler ("onClientRender", root, zlaomasz)
	end
end
addCommandHandler("zrozumialem",ok)

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
	if type( sEventName ) == 'string' and isElement( pElementAttachedTo ) and type( func ) == 'function' then
		 local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
		 if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
			  for i, v in ipairs( aAttachedFunctions ) do
				   if v == func then
					return true
			   end
		  end
	 end
	end
	return false
end
