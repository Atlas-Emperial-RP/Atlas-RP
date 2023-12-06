util.AddNetworkString("MedicMod.MedicMenu")
util.AddNetworkString("MedicMod.MedicStart")
util.AddNetworkString("MedicMod.BuyMedicEntity")
-- util.AddNetworkString("MedicMod.NotifiyPlayer")
util.AddNetworkString("MedicMod.PlayerStartAnimation")
util.AddNetworkString("MedicMod.ScanRadio")
util.AddNetworkString("MedicMod.Respawn")
util.AddNetworkString("MedicMod.TerminalMenu")
util.AddNetworkString("MedicMod.PlayerStopAnimation")
util.AddNetworkString("MedicMod.OpenMedicMenu")
util.AddNetworkString("MedicMod.BuyMedicJobEntity")
 
local spamCooldowns = {}
local interval = .1

local function spamCheck(pl, name)
    if spamCooldowns[pl:SteamID()] then
        if spamCooldowns[pl:SteamID()][name] then
            if spamCooldowns[pl:SteamID()][name] > CurTime() then
                return false
            else
                spamCooldowns[pl:SteamID()][name] = CurTime() + interval
                return true
            end
        else
            spamCooldowns[pl:SteamID()][name] = CurTime() + interval
            return true
        end
    else
        spamCooldowns[pl:SteamID()] = {}
        spamCooldowns[pl:SteamID()][name] = CurTime() + interval

        return true
    end
end

 
net.Receive("MedicMod.MedicStart", function( len, caller )
	
	if not spamCheck( caller, "MedicMod.MedicStart" ) then return end
	
    local ent = net.ReadEntity()
    local health = caller:Health()
   
    if caller:GetPos():DistToSqr(ent:GetPos()) > 22500 then return end
    if health <= 0 then return end
    if health >= caller:GetMaxHealth() and not caller:HaveFractures() then return end
	
	local price = 0
	
	if health < caller:GetMaxHealth() then
		price = ( caller:GetMaxHealth() - health ) * ConfigurationMedicMod.HealthUnitPrice
	end	
	
    if caller:HaveFractures() then
        price = price + table.Count(caller.Fractures) * ConfigurationMedicMod.FractureRepairPrice
    end
   
    local bed = nil
    local dist = -1
	for k, v in pairs( ents.FindByClass("bed_medicmod") ) do
        if not IsValid( v.ragdoll ) then
		
			local ndist = v:GetPos():Distance( caller:GetPos() )

			if dist == -1 or dist > ndist then
				bed = v
				dist = ndist
			end

		end
		
	end
   
    if not bed or not IsValid( bed ) then caller:MedicNotif(ConfigurationMedicMod.Sentences["You can't be healed because there is no free bed, retry later"][ConfigurationMedicMod.Language]) return end
   
    if caller:getDarkRPVar("money") < price then caller:MedicNotif(ConfigurationMedicMod.Sentences["You don't have enough money"][ConfigurationMedicMod.Language]) return end
   
    caller:addMoney( -price )
   
    caller:StartOperation( bed )
   
end)
 
net.Receive("MedicMod.Respawn",function(len,ply)
	
	if not spamCheck( ply, "MedicMod.Respawn" ) then return end

    if ply.NextSpawnTime > CurTime() or ply:Alive() or ply.NextSpawnTime == -1 then return end
    ply:Spawn()
end)
 
net.Receive("MedicMod.BuyMedicEntity", function( len, caller )
   
	if not spamCheck( caller, "MedicMod.BuyMedicEntity" ) then return end
   
    local key = net.ReadInt( 32 )
    local ent = net.ReadEntity()
   
    local cfg = ConfigurationMedicMod.Entities[key]
 
    if not IsValid( ent ) then return end
    if caller:GetPos():Distance(ent:GetPos()) > 200 then return end
    if caller:getDarkRPVar("money") < cfg.price then caller:MedicNotif(ConfigurationMedicMod.Sentences["You don't have enough money"][ConfigurationMedicMod.Language]) return end
   
    cfg.func( caller, cfg.ent, cfg.price  )
   
end)

