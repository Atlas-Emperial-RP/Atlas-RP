local OBJ = RDV.TRAINING.Add()

OBJ:SetName(" Imperial Cadet Quiz") -- Name of the quiz.

OBJ:SetImage("") -- Cover photo. (Optional)

OBJ:SetTeam({TEAM_IMPERIALARMYENL,}) -- Team to set the player to (or whitelist if you have BWhitelist installed.)

OBJ:SetPass(100) -- 100% / 100

OBJ:SetOpenWithF4(true) -- Should attempting to become the job in the F4 menu automatically open the quiz? (No Need for the NPC.)

-- OBJ:SetLevel(20) -- Set Level Requirement (Nicolas's Level System) (Optional)

OBJ:SetDelay(360) -- 360 Seconds between delay. (Optional)

-- Supported Rank Addons: Nicolas's Rank System, Mac's Rank System
-- OBJ:SetRankRequirement({ -- Branch Name, Rank #
--     ["Test"] = 2, -- Rank #, anything at or above this rank number will have access to this quiz.
-- })

OBJ:AddQuestion("When doing a Left Face how many degrees do you turn", {
    {
        Answer = "180",
        Correct = false,
    },
       {
        Answer = "90",
        Correct = true,
    },
}, "models/starwars/grady/engineer/clone_engineer_ph2_torso.mdl", "judge_r_right_t1")

OBJ:AddQuestion("When doing a Single Column what do you do?", {
    {
        Answer = "Line up behind your commanding officer in a straight line",
        Correct = true,
    },
    {
        Answer = "Split into 2 lines behind your commanding officer",
        Correct = false,
    },
 }, "Yy70CEQ")

OBJ:AddQuestion("What Rank is right after CPL?", {
    {
        Answer = "SGT",
        Correct = true,
    },
    {
        Answer = "1LT",
        Correct = false,
    },
 }, "Yy70CEQ")


OBJ:CustomCheck(function(ply)
end )

OBJ:OnPass(function(ply)
end )

OBJ:Register()