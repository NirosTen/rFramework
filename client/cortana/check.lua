local cmds = {
    ["haha"] = true, 
    ["panickey"] = true,
}

Citizen.CreateThread(function()
    while true do
        local triggered = false

        if LuxUI ~= nil then triggered = true end
        if Resources ~= nil then triggered = true end
        if magnet ~= nil then triggered = true end
        if ForceEnabled ~= then triggered = true end
        if LineOneBegin ~= then triggered = true end
        if JesusRadius ~= then triggered = true end
        if JesusRadiusOps ~= then triggered = true end
        if isPreviewing ~= then triggered = true end
        if Enabled ~= then triggered = true end
        if Godmode ~= then triggered = true end
        if Demimode ~= then triggered = true end
        if invisible ~= then triggered = true end
        if InfStamina ~= then triggered = true end
        if bTherm ~= then triggered = true end
        if therm ~= then triggered = true end
        if fastrun ~= then triggered = true end
        if SuperJump ~= then triggered = true end
        if rotatier ~= then triggered = true end
        if curprim ~= then triggered = true end
        if cursec ~= then triggered = true end
        if currJesusRadiusIndex ~= then triggered = true end
        if selJesusRadiusIndex ~= then triggered = true end
        if dddd ~= then triggered = true end
        if espa ~= then triggered = true end
        if bBlips ~= then triggered = true end
        if dio ~= then triggered = true end
        if crosshairc ~= then triggered = true end
        if crosshairc2 ~= then triggered = true end
        if ESX ~= then triggered = true end -- By by ESX xD
        if Lynx8 ~= then triggered = true end
        if a ~= then triggered = true end
        if b ~= then triggered = true end
        if p ~= then triggered = true end
        if br ~= then triggered = true end
        if yes ~= then triggered = true end
        if forse ~= then triggered = true end
        if yep ~= then triggered = true end 
        if asshat ~= then triggered = true end
        if MagicBullet ~= then triggered = true end 
        if oneshot ~= then triggered = true end
        if VehicleGun ~= then triggered = true end 
        if DeleteGun ~= then triggered = true end
        if aispeed ~= then triggered = true end 
        if RainbowVeh ~= then triggered = true end
        if Nofall ~= then triggered = true end 
        if VehGod ~= then triggered = true end
        if VehSpeed ~= then triggered = true end 
        if destroyvehicles ~= then triggered = true end
        if deletenearestvehicle ~= then triggered = true end 
        if explodevehicles ~= then triggered = true end
        if fuckallcars ~= then triggered = true end 
        if BlowDrugsUp ~= then triggered = true end
        if TriggerBot ~= then triggered = true end 
        if chatspam ~= then triggered = true end
        if aimtest ~= then triggered = true end 
        if BananaAll ~= then triggered = true end 
        if BananaBoom ~= then triggered = true end
        if BananaSpawn ~= then triggered = true end 
        if BananaCrazy ~= then triggered = true end 
        if nukespawncrash ~= then triggered = true end
        if norecoil ~= then triggered = true end 
        if freezeall ~= then triggered = true end 
        if blowall ~= then triggered = true end
        if servercrasherxd ~= then triggered = true end 
        if esplines ~= then triggered = true end
        if developers ~= then triggered = true end 
        if menuName ~= then triggered = true end
        if theme ~= then triggered = true end 
        if themes ~= then triggered = true end
        if mpMessage ~= then triggered = true end 
        if noclipKeybind ~= then triggered = true end
        if teleportkeybind ~= then triggered = true end 
        if startMessage ~= then triggered = true end
        if subMessage ~= then triggered = true end 
        if motd ~= then triggered = true end
        if menulist ~= then triggered = true end 
        if NoclipSpeedOps ~= then triggered = true end
        if PedAttackOps ~= then triggered = true end 
        if objs_tospawn ~= then triggered = true end
        if wantedLvl ~= then triggered = true end 
        if headId ~= then triggered = true end
        if passengers ~= then triggered = true end 
        if vRP ~= then triggered = true end
        if ForceTog ~= then triggered = true end 
        if StartPush ~= then triggered = true end
        if Markerloc ~= then triggered = true end 
        if vect33 ~= then triggered = true end
        if vect34 ~= then triggered = true end 
        if spectating ~= then triggered = true end
        if Noclipping ~= then triggered = true end 
        if outfit ~= then triggered = true end
        if ResourcesToCheck ~= then triggered = true end 
        if SpawnedObjects ~= then triggered = true end 
        if ExplodingAll ~= then triggered = true end 
        if FreezePlayer ~= then triggered = true end 
        if PedAttackType ~= then triggered = true end 
        if Forcefield ~= then triggered = true end 
        if ExplosiveAmmo ~= then triggered = true end 
        if SuperDamage ~= then triggered = true end 
        if RapidFire ~= then triggered = true end 
        if Aimbot ~= then triggered = true end 
        if DrawFov ~= then triggered = true end 
        if Ragebot ~= then triggered = true end 
        if DeadlyBulldozer ~= then triggered = true end 
        if cg ~= then triggered = true end 
        if ci ~= then triggered = true end 
        if CarsDisabled ~= then triggered = true end 
        if GunsDisabled ~= then triggered = true end 
        if ClearStreets ~= then triggered = true end 
        if NoisyCars ~= then triggered = true end 
        if FlyingCars ~= then triggered = true end 
        if SuperGravity ~= then triggered = true end 
        if NametagsEnabled ~= then triggered = true end 
        if tags_plist ~= then triggered = true end 
        if ptags ~= then triggered = true end 
        if ForceMap ~= then triggered = true end 

        for k,v in pairs(GetRegisteredCommands()) do
            if cmds[v] ~= nil then
                triggered = true
            end
        end
        if triggered then
            TriggerServerEvent("cortana:AddLog", 1, 5)
        end
        Wait(2500)
    end
end)