net.Receive("MedicMod.BuyMedicJobEntity", function( len, caller )
	
	if not spamCheck( caller, "MedicMod.BuyMedicJobEntity" ) then return end
	
    local key = net.ReadString()
    local class = net.ReadString()
	
	local spawnedtesttubes = caller.TestTubesSpawned or 0
	local spawneddrugs = caller.DrugsSpawned or 0
	local spawnedEnts = caller.spawnedEntsMedicMod or {}
	
	local ent
   if not table.HasValue( ConfigurationMedicMod.MedicTeams, caller:Team() ) then return end
   
	if class == "test_tube_medicmod_s" and spawnedtesttubes < ConfigurationMedicMod.MaxTestTubesSpawnedWithTheShop then

		if not ConfigurationMedicMod.Reagents[key] then return end
		
		local price = ConfigurationMedicMod.Reagents[key].price
		
		if caller:getDarkRPVar("money") < price then caller:MedicNotif(ConfigurationMedicMod.Sentences["You don't have enough money"][ConfigurationMedicMod.Language]) return end
		
		caller:addMoney( -price )
	
		ent = ents.Create("test_tube_medicmod")
		ent:SetPos(caller:GetPos() + caller:GetAngles():Forward() * 30 + caller:GetAngles():Up() * 20 )
		ent:SetProduct(key)
		ent:Spawn()	
		
		if CPPI then
			ent:CPPISetOwner(caller)
		end
		
		undo.Create( ConfigurationMedicMod.Sentences["Test tube"][ConfigurationMedicMod.Language] )
			undo.AddEntity( ent )
			undo.SetPlayer( caller )
		undo.Finish()
		
		ent.TestTubeSpawner = caller
		caller.TestTubesSpawned = spawnedtesttubes + 1 or 1
		
	elseif class == "test_tube_medicmod_s" and spawnedtesttubes >= ConfigurationMedicMod.MaxTestTubesSpawnedWithTheShop then
		caller:MedicNotif(ConfigurationMedicMod.Sentences["You've reached the limit of"][ConfigurationMedicMod.Language].." "..ConfigurationMedicMod.Sentences["Test tube"][ConfigurationMedicMod.Language])
	elseif class == "drug_medicmod_s" and spawneddrugs < ConfigurationMedicMod.MaxDrugsSpawnedWithTheShop then
			
		if not ConfigurationMedicMod.Drugs[key] then return end
		
		local price = ConfigurationMedicMod.Drugs[key].price
		
		if caller:getDarkRPVar("money") < price then caller:MedicNotif(ConfigurationMedicMod.Sentences["You don't have enough money"][ConfigurationMedicMod.Language]) return end
		
		caller:addMoney( -price )
		
		ent = ents.Create("drug_medicmod")
		ent:SetPos(caller:GetPos() + caller:GetAngles():Forward() * 30 + caller:GetAngles():Up() * 20)
		ent:Spawn()	
		ent:SetDrug(key)
		
		if CPPI then
			ent:CPPISetOwner(caller)
		end
		
		undo.Create( ConfigurationMedicMod.Sentences["Drugs"][ConfigurationMedicMod.Language] )
			undo.AddEntity( ent )
			undo.SetPlayer( caller )
		undo.Finish()
		
		ent.DrugSpawner = caller
		caller.DrugsSpawned = spawneddrugs + 1 or 1
		
	elseif class == "drug_medicmod_s" and spawneddrugs >= ConfigurationMedicMod.MaxDrugsSpawnedWithTheShop then
		caller:MedicNotif(ConfigurationMedicMod.Sentences["You've reached the limit of"][ConfigurationMedicMod.Language].." "..ConfigurationMedicMod.Sentences["Drugs"][ConfigurationMedicMod.Language])
	elseif key == "entity" and ConfigurationMedicMod.MedicShopEntities[class] and (spawnedEnts[class] or 0) < ConfigurationMedicMod.MedicShopEntities[class].max then
	    
		local cfg = ConfigurationMedicMod.MedicShopEntities[class]
 
		if caller:getDarkRPVar("money") < cfg.price then caller:MedicNotif(ConfigurationMedicMod.Sentences["You don't have enough money"][ConfigurationMedicMod.Language]) return end
		caller:addMoney( -cfg.price )
		
		ent = ents.Create(class)
		ent:SetPos(caller:GetPos() + caller:GetAngles():Forward() * 30 + caller:GetAngles():Up() * 20 )
		ent:Spawn()
		
		if CPPI then
			ent:CPPISetOwner(caller)
		end
		
		undo.Create( (cfg.name or "Medic mod entity") )
			undo.AddEntity( ent )
			undo.SetPlayer( caller )
		undo.Finish()
		
		caller.spawnedEntsMedicMod = caller.spawnedEntsMedicMod or {}
		caller.spawnedEntsMedicMod[class] = caller.spawnedEntsMedicMod[class] or 0
		caller.spawnedEntsMedicMod[class] = caller.spawnedEntsMedicMod[class] + 1
		
	elseif key == "entity" and ConfigurationMedicMod.MedicShopEntities[class] and (spawnedEnts[class] or 0) >= ConfigurationMedicMod.MedicShopEntities[class].max then
		caller:MedicNotif(ConfigurationMedicMod.Sentences["You've reached the limit of"][ConfigurationMedicMod.Language].." "..ConfigurationMedicMod.MedicShopEntities[class].name)
	elseif key == "weapon" and ConfigurationMedicMod.MedicShopWeapons[class] then
		if caller:HasWeapon( class ) then caller:MedicNotif(ConfigurationMedicMod.Sentences["You already carry this element on you"][ConfigurationMedicMod.Language]) return end
		
		local cfg = ConfigurationMedicMod.MedicShopWeapons[class]
 
		if caller:getDarkRPVar("money") < cfg.price then caller:MedicNotif(ConfigurationMedicMod.Sentences["You don't have enough money"][ConfigurationMedicMod.Language]) return end
		caller:addMoney( -cfg.price )
		
		caller:Give(class)
	end

	if IsValid( ent ) then
		local oldOnRemove = ent.OnRemove

		function ent:OnRemove()
			if oldOnRemove and isfunction( oldOnRemove ) then oldOnRemove( self ) end
			
			if IsValid( caller ) and isstring( class ) then
				caller.spawnedEntsMedicMod = caller.spawnedEntsMedicMod or {}
				caller.spawnedEntsMedicMod[ class ] = caller.spawnedEntsMedicMod[ class ] or 1
				caller.spawnedEntsMedicMod[class] = caller.spawnedEntsMedicMod[class] - 1
			end
		end
	end
end)