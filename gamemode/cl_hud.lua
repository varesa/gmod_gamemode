--Create fonts
surface.CreateFont ("testFont", {
	size = 16,
	weight = 600,
	antialias = true,
	shadow = true,
	font = "DejaVu Sans"})

function PaintHUD()
	print("Painting")
	draw.DrawText("Hello World", "testFont", ScrW() / 2 - 70, ScrH() - 63, Color(255, 255, 255, 255),TEXT_ALIGN_CENTER)
	--self.BaseClass:HUDPaint()
end
print("Initialising hook");
hook.Add( "HUDPaint", "PainTheHud", PaintHUD );
 