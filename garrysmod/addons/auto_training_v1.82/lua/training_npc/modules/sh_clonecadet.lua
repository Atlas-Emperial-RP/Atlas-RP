local OBJ = RDV.TRAINING.Add()

OBJ:SetName("Clone Cadet Quiz") -- Name of the quiz.

OBJ:SetImage("Yy70CEQ") -- Cover photo. (Optional)

OBJ:SetTeam({TEAM_GUN, TEAM_MEDIC}) -- Team to set the player to (or whitelist if you have BWhitelist installed.)

OBJ:SetPass(70) -- 60% / 100 or above

OBJ:SetOpenWithF4(true) -- Should attempting to become the job in the F4 menu automatically open the quiz? (No Need for the NPC.)

-- OBJ:SetLevel(20) -- Set Level Requirement (Nicolas's Level System) (Optional)

OBJ:SetDelay(360) -- 360 Seconds between delay. (Optional)

-- Supported Rank Addons: Nicolas's Rank System, Mac's Rank System
-- OBJ:SetRankRequirement({ -- Branch Name, Rank #
--     ["Test"] = 2, -- Rank #, anything at or above this rank number will have access to this quiz.
-- })

OBJ:AddQuestion("Which stance is this force user utilizing?", {
    {
        Answer = "Form III",
        Correct = false,
    },
    {
        Answer = "Form I",
        Correct = false,
    },
    {
        Answer = "Form IV",
        Correct = true,
    },
}, "models/starwars/grady/engineer/clone_engineer_ph2_torso.mdl", "judge_r_right_t1")

OBJ:AddQuestion("Which member of Domino Squad was known as a 'joker?'", {
    {
        Answer = "Cutup",
        Correct = true,
    },
    {
        Answer = "Droidbait",
        Correct = false,
    },
    {
        Answer = "Hevy",
        Correct = false,
    },
}, "Yy70CEQ")


OBJ:CustomCheck(function(ply)
end )

OBJ:OnPass(function(ply)
end )

OBJ:Register()