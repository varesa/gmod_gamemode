--Create fonts
surface.CreateFont ("testFont", {
	size = 16,
	weight = 600,
	antialias = true,
	shadow = true,
	font = "DejaVu Sans"})

function PaintHUD()
	ply = LocalPlayer()
	if ply:GetNWInt( "StopwatchEnd", -1 ) > 0  then
		time = ply:GetNWInt( "StopwatchEnd", 0 ) - ply:GetNWInt( "StopwatchBegin", 0 )
	elseif ply:GetNWInt( "StopwatchBegin", -1 ) > 0 then
		time = RealTime() - LocalPlayer():GetNWInt("StopwatchBegin", 0)
	else
		draw.DrawText("Timer not started", "testFont", ScrW() / 2 - 70, ScrH() - 63, Color(255, 255, 255, 255),TEXT_ALIGN_CENTER)
		return
	end
	
	mins = math.floor(time / 60)
	secs = math.floor( time - mins)
	msecs = math.floor((time - math.floor(time))*1000)
	
	
	draw.DrawText("Current time: "..mins..":"..secs..":"..msecs, "testFont", ScrW() / 2 - 70, ScrH() - 63, Color(255, 255, 255, 255),TEXT_ALIGN_CENTER)
	--self.BaseClass:HUDPaint()
end
print("Initialising clientside HUDPaint hook");
hook.Add( "HUDPaint", "PainTheHud", PaintHUD );
 