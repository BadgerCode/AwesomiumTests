function HTMLTESTS_Render()
	local frame = vgui.Create("DFrame")
	frame:SetSize(750, 500)
	frame:SetTitle("")
	frame:ShowCloseButton(true)
	frame:SetDraggable(false)
	frame:SetSizable(false)
	

	local html = vgui.Create("DHTML" , frame)
	html:Dock(FILL)
	html:SetHTML(HTMLTESTS_HTML)
	html:SetAllowLua(true)
	frame:MakePopup()
	frame:MoveToBack()
end

net.Receive("HTMLTEST_OPENUI", function()
	HTMLTESTS_Render()
end)
