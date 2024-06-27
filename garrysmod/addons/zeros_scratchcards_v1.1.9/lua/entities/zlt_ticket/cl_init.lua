/*
    Addon id: 10f10c4a-96ac-41b8-b283-36bdee1a0e4b
    Version: v1.1.9 (stable)
*/

include("shared.lua")

function ENT:Initialize()
	zlt.Ticket.Initialize(self)
end

function ENT:DrawTranslucent()
	self:Draw()
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* bacc8689533f5250ce7da6945c7da3969bddbcd7163aacc2ce484e2e8a83c680 */

function ENT:Draw()
	self:DrawModel()
	zlt.Ticket.Draw(self)
end

function ENT:Think()
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- f75b53a1d2e201aeedc8e45c066d7c7955471983908324ca8b5b532134f158c8
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* 1a23cccb34e84079339297d7fbc21097e13053705ffbe07f776f05f38858bb77 */

function ENT:OnRemove()
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* ac450a252ccfd31cc7be3778c6daa6ea87f2d445b951d47a65e8d80a8bbab4ca */
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- bacc8689533f5250ce7da6945c7da3969bddbcd7163aacc2ce484e2e8a83c680
