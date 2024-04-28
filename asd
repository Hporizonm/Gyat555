local player = game.Players.LocalPlayer
local TweenService = game:GetService("TweenService")
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
    local playerCharacter = player.Character
    if not playerCharacter or not playerCharacter:FindFirstChild("HumanoidRootPart") then
        return
    end

    local playerPosition = playerCharacter.HumanoidRootPart.Position
    local bandits = game.Workspace.Enemies:GetChildren()

    for _, bandit in ipairs(bandits) do
        if bandit:IsA("Model") and bandit.Name == "Bandit" and bandit.PrimaryPart then
            local banditPosition = bandit.PrimaryPart.Position
            local distance = GetDistance(playerPosition, banditPosition)
            local hbandit = bandit.Humanoid

            if distance <= 500 then
                hbandit.WalkSpeed = 0

                bandit:SetPrimaryPartCFrame(CFrame.new(playerPosition.X, playerPosition.Y, playerPosition.Z))

                -- You may want to reset the WalkSpeed after moving the bandit
                hbandit.WalkSpeed = 16 -- Or whatever the default WalkSpeed should be
            end
        end
    end
end

BringBandit()
