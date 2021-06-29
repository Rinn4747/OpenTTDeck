--using Kitanoi snippet from discord
--Rinn#4747

openttdeck= { }
openttdeck.running = false
openttdeck.lastticks = 0
openttdeck.GUI = {}
openttdeck.GUI.open = true
openttdeck.GUI.visible = true
openttdeck.GUI.hue = 125

function openttdeck.ModuleInit()
	openttdeck.CheckMenu()
end

function openttdeck.ToggleRun()
    openttdeck.running = not openttdeck.running
end

function openttdeck.CheckMenu()
    local Status = false
    local Menu = ml_gui.ui_mgr.menu.components
    if table.valid(Menu) then
        for i,e in pairs(Menu) do
            if (e.members ~= nil) then
                for k,v in pairs(e.members) do
                    if (v.name ~= nil and v.name == "openttdeck") then
                        Status = true
                    end
                end
            end
        end
    end
    if (not Status) then
        ml_gui.ui_mgr:AddMember({ id = "FFXIVMINION##openttdeck", name = "openttdeck", texture = menuiconpath, test = "openttdeck"},"FFXIVMINION##MENU_HEADER")
        ml_gui.ui_mgr:AddSubMember({ id = "FFXIVMINION##openttdeck", name = "openttdeck", onClick = function() openttdeck.GUI.open = not openttdeck.GUI.open end, tooltip = "openttdeck", texture = iconpath},"FFXIVMINION##MENU_HEADER","FFXIVMINION##openttdeck")
    elseif (Status) then
        ml_gui.ui_mgr:AddSubMember({ id = "FFXIVMINION##openttdeck", name = "openttdeck", onClick = function() openttdeck.GUI.open = not openttdeck.GUI.open end, tooltip = "openttdeck", texture = iconpath},"FFXIVMINION##MENU_HEADER","FFXIVMINION##openttdeck")
    end
end

function openttdeck.Draw( event, ticks )
    local gamestate = GetGameState()
    if ( gamestate == FFXIV.GAMESTATE.INGAME ) then
        if ( openttdeck.GUI.open ) then
			GUI:SetNextWindowSize(285,75,GUI.SetCond_FirstUseEver) 			
            openttdeck.GUI.visible, openttdeck.GUI.open = GUI:Begin("openttdeck", openttdeck.GUI.open)
            if ( openttdeck.GUI.visible ) then
                openttdeck.Enable,changed = GUI:Checkbox("Enable##Enable", openttdeck.Enable)
				local toggleTTdeck = GUI:Button("Toggle")
                if GUI:IsItemClicked(ToggleTTdeck) then 
					openttdeck.ToggleRun()
					d(toggleTTdeck)
                end
				GUI:SameLine()
				GUI:InputText([[##State]], tostring(openttdeck.running), (GUI.InputTextFlags_ReadOnly))				
            end
            GUI:End()
        end
    end
end


function openttdeck.OnUpdateHandler( Event, ticks )
	if openttdeck.running then
		local bagone = Inventory:Get(0)
		local bagtwo = Inventory:Get(1)
		local bagthree = Inventory:Get(2)
		local bagfour = Inventory:Get(3)
		if (table.valid(bagone)) then
			local ilist = bagone:GetList()
			if (table.valid(ilist)) then
				for slot,item in pairs(ilist) do
					if item.id == 10128 and item:IsReady() then
						item:Cast()
					end
					if item.id == 10129 and item:IsReady() then
						item:Cast()
					end
					if item.id == 10130 and item:IsReady() then
						item:Cast()
					end
					if item.id == 13380 and item:IsReady() then
						item:Cast()
					end
					if item.id == 10077 and item:IsReady() then
						item:Cast()
					end
					if item.id == 28652 and item:IsReady() then
						item:Cast()
					end
					if item.id == 17702 and item:IsReady() then
						item:Cast()
					end					
				end
			end
		end
		if (table.valid(bagtwo)) then
			local ilist = bagtwo:GetList()
			if (table.valid(ilist)) then
				for slot,item in pairs(ilist) do
					if item.id == 10128 and item:IsReady() then
						item:Cast()
					end
					if item.id == 10129 and item:IsReady() then
						item:Cast()
					end
					if item.id == 10130 and item:IsReady() then
						item:Cast()
					end
					if item.id == 13380 and item:IsReady() then
						item:Cast()
					end
					if item.id == 10077 and item:IsReady() then
						item:Cast()
					end
					if item.id == 28652 and item:IsReady() then
						item:Cast()
					end
					if item.id == 17702 and item:IsReady() then
						item:Cast()
					end						
				end
			end
		end
		if (table.valid(bagthree)) then
			local ilist = bagthree:GetList()
			if (table.valid(ilist)) then
				for slot,item in pairs(ilist) do
					if item.id == 10128 and item:IsReady() then
						item:Cast()
					end
					if item.id == 10129 and item:IsReady() then
						item:Cast()
					end
					if item.id == 10130 and item:IsReady() then
						item:Cast()
					end
					if item.id == 13380 and item:IsReady() then
						item:Cast()
					end
					if item.id == 10077 and item:IsReady() then
						item:Cast()
					end
					if item.id == 28652 and item:IsReady() then
						item:Cast()
					end
					if item.id == 17702 and item:IsReady() then
						item:Cast()
					end						
				end
			end
		end
		if (table.valid(bagfour)) then
			local ilist = bagfour:GetList()
			if (table.valid(ilist)) then
				for slot,item in pairs(ilist) do
					if item.id == 10128 and item:IsReady() then
						item:Cast()
					end
					if item.id == 10129 and item:IsReady() then
						item:Cast()
					end
					if item.id == 10130 and item:IsReady() then
						item:Cast()
					end
					if item.id == 13380 and item:IsReady() then
						item:Cast()
					end
					if item.id == 10077 and item:IsReady() then
						item:Cast()
					end
					if item.id == 28652 and item:IsReady() then
						item:Cast()
					end
					if item.id == 17702 and item:IsReady() then
						item:Cast()
					end						
				end
			end
		end
	end	
end

RegisterEventHandler("Gameloop.Update",openttdeck.OnUpdateHandler)
RegisterEventHandler("openttdeck.TOGGLE", openttdeck.ToggleRun) 
RegisterEventHandler("Module.Initalize",openttdeck.ModuleInit) 
RegisterEventHandler("Gameloop.Draw", openttdeck.Draw, "openttdeck Draw")
