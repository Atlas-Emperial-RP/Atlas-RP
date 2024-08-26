-- add/change rank names here in the same format
local ranks = {
	["moderators"] = true,
	["vip"] = true,
	["owner"] = true,
	["admins"] = true,
	["superadmin"] = true,
	["vipadmin"] = true,
}

hook.Add("PrePACConfigApply", "PACRankRestrict", function(ply)
	if not ranks[ply:GetUserGroup()] then
              return false,"Insufficient rank to use PAC."
        end
end)

hook.Add("PrePACEditorOpen", "PACRankRestrict", function(ply)
	if not ranks[ply:GetUserGroup()] then
              return false,"Insufficient rank to use PAC."
        end
end)