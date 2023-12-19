local Abilities = CYBERNETIC_AUGMENTATIONS.Abilities

Abilities["cloak"] = {
	OnActivate = function(ply)
		ply:SetMaterial("sprites/heatwave")
		ply:DrawShadow(false)
		
		for k, v in next,ply:GetChildren() do 
			v:SetMaterial("sprites/heatwave")
			v:DrawShadow(false)
		end 
	end,
	OnDeactivate = function(ply)
		ply:SetMaterial()
		ply:DrawShadow(true)
		
		for k, v in next,ply:GetChildren() do 
			v:SetMaterial()
			v:DrawShadow(true)
		end
	end,
	ActivateSound = "geralts_augmentations/cloakon.mp3",
	DeactivateSound = "geralts_augmentations/cloakoff.mp3",
	EnergyDrain = 2 -- in sec
}