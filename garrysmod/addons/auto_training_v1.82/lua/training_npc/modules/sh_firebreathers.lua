local OBJ = RDV.TRAINING.Add()

OBJ:SetName("Fire Breathers Exam")

OBJ:SetImage("qqKry2g")

OBJ:SetTeam(TEAM_GANG)

OBJ:SetPass(70) -- 60% / 100 or above

-- OBJ:SetLevel(20) -- Set Level Requirement (Nicolas's Level System)

OBJ:SetDelay(360) -- 360 Seconds between delay.

OBJ:AddQuestion("The tunnel you're traversing has begun filling up with a strange gas and you're without your breathing apparatus. What do you do?", {
    {
        Answer = "Light a match to find the source of the leak.",
    },
    {
        Answer = "Get above the gas and wait until it dissipates.",
    },
    {
        Answer = "Evacuate as quickly as possible.",
        Correct = true,
    },
})

OBJ:AddQuestion("While traversing a smoke-filled building, your breathing apparatus has failed. Which of the following will serve as the best replacement?", {
    {
        Answer = "A magazine or newspaper",
    },
    {
        Answer = "A water-soaked rag",
        Correct = true,
    },
    {
        Answer = "Cover your face in plastic wrap",
    },
})

OBJ:AddQuestion("One of your fellow Fire Breathers has been burned. The area is painful to the touch, but no blisters are forming. You've applied a cool compress. What's the next thing you should do?", {
    {
        Answer = "Gently bind the burn with clean bandages",
        Correct = true,
    },
    {
        Answer = "Coat the burn in dirt",
    },
    {
        Answer = "Tie a tourniquet above the wound",
    },
})

OBJ:AddQuestion("While exploring a collapsed mine, your team leader flashes their safety light quickly three times. What does this mean?", {
    {
        Answer = "Halt in place",
    },
    {
        Answer = "Retreat immediately",
        Correct = true,
    },
    {
        Answer = "Advance further into the mine",
    },
})

OBJ:AddQuestion("One of your squadmates has caught a case of Sludge Lung. Which of the following sets of ingredients when cooked together, can be used as a cure?", {
    {
        Answer = "1 pt. Dirty Water, 2 Fire Caps, 2 Snaptails, 1 Cram",
    },
    {
        Answer = "1 Scotch, 1 Cigar, 2 Steaks",
    },
    {
        Answer = "1pt. Purified Water, 2 Ash Rose, 2 Blight, 2 Soot Flower",
        Correct = true,
    },
})

OBJ:AddQuestion("You've stumbled upon a band of Scorch-diseased people brandishing clubs. Which of the following is the ONLY acceptable method of engaging them?", {
    {
        Answer = "Charge in and disable them with police batons",
    },
    {
        Answer = "Fall back and engage from a distance with firearms",
        Correct = true,
    },
    {
        Answer = "Sneak up and silently slit their throats",
    },
})

OBJ:AddQuestion("You've captured a Scorched-infected man who you recognize as a childhood friend. What do you do?", {
    {
        Answer = "Convince your friend to join the Responders",
    },
    {
        Answer = "Bring him back to the station for questioning",
    },
    {
        Answer = "End his life as mercifully as possible",
        Correct = true,
    },
})

OBJ:CustomCheck(function(ply)
end )

-- OBJ:Register()