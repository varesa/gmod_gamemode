--Create fonts
surface.CreateFont ("testFont", {
	size = 16,
	weight = 600,
	antialias = true,
	shadow = true,
	font = "DejaVu Sans"})

function PaintHUD()
	--print("Painting")
	time = LocalPlayer().GetNWString("Timer_time", "timer not initialized")
	draw.DrawText("Current time: "..time, "testFont", ScrW() / 2 - 70, ScrH() - 63, Color(255, 255, 255, 255),TEXT_ALIGN_CENTER)
	--self.BaseClass:HUDPaint()
end
print("Initialising clientside HUDPaint hook");
hook.Add( "HUDPaint", "PainTheHud", PaintHUD );
 