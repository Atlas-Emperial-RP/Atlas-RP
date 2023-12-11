GAS.Logging.LogScanning = {}
GAS.Logging.LogScanning.LogRegistry = {}
GAS.Logging.LogScanning.CurrentLogEntities = {}

function GAS.Logging.LogScanning:CommitToRegistry(log_id)
    for ent in pairs(GAS.Logging.LogScanning.CurrentLogEntities) do
        if (not IsValid(ent)) then return end
        if (GAS.Logging.LogScanning.LogRegistry[ent] == nil) then
            GAS.Logging.LogScanning.LogRegistry[ent] = {}
        end
    end
    GAS.Logging.LogScanning.CurrentLogEntities = {}
end