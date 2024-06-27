/*
    Addon id: 10f10c4a-96ac-41b8-b283-36bdee1a0e4b
    Version: v1.1.9 (stable)
*/

include("shared.lua")

function ENT:Initialize()
	zlt.Machine.Initialize(self)
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- 76561198165273585

function ENT:DrawTranslucent()
	self:Draw()
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* 76561198165273576 */

function ENT:Draw()
	self:DrawModel()
	zlt.Machine.Draw(self)
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       -- bacc8689533f5250ce7da6945c7da3969bddbcd7163aacc2ce484e2e8a83c680

function ENT:Think()
	zlt.Machine.Think(self)
end

function ENT:OnRemove()
	zlt.Machine.OnRemove(self)
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* f75b53a1d2e201aeedc8e45c066d7c7955471983908324ca8b5b532134f158c8 */
                                                                                                                                                                                                                                                                                                                                                                                                                                                       /* 76561198165273585 */
