local plateStarts = {"GM",  "GN", "GO", "LX", "BX"}
local plateYears = {"02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70"}
local plateLetters = {"A", "B", "C", "D", "E", "F", "G", "H", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"}

Citizen.CreateThread(function()
    while true do
        for vehicle in GetGamePool('CVehicle') do
            local currentPlate = GetVehicleNumberPlateText(vehicle)
			
            if currentPlate ~= nil then
                whiteSpace = 0

                for i = 1, #currentPlate do
                    if (string.sub(currentPlate, i, i) == " ") then
                        whiteSpace = whiteSpace + 1
                    end
                end

                if whiteSpace == 0 then
                    local plate = plateStarts[math.random(1, #plateStarts)]
                    plate = plate .. '' .. plateYears[math.random(1, #plateYears)]
                    plate = plate .. ' ' .. plateLetters[math.random(1, #plateLetters)]
                    plate = plate .. '' .. plateLetters[math.random(1, #plateLetters)]
                    plate = plate .. '' .. plateLetters[math.random(1, #plateLetters)]

                    SetVehicleNumberPlateText(vehicle, plate)
                end
            end
        end

        Citizen.Wait(500)
    end
end)