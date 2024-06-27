--

local function startTest(test, OFRAME)
    local OBJ = RDV.TRAINING.TESTS[test]

    if !OBJ then return end

    local ANSWERS = {}
    local Q = 1

    local FRAMED = vgui.Create("PIXEL.Frame")
    FRAMED:SetSize(ScrW() * 0.35, ScrH() * 0.5)
    FRAMED:Center()
    FRAMED:MakePopup(true)
    FRAMED:SetMouseInputEnabled(true)
    FRAMED:SetTitle(OBJ.NAME)
    FRAMED.OnRemove = function()
        if IsValid(OFRAME) then
            OFRAME:SetVisible(true)
        end
    end

    local FAKE = vgui.Create("DPanel", FRAMED)
    FAKE:Dock(FILL)
    FAKE.Paint = function() end

    local w,h = FRAMED:GetSize()

    local function GenQuestion(Q)
        FAKE:Clear()

        local CHECKED = {}

        local AN = OBJ.QUESTIONS[Q].AN
        local MD = OBJ.QUESTIONS[Q].MD
        local IM = OBJ.QUESTIONS[Q].IMG

        local label = vgui.Create("DLabel", FAKE)

        if MD or IM then
            label:SetSize(0, h * 0.3)
        else
            label:SetSize(0, h * 0.2)
        end

        label:DockMargin(0, h * 0.01, 0, 0)
        label:Dock(TOP)
        label:SetText("")
        label:SetMouseInputEnabled(true)

        label.Paint = function(self, w, h)
            local COL = PIXEL.OffsetColor(PIXEL.CopyColor(PIXEL.Colors.Header), 5)

            draw.RoundedBox(5, 0, 0, w, h, COL)        
        end

        if MD then
            local ICON = vgui.Create( "DModelPanel", label )
            ICON:SetSize( w * 0.25, 0 )
            ICON:SetModel(MD)
            ICON:Dock(LEFT)

            local mn, mx = ICON.Entity:GetRenderBounds()
            mn = mn * 0.7
            mx = mx * 0.7
        
            local size = 0
        
            size = math.max(size, math.abs(mn.x) + math.abs(mx.x))
            size = math.max(size, math.abs(mn.y) + math.abs(mx.y))
            size = math.max(size, math.abs(mn.z) + math.abs(mx.z))

            local DELAY = 0

            function ICON:LayoutEntity( Entity )
                if !AN then return end

                if DELAY and DELAY < CurTime() then
                    ICON.Entity:SetSequence("idle_all_01")
                    
                    ICON:RunAnimation()

                    local DUR = ICON.Entity:SequenceDuration(AN)
                    ICON.Entity:SetSequence(AN)

                    DELAY = CurTime() + DUR
                end

                ICON:RunAnimation()
            end

            ICON:SetCamPos(Vector(size, size, size))
            ICON:SetLookAt((mn + mx) * 0.55)
            ICON:SetAmbientLight( color_white )
            ICON:SetAnimated(true)
        elseif IM then
            local IMG = vgui.Create("PIXEL.ImgurButton", label)	-- Add image to Frame
            IMG:SetWide(w * 0.25)
            IMG:Dock(LEFT)
            IMG:DockMargin(w * 0.01, h * 0.01, w * 0.01, h * 0.01)
            IMG:SetImgurID(IM)
            IMG.PaintOver = function(self, w, h)
                local imageSize = h * self:GetImageSize()

                surface.SetDrawColor( 255, 255, 255, 125)
                surface.DrawOutlinedRect( 0, 0, imageSize, h)
            end
        end

        local TEXT = vgui.Create("PIXEL.TextEntry", label)
        TEXT:Dock(FILL)
        TEXT:SetValue(OBJ.QUESTIONS[Q].NM)
        TEXT:SetMultiline(true)
        TEXT:SetKeyBoardInputEnabled(false)
        TEXT:DockMargin(w * 0.015, h * 0.015, w * 0.015, h * 0.015)

        local SCROLL = vgui.Create("PIXEL.ScrollPanel", FAKE)
        SCROLL:Dock(FILL)
        SCROLL:SetMouseInputEnabled(true)
        SCROLL.Think = function(self)
            for k, v in ipairs(OBJ.QUESTIONS[Q].OP) do
                local QST = OBJ.QUESTIONS[Q]

                local label = self:Add("DLabel")
                
                if v.Image then
                    label:SetSize(0, h * 0.3)

                    local IMG = vgui.Create("PIXEL.ImgurButton", label)	-- Add image to Frame
                    IMG:SetWide(w * 0.25)
                    IMG:Dock(LEFT)
                    IMG:DockMargin(w * 0.01, h * 0.01, w * 0.01, h * 0.01)
                    IMG:SetImgurID(v.Image)
                    IMG.PaintOver = function(self, w, h)
                        local imageSize = h * self:GetImageSize()

                        surface.SetDrawColor( 255, 255, 255, 125)
                        surface.DrawOutlinedRect( 0, 0, imageSize, h)
                    end
                else
                    label:SetSize(0, h * 0.1)
                end

                label:DockMargin(0, h * 0.01, 0, 0)
                label:Dock(TOP)
                label:SetText("")
                label:SetMouseInputEnabled(true)

                label.Paint = function(self, w, h)
                    local COL = PIXEL.OffsetColor(PIXEL.CopyColor(PIXEL.Colors.Header), 5)

                    draw.RoundedBox(5, 0, 0, w, h, COL)
                end

                local CHECK = vgui.Create("PIXEL.Checkbox", label)
                CHECK:Dock(RIGHT)

                if v.Image then
                    CHECK:SetWide(w * 0.045)
                    CHECK:DockMargin(0, h * 0.125, w * 0.025, h * 0.125)
                else
                    CHECK:DockMargin(w * 0.005, h * 0.03, w * 0.025, h * 0.03)
                end

                CHECK.OnToggled = function(self, tog)
                    if !QST.MULT then
                        for k, v in pairs(CHECKED) do
                            k:SetToggle(false)

                            CHECKED[k] = nil
                        end
                    end

                    CHECKED[CHECK] = k
                end

                local TEXT = vgui.Create("PIXEL.TextEntry", label)
                TEXT:Dock(FILL)
                TEXT:SetValue(v.Answer)
                TEXT:SetMultiline(true)
                TEXT:SetKeyBoardInputEnabled(false)
                TEXT:DockMargin(w * 0.05, h * 0.015, w * 0.05, h * 0.015)
            end

            self.Think = function() end
        end

        local RETURN = vgui.Create("PIXEL.TextButton", FAKE)
        RETURN:Dock(BOTTOM)
        RETURN:SetText(RDV.LIBRARY.GetLang(nil, "TR_submit", {Q, table.Count(OBJ.QUESTIONS)}))
        RETURN:SetMouseInputEnabled(true)
        RETURN.DoClick = function(self)
            ANSWERS[Q] = ANSWERS[Q] or {}

            for k, v in pairs(CHECKED) do
                table.insert(ANSWERS[Q], v)
            end

            local COUNT = table.Count(OBJ.QUESTIONS)

            if Q >= COUNT then
                net.Start("RDV.TRAINING.PROCESS")
                    net.WriteUInt(test, 8)

                    for i = 1, COUNT do
                        local COUNT = table.Count(ANSWERS[i])

                        net.WriteUInt(i, 8)
                        net.WriteUInt(COUNT, 8)

                        for k, v in ipairs(ANSWERS[i]) do
                            net.WriteUInt(v, 8)
                        end
                    end
                net.SendToServer()

                if IsValid(OFRAME) then
                    OFRAME:Remove()
                end

                FRAMED:Remove()
            else
                Q = Q + 1

                GenQuestion(Q)
            end
        end
    end

    GenQuestion(Q)
