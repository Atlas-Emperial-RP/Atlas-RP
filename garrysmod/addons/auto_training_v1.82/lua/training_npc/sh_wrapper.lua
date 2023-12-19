local oTests = {}

local TRAINING_META = {
    SetImage = function(self, img)
        self.Img = img
    end,
    CustomCheck = function(self, func) 
        self.CustomCheck = func
    end,
    SetOpenWithF4 = function(self, bool)
        self.OpenWithF4 = bool
    end,
    OnPass = function(self, func)
        self.OnPass = func
    end,
    SetDelay = function(self, delay)
        self.DELAY = delay
    end,
    SetLevel = function(self, lvl)
        self.LEVEL = lvl
    end,
    SetName = function(self, nm)
        self.NAME = nm
    end,
    SetTeam = function(self, tm)
        if !tm then print("Invalid Team Selected.") return end

        self.TEAM = tm
    end,
    SetRankRequirement = function(self, t)
        self.T_RANKS = t
    end,
    SetPass = function(self, pass)
        self.PASS = pass
    end,
    AddQuestion = function(self, question, options, model, anim)
        local DATA = {
            NM = question,
            OP = options,
        }

        if model and model ~= "" then
            if string.find(model, ".mdl") then
                DATA.MD = model

                if anim then
                    DATA.AN = anim
                end
            else
                DATA.IMG = model
            end
        end

        table.insert(self.SQUESTIONS, DATA)
    end,
    Register = function(self, bl)
        if bl == false then return end

        if !self.NAME or !self.TEAM then
            return
        end
        
        for a, b in ipairs(self.SQUESTIONS) do
            local CORRECT = 0
            local MULTIPLE = false

            for k, v in ipairs(self.SQUESTIONS[a].OP) do
                if v.Correct then
                    if CLIENT then
                        v.Correct = false
                    end

                    CORRECT = CORRECT + 1

                    self.CORRECT = self.CORRECT + 1
                end

                if CORRECT > 1 then
                    b.MULT = true
                end
            end
        end

        local KEY = table.insert(RDV.TRAINING.TESTS, {
            NAME = self.NAME,
            TEAM = self.TEAM,
            PASS = self.PASS, 
            QUESTIONS = self.SQUESTIONS,
            CORRECT = (SERVER and self.CORRECT) or 0,
            DELAY = self.DELAY,
            LEVEL = self.LEVEL,
            IMAGE = self.Img,
            T_RANKS = self.T_RANKS,
            CustomCheck = self.CustomCheck,
            OnPass = self.OnPass,
            OpenWithF4 = self.OpenWithF4,
        })

        RDV.TRAINING.NTESTS[self.NAME] = KEY

        RDV.TRAINING.JOBS[self.TEAM] = KEY
    end,
}

TRAINING_META.__index = TRAINING_META

function RDV.TRAINING.Add()
    local KEY = ( #RDV.TRAINING.TESTS + 1 )

    table.insert(oTests, KEY, {
        CORRECT = 0,
        LEVEL = 0,
        DELAY = 0,
        PASS = 70,
        QUESTIONS = {},
        SQUESTIONS = {},
    })

    setmetatable( oTests[KEY], TRAINING_META ) -- Setting up the metatable.

    return oTests[KEY]
end