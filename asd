local player = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local bandits = game.Workspace.Enemies:GetChildren()
local Players = game:GetService("Players")

if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Death") then
    game:GetService("ReplicatedStorage").Effect.Container.Death:Destroy()
end

if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Respawn") then
    game:GetService("ReplicatedStorage").Effect.Container.Respawn:Destroy()
end

function GetDistance(point1, point2)
    return (point1 - point2).magnitude
end

function BringBandit()
    local playerPosition = player.Character.HumanoidRootPart.Position
    for _, bandit in ipairs(bandits) do
        if bandit:IsA("Model") and bandit.Name == "Bandit" and bandit.PrimaryPart then
            local banditPosition = bandit.PrimaryPart.Position
            local distance = GetDistance(playerPosition, banditPosition)
            local hbandit = bandit.Humanoid

            if distance <= 500 then
                bandit:SetPrimaryPartCFrame(CFrame.new(playerPosition.X, playerPosition.Y, playerPosition.Z))
            end
        end
    end
end

BringBandit()