end

net.Receive("RDV.TRAINING.OpenQuiz", function()
    startTest(net.ReadUInt(8))
end )

local function TrainingMenu()
    local CAN = {}
    local C = net.ReadUInt(8)

    for i = 1, C do
        CAN[net.ReadUInt(8)] = true
    end

    local FRAMED = vgui.Create("PIXEL.Frame")
    FRAMED:SetSize(ScrW() * 0.35, ScrH() * 0.5)
    FRAMED:Center()
    FRAMED:MakePopup(true)
    FRAMED:SetMouseInputEnabled(true)
    FRAMED:SetTitle(RDV.LIBRARY.GetLang(nil, "TR_autoTrainer"))

    local w,h = FRAMED:GetSize()

    local SCROLL = vgui.Create("PIXEL.ScrollPanel", FRAMED)
    SCROLL:Dock(FILL)
    SCROLL:SetMouseInputEnabled(true)

    SCROLL.Think = function(self)
        for k, v in ipairs(RDV.TRAINING.TESTS) do
            local ENABLED = true
            local REASON

            if !CAN[k] then
                ENABLED = false
            end
                
            if v.T_RANKS then
                local B, R = nil, nil

                if RDV.RANK then
                    B = RDV.RANK.GetPlayerRankTree(LocalPlayer())
                    R = RDV.RANK.GetPlayerRank(LocalPlayer())
                elseif MRS then
                    B = MRS.GetPlayerGroup(LocalPlayer():Team())
                    R = MRS.GetPlyRank(LocalPlayer(), B)
                end
                
                print(B, R)
                if v.T_RANKS[B] then
                    if (v.T_RANKS[B] > R ) then 
                        ENABLED = false
                    end
                else
                    ENABLED = false
                end
            end

            if ( v.TEAM == LocalPlayer():Team() ) then
                ENABLED = false
            end

            if ( RDV.SAL and v.LEVEL and ( tonumber(RDV.SAL.GetLevel(LocalPlayer())) < tonumber(v.LEVEL) ) ) then
                ENABLED = false
            end

            if ( v.CustomCheck(LocalPlayer()) == false ) then
                ENABLED = false
            end

            local DEL = RDV.TRAINING.DELAYS[k]
            if DEL and DEL > CurTime() then
                if ENABLED then
                    REASON = RDV.LIBRARY.GetLang(nil, "TR_retryL", {string.NiceTime( (DEL - CurTime()) )})
                end
                
                ENABLED = false
            end

            local COUNT = #v.QUESTIONS

            local label = self:Add("DLabel")

            label:SetSize(0, h * 0.2)

            label:DockMargin(0, h * 0.01, 0, 0)
            label:Dock(TOP)
            label:SetText("")
            label:SetMouseInputEnabled(true)

            label.Paint = function(self, w, h)
                local COL = PIXEL.OffsetColor(PIXEL.CopyColor(PIXEL.Colors.Header), 5)

                draw.RoundedBox(5, 0, 0, w, h, COL)        

                if ENABLED then
                    local nw = 0

                    if v.IMAGE then
                        nw = w * 0.2
                    else
                        nw = w * 0.05
                    end

                    draw.SimpleText(RDV.LIBRARY.GetLang(nil, "TR_tLabel", {v.NAME, COUNT}), "RD_FONTS_CORE_LABEL_LOWER", nw, h * 0.4, Color(255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                    draw.SimpleText(RDV.LIBRARY.GetLang(nil, "TR_toPass", {v.PASS}), "RD_FONTS_CORE_LABEL_LOWER", nw, h * 0.6, Color(0,255,0), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                else
                    draw.RoundedBox(0, 0, h * 0.2, w, h * 0.6, Color(0, 0, 0, 75))

                    if REASON then
                        draw.SimpleText(REASON, "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    else
                        draw.SimpleText(RDV.LIBRARY.GetLang(nil, "TR_alrPassed"), "RD_FONTS_CORE_LABEL_LOWER", w * 0.5, h * 0.5, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    end
                end
            end

            if ENABLED then
                if v.IMAGE then
                    local IMG = vgui.Create("PIXEL.ImgurButton", label)	-- Add image to Frame
                    IMG:SetWide(w * 0.25)
                    IMG:Dock(LEFT)
                    IMG:DockMargin(w * 0.01, h * 0.01, w * 0.01, h * 0.01)
                    IMG:SetImgurID(v.IMAGE)
                    IMG.PaintOver = function(self, w, h)
                        local imageSize = h * self:GetImageSize()

                        surface.SetDrawColor( 255, 255, 255, 125)
                        surface.DrawOutlinedRect( 0, 0, imageSize, h)
                    end
                end

                local RETURN = vgui.Create("PIXEL.TextButton", label)
                RETURN:Dock(RIGHT)
                RETURN:SetText(RDV.LIBRARY.GetLang(nil, "TR_startLabel"))
                RETURN:SetMouseInputEnabled(true)
                RETURN.DoClick = function(self)
                    FRAMED:SetVisible(false)

                    startTest(k, FRAMED)
                end
            end
        end

        self.Think = function() end
    end
end
net.Receive("RDV.TRAINING.MENU", TrainingMenu)

net.Receive("RDV.TRAINING.CREATE", function()
    local FRAMED = vgui.Create("PIXEL.Frame")
    FRAMED:SetSize(ScrW() * 0.35, ScrH() * 0.5)
    FRAMED:Center()
    FRAMED:MakePopup(true)
    FRAMED:SetMouseInputEnabled(true)
    FRAMED:SetTitle(RDV.LIBRARY.GetLang(nil, "TR_autoTrainer"))

    local w,h = FRAMED:GetSize()

    local TEXT = vgui.Create("PIXEL.TextEntry", FRAMED)
    TEXT:Dock(TOP)
    TEXT:DockMargin(w * 0.05, h * 0.015, w * 0.05, h * 0.015)
    TEXT:SetPlaceholderText(RDV.LIBRARY.GetLang(nil, "TR_modelLabel"))

    local RTEAMS = vgui.Create( "DListView", FRAMED )
    RTEAMS:Dock( FILL )
    RTEAMS:SetMultiSelect( true )
    RTEAMS:AddColumn( RDV.LIBRARY.GetLang(nil, "TR_acQuizzes") )
    RTEAMS:DockMargin(w * 0.05, h * 0.015, w * 0.05, h * 0.015)

    for k, v in ipairs(RDV.TRAINING.TESTS) do
        RTEAMS:AddLine( v.NAME, k )
    end

    local RETURN = vgui.Create("PIXEL.TextButton", FRAMED)
    RETURN:Dock(BOTTOM)
    RETURN:SetText(RDV.LIBRARY.GetLang(nil, "TR_subLabel"))
    RETURN:SetMouseInputEnabled(true)
    RETURN.DoClick = function(self)
        local RTEAMS = RTEAMS:GetSelected()

        net.Start("RDV.TRAINING.CREATE")
            net.WriteString(TEXT:GetValue())
            net.WriteUInt(#RTEAMS, 8)

            for k, v in ipairs(RTEAMS) do
                net.WriteUInt(v:GetValue(2), 8)
            end
        net.SendToServer()

        FRAMED:Remove()
    end
end )

net.Receive("RDV.TRAINING.DELAY", function()
    local SING = net.ReadBool()

    if SING then
        local TEST = net.ReadUInt(8)

        local OBJ = RDV.TRAINING.TESTS[TEST]

        if !OBJ then return end

        RDV.TRAINING.DELAYS[TEST] = ( CurTime() + OBJ.DELAY )
    else
        local COUNT = net.ReadUInt(8)

        for i = 1, COUNT do
            RDV.TRAINING.DELAYS[net.ReadUInt(8)] = tonumber(net.ReadString())
        end
    end
end )