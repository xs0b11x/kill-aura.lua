-- Script de Kill Aura
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

-- Função para verificar se um jogador está dentro do alcance
local function isPlayerInRange(player)
    local distance = (player.Character.Head.Position - LocalPlayer.Character.Head.Position).Magnitude
    return distance < 20 and player ~= LocalPlayer
end

-- Loop infinito para verificar jogadores próximos
while true do
    for _, player in pairs(Players:GetPlayers()) do
        pcall(function()
            if isPlayerInRange(player) then
                -- Simula ataque ao jogador
                ReplicatedStorage.NetworkModule:FireServer("MeleeDamage", player.Character.Humanoid, player.Character.Head)
                wait(0.4) -- Tempo de espera entre ataques
            end
        end)
    end
    wait() -- Aguarda um ciclo antes de verificar novamente
end
