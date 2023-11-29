AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/medicmod/medical_stand/medical_stand.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	self:DropToFloor()
	local phys = self:GetPhysicsObject()
	
	if phys:IsValid() then
	
		phys:Wake()
		
	end
		
end

function ENT:AttachBloodBag( bag )

	bag:SetPos( self:GetPos() + self:GetAngles():Up() * 72.2 + self:GetAngles():Right() * 10 + self:GetAngles():Forward() * 2.4 )
	bag:SetAngles( self:GetAngles() + Angle(90,0,90) )
	bag:SetParent( self )

end

function ENT:Touch( ent )
	
	if ent:GetClass() == "bloodbag_medicmod" then
		
		if IsValid(self.BloodBag) then return end
		
		if IsValid(ent.Stand) then return end
		
		self:AttachBloodBag( ent )
		
		ent.Stand = self
		self.BloodBag = ent
		
		return
		
	end

	if ent:GetClass() == "bed_medicmod" then
		if IsValid( self.Bed ) then return end
		if IsValid( ent.Stand ) then return end
		if not IsValid( self.BloodBag ) then return end
		if not IsValid( ent.ragdoll ) or not ent.ragdoll:IsDeathRagdoll() then return end

		ent.Stand = self
		self.Bed = ent
		
		if timer.Exists( "StandBloodTime"..self:EntIndex() ) then
			timer.Destroy( "StandBloodTime"..self:EntIndex() )			
		end
		
		local rag = ent.ragdoll
		local bed = ent
		local ply = ent.ragdoll:GetOwner()
		local bbag = self.BloodBag
		
		timer.Create("StandBloodTime"..self:EntIndex(), 1, 0, function()
			if not IsValid( rag ) or not IsValid( bed ) or not IsValid( ply ) or not IsValid( bbag ) or not IsValid( self ) then
				if IsValid(self) then
					self.Bed = nil
				end
				if IsValid( bed ) then
					bed.Stand = nil
				end
				timer.Destroy("StandBloodTime"..self:EntIndex())
				return
			end
			
			local dist = self:GetPos():Distance( bed:GetPos() )
			local health = ply:Health()
			local tadd = 2
			local bblood = bbag:GetBlood()
			
			if dist > 200 then self.Bed = nil bed.Stand = nil timer.Destroy("StandBloodTime"..self:EntIndex()) return end
			
			if health < 0 then ply:SetHealth( 0 ) health = 0 end
			if health >= ( 100 - tadd ) then
				if health >= 100 then
					if not ply:GetHeartAttack() then
						ply:MedicalRespawn()
						
						timer.Destroy("StandBloodTime"..self:EntIndex())
						self.Bed = nil
						bed.Stand = nil
						
						if bbag:GetBlood() <= 0 then
							
							bbag:Remove()
							
						end
					elseif IsValid( bbag:CPPIGetOwner() ) then
						bbag:CPPIGetOwner().TimeHasBeenNotifiedAboutHeartAttack = bbag:CPPIGetOwner().TimeHasBeenNotifiedAboutHeartAttack or {}
						if ( bbag:CPPIGetOwner().TimeHasBeenNotifiedAboutHeartAttack[ ply:EntIndex() ] or 0 ) + 5 <= CurTime() then
							bbag:CPPIGetOwner():MedicNotif( ply:Name() .. " " .. ConfigurationMedicMod.Sentences["can't be revived because he has a heart attack"][ConfigurationMedicMod.Language], 5 )
							bbag:CPPIGetOwner().TimeHasBeenNotifiedAboutHeartAttack = bbag:CPPIGetOwner().TimeHasBeenNotifiedAboutHeartAttack or {}
							bbag:CPPIGetOwner().TimeHasBeenNotifiedAboutHeartAttack[ ply:EntIndex() ] = CurTime()
						end
					end
					return
					
				elseif bblood >= tadd then
					if not ply:GetHeartAttack() then
						bbag:SetBlood( bblood - health - 100 )
						ply:SetHealth( 100 )
						ply:MedicalRespawn()
						
						timer.Destroy("StandBloodTime"..self:EntIndex())
						self.Bed = nil
						bed.Stand = nil
						
						if bbag:GetBlood() <= 0 then
						
							bbag:Remove()
						
						end
					elseif IsValid( bbag:CPPIGetOwner() ) then
						bbag:CPPIGetOwner().TimeHasBeenNotifiedAboutHeartAttack = bbag:CPPIGetOwner().TimeHasBeenNotifiedAboutHeartAttack or {}
						if ( bbag:CPPIGetOwner().TimeHasBeenNotifiedAboutHeartAttack[ ply:EntIndex() ] or 0 ) + 5 <= CurTime() then
							bbag:CPPIGetOwner():MedicNotif( ply:Name() .. " " .. ConfigurationMedicMod.Sentences["can't be revived because he has a heart attack"][ConfigurationMedicMod.Language], 5 )
							bbag:CPPIGetOwner().TimeHasBeenNotifiedAboutHeartAttack = bbag:CPPIGetOwner().TimeHasBeenNotifiedAboutHeartAttack or {}
							bbag:CPPIGetOwner().TimeHasBeenNotifiedAboutHeartAttack[ ply:EntIndex() ] = CurTime()
						end
					end
					
					return
					
				else
					ply:SetHealth( health + tadd )
					bbag:Remove()
					
					timer.Destroy("StandBloodTime"..self:EntIndex())
					self.Bed = nil
					bed.Stand = nil
					
					return
					
				end
			end
			if bblood - tadd <= 0 then
				if bblood - tadd == 0 then
					ply:SetHealth( health + tadd )
					bbag:Remove()
					timer.Destroy("StandBloodTime"..self:EntIndex())
					self.Bed = nil
					bed.Stand = nil
					return
				else
					bbag:Remove()
					timer.Destroy("StandBloodTime"..self:EntIndex())
					self.Bed = nil
					bed.Stand = nil
					return
				end
			end
			ply:SetHealth( health + tadd )
			bbag:SetBlood( bblood - tadd )
		end)
	
	end
	
end

function ENT:OnRemove()

	if IsValid( self.Bed ) then
		self.Bed.Stand = nil
	end
	if IsValid( self.BloodBag ) then
		self.BloodBag.Stand = nil
	end

end