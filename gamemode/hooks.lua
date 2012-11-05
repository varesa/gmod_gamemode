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

function GM:ShouldCollide( ent1, ent2 )
	if ( ent1:IsPlayer() and ent2:GetName() == "btnStart" ) then
		if ent1:GetNWInt( "StopwatchBegin", -1) != -1 then
			return false
		end
	elseif ( ent2:IsPlayer() and ent1:GetName() == "btnStart" ) then
		if ent2:GetNWInt( "StopwatchBegin", -1) != -1 then
			return false
		end
	end
	return true
end