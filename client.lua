local ill = false
local chance = 6 -- The chance of being sick, checks every minute. 

Citizen.CreateThread(function()

while true do
		Citizen.Wait(60000)

  local chanceill = math.random(1, 100)

   if chanceill < chance then
       ill = true

    end
  end
end)


Citizen.CreateThread(function()

while true do
     local chansatthosta = math.random(30000, 100000)

		Citizen.Wait(chansatthosta)

    if ill then --Checks if ill

--Cough animation
	   RequestAnimDict("timetable@gardener@smoking_joint")
         while not HasAnimDictLoaded("timetable@gardener@smoking_joint") do
        	Citizen.Wait(100)
         end

      TaskPlayAnim(GetPlayerPed(-1), "timetable@gardener@smoking_joint", "idle_cough", 8.0, 8.0, -1, 50, 0, false, false, false)
        Citizen.Wait(3000)
      ClearPedSecondaryTask(GetPlayerPed(-1))

   end
  end
end)

Citizen.CreateThread(function()
while true do

     local chanstillfrisk = math.random(900000, 1800000) -- Chance of being health by yourself

    Citizen.Wait(chanstillfrisk)

    if ill then
    ill = false

    end
  end
end)

--antibiotics stuff 
RegisterNetEvent('esx_kr_ill:frisk')
AddEventHandler('esx_kr_ill:frisk', function()
  ill = false
  end)
