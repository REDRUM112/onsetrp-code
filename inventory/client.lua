local Dialog = ImportPackage("dialogui")
local _ = function(k,...) return ImportPackage("i18n").t(GetPackageName(),k,...) end

local personalMenu

AddEvent("OnTranslationReady", function()
    personalMenu = Dialog.create(_("personal_menu"),
        _("bank_balance").." : {bank} ".._("currency").." | ".._("cash").." : {cash} ".._("currency").." | ".._("item_backpack").." : {backpack}",
        _("transfer") ,_("use"), _("cancel"))
    Dialog.addSelect(personalMenu, 1, _("inventory").."  {inventory_slots}", 5)
    Dialog.addTextInput(personalMenu, 1, _("quantity"))
    Dialog.addSelect(personalMenu, 1, _("player"), 3)
end)


AddRemoteEvent("OpenPersonalMenu", function(cash, bank, inventory, playerList, backpack, inventorySlots)
    Dialog.setVariable(personalMenu, "cash", cash)
    Dialog.setVariable(personalMenu, "bank", bank)
    Dialog.setVariable(personalMenu, "backpack", backpack)
    Dialog.setVariable(personalMenu, "inventory_slots", inventorySlots)
    local items = {}
    for k,v in pairs(inventory) do
        if k == "cash" then
            items[k] = v.._("currency")
        elseif k == "item_backpack" then
            items[k] = _(k)
        else
		    items[k] = v.." x ".._(k)
        end
    end
    Dialog.setSelectLabeledOptions(personalMenu, 1, 1, items)
    Dialog.setSelectLabeledOptions(personalMenu, 1, 3, playerList)
    Dialog.show(personalMenu)
    personalMenuIsOpen = 1 -- Affiche le HUD santé faim soif
end)

AddEvent("OnDialogSubmit", function(dialog, button, ...)
	local args = { ... }
    if dialog == personalMenu then
        if button == 1 then
            if args[1] == "" then
                CallEvent('KNotify:Send', _("select_item"), "#f00")
			else
                if args[2] == ""  or math.floor(args[2]) < 1 then
                    CallEvent('KNotify:Send', _("select_amount"), "#f00")
                else
                    if args[3] == "" then
                        CallEvent('KNotify:Send', _("select_player"), "#f00")
                    else
                        CallRemoteEvent("TransferInventory", args[1], math.floor(args[2]), args[3])
                    end   
				end
			end
        end
		if button == 2 then
            if args[1] == "" then
                CallEvent('KNotify:Send', _("select_item"), "#f00")
			else
                if args[2] == ""  or math.floor(args[2]) < 1 then
                    CallEvent('KNotify:Send', _("select_amount"), "#f00")
				else
                    CallRemoteEvent("UseInventory2", args[1], math.floor(args[2]))
			        CallRemoteEvent("UseInventory", args[1], math.floor(args[2]))
				end
			end
        end
        
        personalMenuIsOpen = 0 -- Cache le HUD santé faim soif
    end
end)


AddEvent("OnKeyPress", function( key )
    if key == "F4" and not onCharacterCreation then
        CallRemoteEvent("ServerPersonalMenu")
    end
end)

AddRemoteEvent("LockControlMove", function(move)
    SetIgnoreMoveInput(move)
end)

