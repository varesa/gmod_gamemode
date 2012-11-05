CooldownStart = {}
CooldownEnd = {}

function OnPlayerUse( ply, ent )
	if CooldownStart[ply] == nil then
		CooldownStart[ply] = 0
	end
	
	if CooldownEnd[ply] == nil then
		CooldownEnd[ply] = 0
	end
	
	if ent:GetName() == "btnStart" then
		if RealTime() > CooldownStart[ply] + 1 then
			ply:SetNWInt( "StopwatchBegin", RealTime() )
			ply:SetNWInt( "StopwatchEnd", -1 )
			CooldownStart[ply] = RealTime()
		end
	elseif ent:GetName() == "btnStop" then
		if RealTime() > CooldownEnd[ply] + 1 and  ply:GetNWInt( "StopwatchEnd", -1) == -1 then
			ply:SetNWInt( "StopwatchEnd", RealTime() )
		end
	end
end

print("Initialising serverside OnPlayerUse hook")
hook.Add( "PlayerUse", "OnPlayerUse", OnPlayerUse )