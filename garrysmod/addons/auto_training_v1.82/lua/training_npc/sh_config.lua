--[[---------------------------------]]--
--	Model(s)
--[[---------------------------------]]--
-- Playermodels

RDV.TRAINING.CFG.Models = {
    "models/krieg/galacticempire/stormtroopers/trooper/playermodel_male_01.mdl",
}

--[[---------------------------------]]--
--	Stance(s)
--[[---------------------------------]]--

RDV.TRAINING.CFG.Stances = {	
    "idle_all_01",
    "idle_all_02"
}

--[[---------------------------------]]--
--	Customization
--[[---------------------------------]]--
-- Should we auto-customize Bodygroups and Skins?

RDV.TRAINING.CFG.Randomize = false

--[[---------------------------------]]--
--	Prefix
--[[---------------------------------]]--

RDV.TRAINING.CFG.Prefix = {
    Color = Color(255,0,0),
    Appension = "Training",
}

RDV.TRAINING.CFG.Overhead = {
    Accent = Color(30,150,220),
}

--[[---------------------------------]]--
--	Staff Priveleges
--[[---------------------------------]]--

RDV.TRAINING.CFG.Cami = {
    Enabled = true,
    Name = "[RDV] Training",
}

RDV.TRAINING.CFG.Groups = {
    ["Founder"] = true,
    ["Developer"] = true,
}

--[[---------------------------------]]--
--	Command(s)
--[[---------------------------------]]--

RDV.TRAINING.CFG.Commands = {
    CORE = "!trnpc",
}