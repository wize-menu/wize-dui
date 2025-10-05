--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local v0="https://raw.githubusercontent.com/wize-menu/wize-dui/refs/heads/main/wizekeys.json";local v1=MachoWebRequest(v0);local v2=MachoAuthenticationKey();local function v3() local v65=0 -0 ;local v66;local v67;local v68;while true do if (v65==(2 -0)) then for v275,v276 in ipairs(v67) do if (v276.key==v2) then if v276.expires then local v345=0 + 0 ;local v346;local v347;local v348;local v349;local v350;local v351;while true do if (v345==(1474 -(1329 + 145))) then v346,v347,v348,v349,v350,v351=string.match(v276.expires,"([%d]+)-([%d]+)-([%d]+)T([%d]+):([%d]+):([%d]+)Z");if (v346 and v347 and v348 and v349 and v350 and v351) then local v391=os.time({year=tonumber(v346),month=tonumber(v347),day=tonumber(v348),hour=tonumber(v349),min=tonumber(v350),sec=tonumber(v351)});if (v391>v68) then return true;end end break;end end end end end return false;end if (v65==0) then if  not v1 then return false;end v66,v67=pcall(json.decode,v1);v65=1;end if (v65==(972 -(140 + 831))) then if ( not v66 or  not v67 or (type(v67)~="table")) then return false;end v68=os.time();v65=2;end end end if  not v3() then local v228=1850 -(1409 + 441) ;while true do if (v228==0) then MachoMenuNotification("WizeMenu","Your key ain't valid lmfao: "   .. v2 ,728 -(15 + 703) );return;end end end Citizen.CreateThread(function() local v69=0 + 0 ;local v70;local v71;while true do if (v69==(438 -(262 + 176))) then v70,v71=pcall(json.decode,v1);if (v70 and v71 and (type(v71)=="table")) then for v305,v306 in ipairs(v71) do if ((v306.key==v2) and v306.expires) then local v352,v353,v354,v355,v356,v357=string.match(v306.expires,"([%d]+)-([%d]+)-([%d]+)T([%d]+):([%d]+):([%d]+)Z");if (v352 and v353 and v354 and v355 and v356 and v357) then local v371=os.time();local v372=os.time({year=tonumber(v352),month=tonumber(v353),day=tonumber(v354),hour=tonumber(v355),min=tonumber(v356),sec=tonumber(v357)});local v373=v372-v371 ;local v374=math.floor(v373/(88121 -(345 + 1376)) );local v375=math.floor((v373%86400)/(4288 -(198 + 490)) );local v376;if (v374>(0 -0)) then v376=string.format("You have %d days and %d hours left. Enjoy!",v374,v375);else v376=string.format("You have %d hours left. Enjoy!",v375);end MachoMenuNotification("WizeMenu",v376,11 -6 );end break;end end end break;end end end);local v4=vec2(750,500);local v5=vec2(1706 -(696 + 510) ,500);local v6=150;local v7=20 -10 ;local v8=1277 -(1091 + 171) ;local v9=v4.x-v6 ;local v10=v4.y-(2 * v7) ;local v11=(v9-(v7 * (1 + 2)))/(6 -4) ;local v12=(v10-(v7 * 3))/(6 -4) ;local v13=MachoMenuTabbedWindow("WizeMenu",v5.x,v5.y,v4.x,v4.y,v6);MachoMenuSetKeybind(v13,20);MachoMenuSetAccent(v13,426 -(123 + 251) ,680 -543 ,235);MachoMenuText(v13,"YT @JayThaaGamer");local function v14() CreateThread(function() local v229=0;local v230;while true do if (v229==0) then v230=698 -(208 + 490) ;while true do local v290=0 + 0 ;local v291;local v292;local v293;while true do if (v290==(0 + 0)) then v230=v230 + 0.065 ;v291=math.floor((963 -(660 + 176)) + ((16 + 111) * math.sin(v230)) );v290=203 -(14 + 188) ;end if (v290==(676 -(534 + 141))) then v292=math.floor(52 + 75 + (127 * math.sin(v230 + 2 + 0 )) );v293=math.floor(123 + 4 + (127 * math.sin(v230 + (8 -4) )) );v290=2 -0 ;end if (v290==(5 -3)) then MachoMenuSetAccent(v13,v291,v292,v293);Wait(14 + 11 );break;end end end break;end end end);end v14();local v15=MachoMenuAddTab(v13,"Self");local v16=MachoMenuAddTab(v13,"Server");local v17=MachoMenuAddTab(v13,"Teleport");local v18=MachoMenuAddTab(v13,"Weapon");local v19=MachoMenuAddTab(v13,"Vehicle");local v20=MachoMenuAddTab(v13,"Animations");local v21=MachoMenuAddTab(v13,"Triggers");local v22=MachoMenuAddTab(v13,"Settings");local v23=MachoMenuAddTab(v13,"VIP");local function v24(v72) local v73=v6 + v7 ;local v74=v7 + v8 ;local v75=v74 + v12 + v7 ;local v76=v73 + v11 + v7 ;local v77=(v12 * (2 + 0)) + v7 ;local v78=MachoMenuGroup(v72,"Self",v73,v74,v73 + v11 ,v74 + v77 );local v79=MachoMenuGroup(v72,"Model Changer",v76,v74,v76 + v11 ,v74 + v12 );local v80=MachoMenuGroup(v72,"Functions",v76,v75,v76 + v11 ,v75 + v12 );return v78,v79,v80;end local function v25(v81) local v82=(v9-(v7 * 3))/(398 -(115 + 281)) ;local v83=v6 + v7 ;local v84=v83 + v82 ;local v85=MachoMenuGroup(v81,"Player",v83,v7 + v8 ,v84,v10);local v86=v84 + v7 ;local v87=v86 + v82 ;local v88=MachoMenuGroup(v81,"Everyone",v86,v7 + v8 ,v87,v10);return v85,v88;end local function v26(v89) local v90=(v9-(v7 * (6 -3)))/(2 + 0) ;local v91=v6 + v7 ;local v92=v91 + v90 ;local v93=MachoMenuGroup(v89,"Teleport",v91,v7 + v8 ,v92,v10);local v94=v92 + v7 ;local v95=v94 + v90 ;local v96=MachoMenuGroup(v89,"Other",v94,v7 + v8 ,v95,v10);return v93,v96;end local function v27(v97) local v98=v6 + v7 ;local v99=v7 + v8 ;local v100=v99 + v12 + v7 ;local v101=MachoMenuGroup(v97,"Mods",v98,v99,v98 + v11 ,v99 + v12 );local v102=MachoMenuGroup(v97,"Spawner",v98,v100,v98 + v11 ,v100 + v12 );local v103=v98 + v11 + v7 ;local v104=MachoMenuGroup(v97,"Other",v103,v7 + v8 ,v103 + v11 ,v10);return v101,v102,v104;end local function v28(v105) local v106=0;local v107;local v108;local v109;local v110;local v111;local v112;local v113;while true do if (v106==(7 -4)) then v113=MachoMenuGroup(v105,"Other",v112,v7 + v8 ,v112 + v11 ,v10);return v110,v111,v113;end if ((3 -2)==v106) then v109=v108 + v12 + v7 ;v110=MachoMenuGroup(v105,"Mods",v107,v108,v107 + v11 ,v108 + v12 );v106=869 -(550 + 317) ;end if ((2 -0)==v106) then v111=MachoMenuGroup(v105,"Plate & Spawning",v107,v109,v107 + v11 ,v109 + v12 );v112=v107 + v11 + v7 ;v106=3 -0 ;end if (v106==(0 -0)) then v107=v6 + v7 ;v108=v7 + v8 ;v106=286 -(134 + 151) ;end end end local function v29(v114) local v115=(v9-(v7 * 3))/(1667 -(970 + 695)) ;local v116=v6 + v7 ;local v117=v116 + v115 ;local v118=MachoMenuGroup(v114,"Animations",v116,v7 + v8 ,v117,v10);local v119=v117 + v7 ;local v120=v119 + v115 ;local v121=MachoMenuGroup(v114,"Force Emotes",v119,v7 + v8 ,v120,v10);return v118,v121;end local function v30(v122) local v123=v6 + v7 ;local v124=v7 + v8 ;local v125=v124 + v12 + v7 ;local v126=MachoMenuGroup(v122,"Item Spawner",v123,v124,v123 + v11 ,v124 + v12 );local v127=MachoMenuGroup(v122,"Money Spawner",v123,v125,v123 + v11 ,v125 + v12 );local v128=v123 + v11 + v7 ;local v129=MachoMenuGroup(v122,"Common Exploits",v128,v124,v128 + v11 ,v124 + v12 );local v130=MachoMenuGroup(v122,"Event Payloads",v128,v125,v128 + v11 ,v125 + v12 );return v126,v127,v129,v130;end local function v31(v131) local v132=0 -0 ;local v133;local v134;local v135;local v136;local v137;local v138;local v139;while true do if ((1990 -(582 + 1408))==v132) then v133=v6 + v7 ;v134=v7 + v8 ;v132=3 -2 ;end if (v132==(3 -0)) then v139=MachoMenuGroup(v131,"Common Exploits V2",v138,v7 + v8 ,v138 + v11 ,v10);return v136,v137,v139;end if (v132==(7 -5)) then v137=MachoMenuGroup(v131,"Common Exploits",v133,v135,v133 + v11 ,v135 + v12 );v138=v133 + v11 + v7 ;v132=1827 -(1195 + 629) ;end if (v132==(1 -0)) then v135=v134 + v12 + v7 ;v136=MachoMenuGroup(v131,"Item Spawner",v133,v134,v133 + v11 ,v134 + v12 );v132=243 -(187 + 54) ;end end end local function v32(v140) local v141=v6 + v7 ;local v142=v7 + v8 ;local v143=v142 + v12 + v7 ;local v144=MachoMenuGroup(v140,"Unload",v141,v142,v141 + v11 ,v142 + v12 );local v145=MachoMenuGroup(v140,"Menu Design",v141,v143,v141 + v11 ,v143 + v12 );local v146=v141 + v11 + v7 ;local v147=MachoMenuGroup(v140,"Server Settings",v146,v7 + v8 ,v146 + v11 ,v10);return v144,v145,v147;end local v33={v24(v15)};local v34={v25(v16)};local v35={v26(v17)};local v36={v27(v18)};local v37={v28(v19)};local v38={v29(v20)};local v39={v30(v21)};local v40={v31(v23)};local v41={v32(v22)};local function v42(v148) return GetResourceState(v148)=="started" ;end local function v43() local v149=1000 -(451 + 549) ;local v150;local v151;local v152;while true do if (v149==(1 + 2)) then Wait(500);MachoMenuNotification("[NOTIFICATION] WizeMenu","Finished Enjoy.");break;end if (v149==(2 -0)) then if (v151 and v152) then MachoResourceStop(v152);end Wait(100);MachoMenuNotification("[NOTIFICATION] WizeMenu","Finalizing.");v149=3;end if (v149==(0 -0)) then Wait(2884 -(746 + 638) );MachoMenuNotification("[NOTIFICATION] WizeMenu","Loading Bypasses.");v150=nil;v149=1 + 0 ;end if (v149==1) then function v150() local v277=0 -0 ;local v278;local v279;local v280;while true do if (v277==2) then for v358=0,v280-(342 -(218 + 123))  do local v359=GetResourceByFindIndex(v358);if v278(v359,v279) then return true,v359;end end return false,nil;end if (v277==(1581 -(1535 + 46))) then v278=nil;function v278(v360,v361) local v362=0 + 0 ;local v363;while true do if (0==v362) then v363=LoadResourceFile(v360,v361);return v363~=nil ;end end end v277=1 + 0 ;end if (v277==1) then v279="ai_module_fg-obfuscated.lua";v280=GetNumResources();v277=562 -(306 + 254) ;end end end Wait(7 + 93 );v151,v152=v150();v149=3 -1 ;end end end v43();local v44;if (GetResourceState("qbx_core")=="started") then v44="qbx_core";elseif (GetResourceState("es_extended")=="started") then v44="es_extended";elseif (GetResourceState("qb-core")=="started") then v44="qb-core";else v44="any";end MachoLockLogger();MachoInjectResource((v42("core") and "core") or (v42("es_extended") and "es_extended") or (v42("qb-core") and "qb-core") or (v42("monitor") and "monitor") or "any" ,[[
    local xJdRtVpNzQmKyLf = false -- Free Camera
]]);MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
    Unloaded = false
    local aXfPlMnQwErTyUi = false -- Godmode
    local sRtYuIoPaSdFgHj = false -- Invisibility
    local mKjHgFdSaPlMnBv = false -- No Ragdoll
    local uYtReWqAzXcVbNm = false -- Infinite Stamina
    local peqCrVzHDwfkraYZ = false -- Shrink Ped
    local NpYgTbUcXsRoVm = false -- No Clip
    local xCvBnMqWeRtYuIo = false -- Super Jump
    local nxtBFlQWMMeRLs = false -- Levitation
    local fgawjFmaDjdALaO = false -- Super Strength
    local qWeRtYuIoPlMnBv = false -- Super Punch
    local zXpQwErTyUiPlMn = false -- Throw From Vehicle
    local kJfGhTrEeWqAsDz = false -- Force Third Person
    local zXcVbNmQwErTyUi = false -- Force Driveby
    local yHnvrVNkoOvGMWiS = false -- Anti-Headshot
    local nHgFdSaZxCvBnMq = false -- Anti-Freeze
    local fAwjeldmwjrWkSf = false -- Anti-TP
    local aDjsfmansdjwAEl = false -- Anti-Blackscreen
    local qWpEzXvBtNyLmKj = false -- Crosshair

    local egfjWADmvsjAWf = false -- Spoofed Weapon Spawning
    local LkJgFdSaQwErTy = false -- Infinite Ammo
    local QzWxEdCvTrBnYu = false -- Explosive Ammo
    local RfGtHyUjMiKoLp = false -- One Shot Kill 

    local zXcVbNmQwErTyUi = false -- Vehicle Godmode
    local RNgZCddPoxwFhmBX = false -- Force Vehicle Engine
    local PlAsQwErTyUiOp = false -- Vehicle Auto Repair
    local LzKxWcVbNmQwErTy = false -- Freeze Vehicle
    local NuRqVxEyKiOlZm = false -- Vehicle Hop
    local GxRpVuNzYiTq = false -- Rainbow Vehicle
    local MqTwErYuIoLp = false -- Drift Mode
    local NvGhJkLpOiUy = false -- Easy Handling
    local VkLpOiUyTrEq = false -- Instant Breaks
    local BlNkJmLzXcVb = false -- Unlimited Fuel

    local AsDfGhJkLpZx = false -- Spectate Player
    local aSwDeFgHiJkLoPx = false -- Normal Kill Everyone
    local qWeRtYuIoPlMnAb = false -- Permanent Kill Everyone
    local tUOgshhvIaku = false -- RPG Kill Everyone
    local zXcVbNmQwErTyUi = false -- 
]]);MachoMenuCheckbox(v33[1468 -(899 + 568) ],"Godmode",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        if aXfPlMnQwErTyUi == nil then aXfPlMnQwErTyUi = false end
        aXfPlMnQwErTyUi = true

        local function OxWJ1rY9vB()
            local fLdRtYpLoWqEzXv = CreateThread
            fLdRtYpLoWqEzXv(function()
                while aXfPlMnQwErTyUi and not Unloaded do
                    local dOlNxGzPbTcQ = PlayerPedId()
                    local rKsEyHqBmUiW = PlayerId()

                    if GetResourceState("ReaperV4") == "started" then
                        local kcWsWhJpCwLI = SetPlayerInvincible
                        local ByTqMvSnAzXd = SetEntityInvincible
                        kcWsWhJpCwLI(rKsEyHqBmUiW, true)
                        ByTqMvSnAzXd(dOlNxGzPbTcQ, true)

                    elseif GetResourceState("WaveShield") == "started" then
                        local cvYkmZYIjvQQ = SetEntityCanBeDamaged
                        cvYkmZYIjvQQ(dOlNxGzPbTcQ, false)

                    else
                        local BiIqUJHexRrR = SetEntityCanBeDamaged
                        local UtgGRNyiPhOs = SetEntityProofs
                        local rVuKoDwLsXpC = SetEntityInvincible

                        BiIqUJHexRrR(dOlNxGzPbTcQ, false)
                        UtgGRNyiPhOs(dOlNxGzPbTcQ, true, true, true, false, true, false, false, false)
                        rVuKoDwLsXpC(dOlNxGzPbTcQ, true)
                    end

                    Wait(0)
                end
            end)
        end

        OxWJ1rY9vB()
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        aXfPlMnQwErTyUi = false

        local dOlNxGzPbTcQ = PlayerPedId()
        local rKsEyHqBmUiW = PlayerId()

        if GetResourceState("ReaperV4") == "started" then
            local kcWsWhJpCwLI = SetPlayerInvincible
            local ByTqMvSnAzXd = SetEntityInvincible

            kcWsWhJpCwLI(rKsEyHqBmUiW, false)
            ByTqMvSnAzXd(dOlNxGzPbTcQ, false)

        elseif GetResourceState("WaveShield") == "started" then
            local AilJsyZTXnNc = SetEntityCanBeDamaged
            AilJsyZTXnNc(dOlNxGzPbTcQ, true)

        else
            local tBVAZMubUXmO = SetEntityCanBeDamaged
            local yuTiZtxOXVnE = SetEntityProofs
            local rVuKoDwLsXpC = SetEntityInvincible

            tBVAZMubUXmO(dOlNxGzPbTcQ, true)
            yuTiZtxOXVnE(dOlNxGzPbTcQ, false, false, false, false, false, false, false, false)
            rVuKoDwLsXpC(dOlNxGzPbTcQ, false)
        end
    ]]);end);MachoMenuCheckbox(v33[1 + 0 ],"Invisibility",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        if sRtYuIoPaSdFgHj == nil then sRtYuIoPaSdFgHj = false end
        sRtYuIoPaSdFgHj = true

        local function d2NcWoyTfb()
            if sRtYuIoPaSdFgHj == nil then sRtYuIoPaSdFgHj = false end
            sRtYuIoPaSdFgHj = true

            local zXwCeVrBtNuMyLk = CreateThread
            zXwCeVrBtNuMyLk(function()
                while sRtYuIoPaSdFgHj and not Unloaded do
                    local uYiTpLaNmZxCwEq = SetEntityVisible
                    local hGfDrEsWxQaZcVb = PlayerPedId()
                    uYiTpLaNmZxCwEq(hGfDrEsWxQaZcVb, false, false)
                    Wait(0)
                end

                local uYiTpLaNmZxCwEq = SetEntityVisible
                local hGfDrEsWxQaZcVb = PlayerPedId()
                uYiTpLaNmZxCwEq(hGfDrEsWxQaZcVb, true, false)
            end)
        end

        d2NcWoyTfb()
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        sRtYuIoPaSdFgHj = false

        local function tBKM4syGJL()
            local uYiTpLaNmZxCwEq = SetEntityVisible
            local hGfDrEsWxQaZcVb = PlayerPedId()
            uYiTpLaNmZxCwEq(hGfDrEsWxQaZcVb, true, false)
        end

        tBKM4syGJL()
    ]]);end);MachoMenuCheckbox(v33[2 -1 ],"No Ragdoll",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        if mKjHgFdSaPlMnBv == nil then mKjHgFdSaPlMnBv = false end
        mKjHgFdSaPlMnBv = true

        local function jP7xUrK9Ao()
            local zVpLyNrTmQxWsEd = CreateThread
            zVpLyNrTmQxWsEd(function()
                while mKjHgFdSaPlMnBv and not Unloaded do
                    local oPaSdFgHiJkLzXc = SetPedCanRagdoll
                    oPaSdFgHiJkLzXc(PlayerPedId(), false)
                    Wait(0)
                end
            end)
        end

        jP7xUrK9Ao()
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        mKjHgFdSaPlMnBv = false
    ]]);end);MachoMenuCheckbox(v33[1],"Infinite Stamina",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        if uYtReWqAzXcVbNm == nil then uYtReWqAzXcVbNm = false end
        uYtReWqAzXcVbNm = true

        local function YLvd3pM0tB()
            local tJrGyHnMuQwSaZx = CreateThread
            tJrGyHnMuQwSaZx(function()
                while uYtReWqAzXcVbNm and not Unloaded do
                    local aSdFgHjKlQwErTy = RestorePlayerStamina
                    local rTyUiEaOpAsDfGhJk = PlayerId()
                    aSdFgHjKlQwErTy(rTyUiEaOpAsDfGhJk, 1.0)
                    Wait(0)
                end
            end)
        end

        YLvd3pM0tB()
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        uYtReWqAzXcVbNm = false
    ]]);end);MachoMenuCheckbox(v33[604 -(268 + 335) ],"Tiny Ped",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        if peqCrVzHDwfkraYZ == nil then peqCrVzHDwfkraYZ = false end
        peqCrVzHDwfkraYZ = true

        local function YfeemkaufrQjXTFY()
            local OLZACovzmAvgWPmC = CreateThread
            OLZACovzmAvgWPmC(function()
                while peqCrVzHDwfkraYZ and not Unloaded do
                    local aukLdkvEinBsMWuA = SetPedConfigFlag
                    aukLdkvEinBsMWuA(PlayerPedId(), 223, true)
                    Wait(0)
                end
            end)
        end

        YfeemkaufrQjXTFY()
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        peqCrVzHDwfkraYZ = false
        local aukLdkvEinBsMWuA = SetPedConfigFlag
        aukLdkvEinBsMWuA(PlayerPedId(), 223, false)
    ]]);end);MachoMenuCheckbox(v33[1],"No Clip",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        if NpYgTbUcXsRoVm == nil then NpYgTbUcXsRoVm = false end
        NpYgTbUcXsRoVm = true

        local function KUQpH7owdz()
            local RvBcNxMzKgUiLo = PlayerPedId
            local EkLpOiUhYtGrFe = GetVehiclePedIsIn
            local CtVbXnMzQaWsEd = GetEntityCoords
            local DrTgYhUjIkOlPm = GetEntityHeading
            local QiWzExRdCtVbNm = GetGameplayCamRelativeHeading
            local AoSdFgHjKlZxCv = GetGameplayCamRelativePitch
            local JkLzXcVbNmAsDf = IsDisabledControlJustPressed
            local TyUiOpAsDfGhJk = IsDisabledControlPressed
            local WqErTyUiOpAsDf = SetEntityCoordsNoOffset
            local PlMnBvCxZaSdFg = SetEntityHeading
            local HnJmKlPoIuYtRe = CreateThread

            local YtReWqAzXsEdCv = false

            HnJmKlPoIuYtRe(function()
                while NpYgTbUcXsRoVm and not Unloaded do
                    Wait(0)

                    if JkLzXcVbNmAsDf(0, 303) then
                        YtReWqAzXsEdCv = not YtReWqAzXsEdCv
                    end

                    if YtReWqAzXsEdCv then
                        local speed = 2.0

                        local p = RvBcNxMzKgUiLo()
                        local v = EkLpOiUhYtGrFe(p, false)
                        local inVeh = v ~= 0 and v ~= nil
                        local ent = inVeh and v or p

                        local pos = CtVbXnMzQaWsEd(ent, true)
                        local head = QiWzExRdCtVbNm() + DrTgYhUjIkOlPm(ent)
                        local pitch = AoSdFgHjKlZxCv()

                        local dx = -math.sin(math.rad(head))
                        local dy = math.cos(math.rad(head))
                        local dz = math.sin(math.rad(pitch))
                        local len = math.sqrt(dx * dx + dy * dy + dz * dz)

                        if len ~= 0 then
                            dx, dy, dz = dx / len, dy / len, dz / len
                        end

                        if TyUiOpAsDfGhJk(0, 21) then speed = speed + 2.5 end
                        if TyUiOpAsDfGhJk(0, 19) then speed = 0.25 end

                        if TyUiOpAsDfGhJk(0, 32) then
                            pos = pos + vector3(dx, dy, dz) * speed
                        end
                        if TyUiOpAsDfGhJk(0, 34) then
                            pos = pos + vector3(-dy, dx, 0.0) * speed
                        end
                        if TyUiOpAsDfGhJk(0, 269) then
                            pos = pos - vector3(dx, dy, dz) * speed
                        end
                        if TyUiOpAsDfGhJk(0, 9) then
                            pos = pos + vector3(dy, -dx, 0.0) * speed
                        end
                        if TyUiOpAsDfGhJk(0, 22) then
                            pos = pos + vector3(0.0, 0.0, speed)
                        end
                        if TyUiOpAsDfGhJk(0, 36) then
                            pos = pos - vector3(0.0, 0.0, speed)
                        end

                        WqErTyUiOpAsDf(ent, pos.x, pos.y, pos.z, true, true, true)
                        PlMnBvCxZaSdFg(ent, head)
                    end
                end
                YtReWqAzXsEdCv = false
            end)
        end

        KUQpH7owdz()
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        NpYgTbUcXsRoVm = false
    ]]);end);MachoMenuCheckbox(v33[291 -(60 + 230) ],"Free Camera",function() MachoInjectResource((v42("core") and "core") or (v42("es_extended") and "es_extended") or (v42("qb-core") and "qb-core") or (v42("monitor") and "monitor") or "any" ,[[
        
        g_FreecamFeatureEnabled = true
        
        local function initializeFreecam()
            -- Script State
            local isFreecamActive = false
            local freecamHandle = nil
            local targetCoords, targetEntity = nil, nil
            local currentFeatureIndex = 1

            -- NEW FEATURE: Ped Spawning State
            local pedsToSpawn = { "s_m_m_movalien_01", "u_m_y_zombie_01", "s_m_y_blackops_01", "csb_abigail", "a_c_coyote" }
            local currentPedIndex = 1

            local stopFreecam, startFreecam

            -- Feature Definitions (Now with Ped Spawner)
            local Features = { 
                "Look-Around", 
                "Spawn Ped",         -- ADDED
                "Teleport", 
                "Delete Entity", 
                "Fling Entity", 
                "Flip Vehicle", 
                "Launch Vehicle",
                "Teleport Vehicle",
                "Mess With Vehicle"
            }

            -- Helper Function for Drawing Text
            local function drawText(content, x, y, options)
                SetTextFont(options.font or 4)
                SetTextScale(0.0, options.scale or 0.3)
                SetTextColour(options.color[1], options.color[2], options.color[3], options.color[4])
                SetTextOutline()
                if options.shadow then SetTextDropShadow(2, 0, 0, 0, 255) end
                SetTextCentre(true)
                BeginTextCommandDisplayText("STRING")
                AddTextComponentSubstringPlayerName(content)
                EndTextCommandDisplayText(x, y)
            end

            -- Main Draw Thread (UI Only)
            local function drawThread()
                while isFreecamActive do
                    Wait(0)
                    -- Draw Crosshair
                    drawText("•", 0.5, 0.485, {font = 4, scale = 0.5, color = {255,255,255,200}})
                    
                    -- ##### UI FIX: SCROLLING MENU LOGIC #####
                    local ui = { x = 0.5, y = 0.75, lineHeight = 0.03, maxVisible = 7, colors = { text = {245, 245, 245, 120}, selected = {52, 152, 219, 255} } }
                    local numFeatures = #Features
                    local startIdx, endIdx = 1, numFeatures

                    if numFeatures > ui.maxVisible then
                        startIdx = math.max(1, currentFeatureIndex - math.floor(ui.maxVisible / 2))
                        endIdx = math.min(numFeatures, startIdx + ui.maxVisible - 1)
                        if endIdx == numFeatures then
                            startIdx = numFeatures - ui.maxVisible + 1
                        end
                    end

                    -- Draw a counter above the list
                    drawText(("%d/%d"):format(currentFeatureIndex, numFeatures), ui.x, ui.y - 0.035, {scale = 0.25, color = {255,255,255,120}})

                    local displayCount = 0
                    for i = startIdx, endIdx do
                        local featureName = Features[i]
                        local isSelected = (i == currentFeatureIndex)
                        local lineY = ui.y + (displayCount * ui.lineHeight)
                        if isSelected then
                            drawText(("[ %s ]"):format(featureName), ui.x, lineY, {scale = 0.32, color = ui.colors.selected, shadow = true})
                        else
                            drawText(featureName, ui.x, lineY, {scale = 0.28, color = ui.colors.text})
                        end
                        displayCount = displayCount + 1
                    end
                end
            end

            -- Main Input and Logic Thread
            local function logicThread()
                while isFreecamActive do
                    Wait(0)
                    if IsDisabledControlJustPressed(0, 241) then currentFeatureIndex = (currentFeatureIndex - 2 + #Features) % #Features + 1 elseif IsDisabledControlJustPressed(0, 242) then currentFeatureIndex = (currentFeatureIndex % #Features) + 1 end
                    
                    if IsDisabledControlJustPressed(0, 24) then -- Action Key Pressed
                        local currentFeature = Features[currentFeatureIndex]
                        if currentFeature == "Teleport" and targetCoords then
                            local ped = PlayerPedId()
                            local _, z = GetGroundZFor_3dCoord(targetCoords.x, targetCoords.y, targetCoords.z + 1.0, false)
                            SetEntityCoords(ped, targetCoords.x, targetCoords.y, z and z + 1.0 or targetCoords.z, false, false, false, true)
                        -- ##### NEW FEATURE: SAFE PED SPAWNER LOGIC #####
                        elseif currentFeature == "Spawn Ped" and targetCoords then
                            local model = pedsToSpawn[currentPedIndex]
                            CreateThread(function()
                                local modelHash = GetHashKey(model)
                                RequestModel(modelHash)
                                local timeout = 2000 -- 2 second timeout for model loading
                                while not HasModelLoaded(modelHash) and timeout > 0 do
                                    Wait(100)
                                    timeout = timeout - 100
                                end
                                if HasModelLoaded(modelHash) then
                                    local _, z = GetGroundZFor_3dCoord(targetCoords.x, targetCoords.y, targetCoords.z, false)
                                    local spawnPos = vector3(targetCoords.x, targetCoords.y, z and z + 1.0 or targetCoords.z)
                                    local newPed = CreatePed(4, modelHash, spawnPos.x, spawnPos.y, spawnPos.z, 0.0, true, true)
                                    SetModelAsNoLongerNeeded(modelHash)
                                    TaskStandStill(newPed, -1) -- Make them stand still
                                    currentPedIndex = (currentPedIndex % #pedsToSpawn) + 1 -- Cycle to the next ped for next time
                                end
                            end)
                        elseif currentFeature == "Delete Entity" and targetEntity and DoesEntityExist(targetEntity) then
                            SetEntityAsMissionEntity(targetEntity, true, true)
                            DeleteEntity(targetEntity)
                        elseif currentFeature == "Fling Entity" and targetEntity and (IsEntityAPed(targetEntity) or IsEntityAVehicle(targetEntity)) then
                            ApplyForceToEntity(targetEntity, 1, math.random(-50.0, 50.0), math.random(-50.0, 50.0), 50.0, 0.0, 0.0, 0.0, 0, true, true, true, false, true)
                        elseif currentFeature == "Flip Vehicle" and targetEntity and IsEntityAVehicle(targetEntity) then
                            SetVehicleOnGroundProperly(targetEntity)
                        elseif currentFeature == "Launch Vehicle" and targetEntity and IsEntityAVehicle(targetEntity) then
                            ApplyForceToEntity(targetEntity, 1, 0.0, 0.0, 100.0, 0.0, 0.0, 0.0, 0, true, true, true, false, true)
                        elseif currentFeature == "Teleport Vehicle" and targetEntity and IsEntityAVehicle(targetEntity) then
                            local currentCoords = GetEntityCoords(targetEntity)
                            local newCoords = currentCoords + GetEntityForwardVector(targetEntity) * 5.0 + vector3(0.0, 0.0, 50.0)
                            SetEntityCoords(targetEntity, newCoords.x, newCoords.y, newCoords.z, false, false, false, true)
                        elseif currentFeature == "Mess With Vehicle" and targetEntity and IsEntityAVehicle(targetEntity) then
                            local actions = {
                                function(veh) SetVehicleTyreBurst(veh, math.random(0, 5), false, 1000.0) end,
                                function(veh) SetVehicleDoorOpen(veh, math.random(0, 5), false, false) end,
                                function(veh) SetVehicleEngineOn(veh, not IsVehicleEngineOn(veh), false, true) end,
                                function(veh) SetVehicleLights(veh, math.random(0, 2)) end,
                                function(veh) StartVehicleHorn(veh, 1000, "HELDDOWN", false) end
                            }
                            local randomAction = actions[math.random(#actions)]
                            randomAction(targetEntity)
                        end
                    end
                end
            end

            -- Main Camera Movement Thread (Unchanged)
            local function cameraThread()
                local baseSpeed, boostSpeed, slowSpeed = 1.0, 9.0, 0.1; local mouseSensitivity = 7.5; local function clamp(val, min, max) return math.max(min, math.min(max, val)) end; local function rotToDir(rot) local rX, rZ = math.rad(rot.x), math.rad(rot.z); return vector3(-math.sin(rZ)*math.cos(rX), math.cos(rZ)*math.cos(rX), math.sin(rX)) end;
                while isFreecamActive do
                    Wait(0)
                    local camPos, camRotRaw = GetCamCoord(freecamHandle), GetCamRot(freecamHandle, 2); local camRot = { x = camRotRaw.x, y = camRotRaw.y, z = camRotRaw.z }; local direction = rotToDir(camRot); local right = vector3(direction.y, -direction.x, 0)
                    local speed = baseSpeed; if IsDisabledControlPressed(0, 21) then speed = boostSpeed end; if IsDisabledControlPressed(0, 19) then speed = slowSpeed end
                    if IsDisabledControlPressed(0, 32) then camPos = camPos + direction * speed end; if IsDisabledControlPressed(0, 33) then camPos = camPos - direction * speed end; if IsDisabledControlPressed(0, 34) then camPos = camPos - right * speed end; if IsDisabledControlPressed(0, 35) then camPos = camPos + right * speed end; if IsDisabledControlPressed(0, 22) then camPos = camPos + vector3(0, 0, 1.0) * speed end; if IsDisabledControlPressed(0, 36) then camPos = camPos - vector3(0, 0, 1.0) * speed end
                    local mX, mY = GetControlNormal(0,1)*mouseSensitivity, GetControlNormal(0,2)*mouseSensitivity; camRot.x = clamp(camRot.x-mY, -89.0, 89.0); camRot.z = camRot.z-mX
                    SetCamCoord(freecamHandle, camPos.x, camPos.y, camPos.z); SetCamRot(freecamHandle, camRot.x, camRot.y, camRot.z, 2); SetFocusPosAndVel(camPos.x, camPos.y, camPos.z, 0.0, 0.0, 0.0)
                    local ray = StartShapeTestRay(camPos.x, camPos.y, camPos.z, camPos.x+direction.x*1000.0, camPos.y+direction.y*1000.0, camPos.z+direction.z*1000.0, -1, PlayerPedId(), 7); local _, hit, coords, _, entity = GetShapeTestResult(ray); if hit then targetCoords, targetEntity = coords, entity else targetCoords, targetEntity = nil, nil end
                end
            end
            
            startFreecam = function()
                if isFreecamActive then return end
                isFreecamActive = true
                local startPos, startRot, startFov = GetGameplayCamCoord(), GetGameplayCamRot(2), GetGameplayCamFov()
                freecamHandle = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", startPos.x, startPos.y, startPos.z, startRot.x, startRot.y, startRot.z, startFov, true, 2)
                
                if not DoesCamExist(freecamHandle) then isFreecamActive = false; return end

                RenderScriptCams(true, false, 0, true, true)
                SetCamActive(freecamHandle, true)
                CreateThread(drawThread)
                CreateThread(logicThread)
                CreateThread(cameraThread)
            end

            stopFreecam = function()
                if not isFreecamActive then return end
                isFreecamActive = false
                if freecamHandle and DoesCamExist(freecamHandle) then SetCamActive(freecamHandle, false); RenderScriptCams(false, false, 0, true, true); DestroyCam(freecamHandle, false) end
                Wait(10); SetFocusEntity(PlayerPedId()); ClearFocus()
                freecamHandle = nil
            end
            
            CreateThread(function()
                while g_FreecamFeatureEnabled and not Unloaded do Wait(0)
                    if IsDisabledControlJustPressed(0, 74) then -- H key
                        if isFreecamActive then stopFreecam()
                        else startFreecam() end
                    end
                end
            end)
        end
        
        initializeFreecam()
    ]]);end,function() MachoInjectResource((v42("core") and "core") or (v42("es_extended") and "es_extended") or (v42("qb-core") and "qb-core") or (v42("monitor") and "monitor") or "any" ,[[
        g_FreecamFeatureEnabled = false
        if isFreecamActive and stopFreecam then stopFreecam() end
    ]]);end);MachoMenuCheckbox(v33[573 -(426 + 146) ],"Super Jump",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        if xCvBnMqWeRtYuIo == nil then xCvBnMqWeRtYuIo = false end
        xCvBnMqWeRtYuIo = true

        local function JcWT5vYEq1()
            local yLkPwOiUtReAzXc = CreateThread
            yLkPwOiUtReAzXc(function()
                while xCvBnMqWeRtYuIo and not Unloaded do
                    local hGfDsAzXcVbNmQw = SetSuperJumpThisFrame
                    local eRtYuIoPaSdFgHj = PlayerPedId()
                    local oPlMnBvCxZlKjHg = PlayerId()

                    hGfDsAzXcVbNmQw(oPlMnBvCxZlKjHg)
                    Wait(0)
                end
            end)
        end

        JcWT5vYEq1()
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        xCvBnMqWeRtYuIo = false
    ]]);end);MachoMenuCheckbox(v33[1 + 0 ],"Levitation",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        -- make helpers global so other chunks can use them
        function ScaleVector(vect, mult)
            return vector3(vect.x * mult, vect.y * mult, vect.z * mult)
        end

        function AddVectors(vect1, vect2)
            return vector3(vect1.x + vect2.x, vect1.y + vect2.y, vect1.z + vect2.z)
        end

        function ApplyForce(entity, direction)
            local XroXTNEFqxoWfH = ApplyForceToEntity
            XroXTNEFqxoWfH(entity, 3, direction, 0, 0, 0, false, false, true, true, false, true)
        end

        function SubVectors(vect1, vect2)
            return vector3(vect1.x - vect2.x, vect1.y - vect2.y, vect1.z - vect2.z)
        end

        function Oscillate(entity, position, angleFreq, dampRatio)
            local OBaTQqteIpmZVo = GetEntityVelocity
            local pos1 = ScaleVector(SubVectors(position, GetEntityCoords(entity)), (angleFreq * angleFreq))
            local pos2 = AddVectors(ScaleVector(OBaTQqteIpmZVo(entity), (2.0 * angleFreq * dampRatio)), vector3(0.0, 0.0, 0.1))
            local targetPos = SubVectors(pos1, pos2)
            ApplyForce(entity, targetPos)
        end

        function RotationToDirection(rot)
            local radZ = math.rad(rot.z)
            local radX = math.rad(rot.x)
            local cosX = math.cos(radX)
            return vector3(
                -math.sin(radZ) * cosX,
                math.cos(radZ) * cosX,
                math.sin(radX)
            )
        end

        function GetClosestCoordOnLine(startCoords, endCoords, entity)
            local CDGcdMQhosGVCf = GetShapeTestResult
            local UaWIFHgeizhHua = StartShapeTestRay
            local result, hit, hitCoords, surfaceNormal, entityHit =
                CDGcdMQhosGVCf(UaWIFHgeizhHua(startCoords.x, startCoords.y, startCoords.z, endCoords.x, endCoords.y, endCoords.z, -1, entity, 0))
            return hit == 1, hitCoords
        end

        function GetCameraLookingAtCoord(distance)
            local playerPed = PlayerPedId()
            local camRot = GetGameplayCamRot(2)
            local camCoord = GetGameplayCamCoord()
            local forwardVector = RotationToDirection(camRot)
            local destination = vector3(
                camCoord.x + forwardVector.x * distance,
                camCoord.y + forwardVector.y * distance,
                camCoord.z + forwardVector.z * distance
            )
            local hit, endCoords = GetClosestCoordOnLine(camCoord, destination, playerPed)
            if hit then return endCoords else return destination end
        end
    ]]);MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function awfjawr57awt7f()
            nxtBFlQWMMeRLs = true

            local jIiIfikctHYrlH = CreateThread
            jIiIfikctHYrlH(function()
                while nxtBFlQWMMeRLs and not Unloaded do
                    Wait(0)
                    local ped = PlayerPedId()

                    local SZxuJlyJQmGlZz = SetPedCanRagdoll
                    local valuOZfymjeVaH = IsEntityPlayingAnim
                    local IiHiLVRagMQhrn = RequestAnimDict
                    local mOZOquvggdnbod = HasAnimDictLoaded
                    local UFZdrZNXpLwpjT = TaskPlayAnim
                    local cQPIZtKyyWaVcY = GetCameraLookingAtCoord
                    local OyvuuAMyvjtIzD = GetGameplayCamRot
                    local XKWvPIkCKMXIfR = IsDisabledControlPressed  -- FIXED: missing '='

                    while XKWvPIkCKMXIfR(0, 22) do
                        SZxuJlyJQmGlZz(ped, false)

                        if not valuOZfymjeVaH(ped, "oddjobs@assassinate@construction@", "unarmed_fold_arms", 3) then
                            IiHiLVRagMQhrn("oddjobs@assassinate@construction@")
                            while not mOZOquvggdnbod("oddjobs@assassinate@construction@") do
                                Wait(0)
                            end
                            UFZdrZNXpLwpjT(ped, "oddjobs@assassinate@construction@", "unarmed_fold_arms",
                                8.0, -8.0, -1, 49, 0, false, false, false)
                        end

                        local camRot = OyvuuAMyvjtIzD(2)
                        local camHeading = (camRot.z + 360) % 360
                        local direction = cQPIZtKyyWaVcY(77)

                        SetEntityHeading(ped, camHeading)
                        Oscillate(ped, direction, 0.33, 0.9)

                        Wait(1)
                    end

                    if valuOZfymjeVaH(ped, "oddjobs@assassinate@construction@", "unarmed_fold_arms", 3) then
                        ClearPedTasks(ped)
                    end

                    SZxuJlyJQmGlZz(ped, true)
                end
            end)
        end

        awfjawr57awt7f()
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        nxtBFlQWMMeRLs = false
        ClearPedTasks(PlayerPedId())
    ]]);end);MachoMenuCheckbox(v33[1457 -(282 + 1174) ],"Super Strength",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        if fgawjFmaDjdALaO == nil then fgawjFmaDjdALaO = false end
        fgawjFmaDjdALaO = true

        local holdingEntity = false
        local holdingCarEntity = false
        local holdingPed = false
        local heldEntity = nil
        local entityType = nil
        local awfhjawrasfs = CreateThread

        awfhjawrasfs(function()
            while fgawjFmaDjdALaO and not Unloaded do
                Wait(0)
                if holdingEntity and heldEntity then
                    local playerPed = PlayerPedId()
                    local headPos = GetPedBoneCoords(playerPed, 0x796e, 0.0, 0.0, 0.0)
                    DrawText3Ds(headPos.x, headPos.y, headPos.z + 0.5, "[Y] Drop Entity / [U] Attach Ped")
                    
                    if holdingCarEntity and not IsEntityPlayingAnim(playerPed, 'anim@mp_rollarcoaster', 'hands_up_idle_a_player_one', 3) then
                        RequestAnimDict('anim@mp_rollarcoaster')
                        while not HasAnimDictLoaded('anim@mp_rollarcoaster') do
                            Wait(100)
                        end
                        TaskPlayAnim(playerPed, 'anim@mp_rollarcoaster', 'hands_up_idle_a_player_one', 8.0, -8.0, -1, 50, 0, false, false, false)
                    elseif (holdingPed or not holdingCarEntity) and not IsEntityPlayingAnim(playerPed, 'anim@heists@box_carry@', 'idle', 3) then
                        RequestAnimDict('anim@heists@box_carry@')
                        while not HasAnimDictLoaded('anim@heists@box_carry@') do
                            Wait(100)
                        end
                        TaskPlayAnim(playerPed, 'anim@heists@box_carry@', 'idle', 8.0, -8.0, -1, 50, 0, false, false, false)
                    end

                    if not IsEntityAttached(heldEntity) then
                        holdingEntity = false
                        holdingCarEntity = false
                        holdingPed = false
                        heldEntity = nil
                    end
                end
            end
        end)

        awfhjawrasfs(function()
            while fgawjFmaDjdALaO and not Unloaded do
                Wait(0)
                local playerPed = PlayerPedId()
                local camPos = GetGameplayCamCoord()
                local camRot = GetGameplayCamRot(2)
                local direction = RotationToDirection(camRot)
                local dest = vec3(camPos.x + direction.x * 10.0, camPos.y + direction.y * 10.0, camPos.z + direction.z * 10.0)

                local rayHandle = StartShapeTestRay(camPos.x, camPos.y, camPos.z, dest.x, dest.y, dest.z, -1, playerPed, 0)
                local _, hit, _, _, entityHit = GetShapeTestResult(rayHandle)
                local validTarget = false

                if hit == 1 then
                    entityType = GetEntityType(entityHit)
                    if entityType == 3 or entityType == 2 or entityType == 1 then
                        validTarget = true
                        local headPos = GetPedBoneCoords(playerPed, 0x796e, 0.0, 0.0, 0.0)
                        DrawText3Ds(headPos.x, headPos.y, headPos.z + 0.5, "[E] Pick Up / [Y] Drop")
                    end
                end

                if IsDisabledControlJustReleased(0, 38) then
                    if validTarget and not holdingEntity then
                        holdingEntity = true
                        heldEntity = entityHit

                        local wfuawruawts = AttachEntityToEntity

                        if entityType == 3 then
                            wfuawruawts(heldEntity, playerPed, GetPedBoneIndex(playerPed, 60309), 0.0, 0.2, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
                        elseif entityType == 2 then
                            holdingCarEntity = true
                            wfuawruawts(heldEntity, playerPed, GetPedBoneIndex(playerPed, 60309), 1.0, 0.5, 0.0, 0.0, 0.0, 0.0, true, true, false, false, 1, true)
                        elseif entityType == 1 then
                            holdingPed = true
                            wfuawruawts(heldEntity, playerPed, GetPedBoneIndex(playerPed, 60309), 1.0, 0.5, 0.0, 0.0, 0.0, 0.0, true, true, false, false, 1, true)
                        end
                    end
                elseif IsDisabledControlJustReleased(0, 246) then
                    if holdingEntity then
                        local wgfawhtawrs = DetachEntity
                        local dfgjsdfuwer = ApplyForceToEntity
                        local sdgfhjwserw = ClearPedTasks

                        wgfawhtawrs(heldEntity, true, true)
                        dfgjsdfuwer(heldEntity, 1, direction.x * 500, direction.y * 500, direction.z * 500, 0.0, 0.0, 0.0, 0, false, true, true, false, true)
                        holdingEntity = false
                        holdingCarEntity = false
                        holdingPed = false
                        heldEntity = nil
                        sdgfhjwserw(PlayerPedId())
                    end
                end
            end
        end)

        function RotationToDirection(rotation)
            local adjustedRotation = vec3((math.pi / 180) * rotation.x, (math.pi / 180) * rotation.y, (math.pi / 180) * rotation.z)
            local direction = vec3(-math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), math.sin(adjustedRotation.x))
            return direction
        end

        function DrawText3Ds(x, y, z, text)
            local onScreen, _x, _y = World3dToScreen2d(x, y, z)
            local px, py, pz = table.unpack(GetGameplayCamCoords())
            local scale = (1 / GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)) * 2
            local fov = (1 / GetGameplayCamFov()) * 100
            scale = scale * fov

            if onScreen then
                SetTextScale(0.0 * scale, 0.35 * scale)
                SetTextFont(0)
                SetTextProportional(1)
                SetTextColour(255, 255, 255, 215)
                SetTextDropshadow(0, 0, 0, 0, 155)
                SetTextEdge(2, 0, 0, 0, 150)
                SetTextDropShadow()
                -- SetTextOutline()
                SetTextEntry("STRING")
                SetTextCentre(1)
                AddTextComponentString(text)
                DrawText(_x, _y)
            end
        end
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        fgawjFmaDjdALaO = false
    ]]);end);MachoMenuCheckbox(v33[1],"Super Punch",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        if qWeRtYuIoPlMnBv == nil then qWeRtYuIoPlMnBv = false end
        qWeRtYuIoPlMnBv = true

        local function NdaFBuHkvo()
            local uTrEsAzXcVbNmQw = CreateThread
            uTrEsAzXcVbNmQw(function()
                while qWeRtYuIoPlMnBv and not Unloaded do
                    local nBvCxZlKjHgFdSa = SetPlayerMeleeWeaponDamageModifier
                    local cVbNmQwErTyUiOp = SetPlayerVehicleDamageModifier
                    local bNmQwErTyUiOpAs = SetWeaponDamageModifier
                    local sDfGhJkLqWeRtYu = PlayerId()
                    local DamageRateValue = 150.0
                    local WeaponNameForDamage = "WEAPON_UNARMED"


                    nBvCxZlKjHgFdSa(sDfGhJkLqWeRtYu, DamageRateValue)
                    cVbNmQwErTyUiOp(sDfGhJkLqWeRtYu, DamageRateValue)
                    bNmQwErTyUiOpAs(GetHashKey(WeaponNameForDamage), DamageRateValue)

                    Wait(0)
                end
            end)
        end

        NdaFBuHkvo()
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local qWeRtYuIoPlMnBv = false
        local nBvCxZlKjHgFdSa = SetPlayerMeleeWeaponDamageModifier
        local cVbNmQwErTyUiOp = SetPlayerVehicleDamageModifier
        local bNmQwErTyUiOpAs = SetWeaponDamageModifier
        local sDfGhJkLqWeRtYu = PlayerId()

        nBvCxZlKjHgFdSa(sDfGhJkLqWeRtYu, 1.0)
        cVbNmQwErTyUiOp(sDfGhJkLqWeRtYu, 1.0)
        bNmQwErTyUiOpAs(GetHashKey("WEAPON_UNARMED"), 1.0)
    ]]);end);MachoMenuCheckbox(v33[812 -(569 + 242) ],"Throw From Vehicle",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        if zXpQwErTyUiPlMn == nil then zXpQwErTyUiPlMn = false end
        zXpQwErTyUiPlMn = true

        local function qXzRP7ytKW()
            local iLkMzXvBnQwSaTr = CreateThread
            iLkMzXvBnQwSaTr(function()
                while zXpQwErTyUiPlMn and not Unloaded do
                    local vBnMaSdFgTrEqWx = SetRelationshipBetweenGroups
                    vBnMaSdFgTrEqWx(5, GetHashKey('PLAYER'), GetHashKey('PLAYER'))
                    Wait(0)
                end
            end)
        end

        qXzRP7ytKW()
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        zXpQwErTyUiPlMn = false
    ]]);end);MachoMenuCheckbox(v33[1],"Force Third Person",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        if kJfGhTrEeWqAsDz == nil then kJfGhTrEeWqAsDz = false end
        kJfGhTrEeWqAsDz = true

        local function pqkTRWZ38y()
            local gKdNqLpYxMiV = CreateThread
            gKdNqLpYxMiV(function()
                while kJfGhTrEeWqAsDz and not Unloaded do
                    local qWeRtYuIoPlMnBv = SetFollowPedCamViewMode
                    local aSdFgHjKlQwErTy = SetFollowVehicleCamViewMode

                    qWeRtYuIoPlMnBv(0)
                    aSdFgHjKlQwErTy(0)
                    Wait(0)
                end
            end)
        end

        pqkTRWZ38y()
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        kJfGhTrEeWqAsDz = false
    ]]);end);MachoMenuCheckbox(v33[1],"Force Driveby",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        if zXcVbNmQwErTyUi == nil then zXcVbNmQwErTyUi = false end
        zXcVbNmQwErTyUi = true

        local function UEvLBcXqM6()
            local cVbNmAsDfGhJkLz = CreateThread
            cVbNmAsDfGhJkLz(function()
                while zXcVbNmQwErTyUi and not Unloaded do
                    local lKjHgFdSaZxCvBn = SetPlayerCanDoDriveBy
                    local eRtYuIoPaSdFgHi = PlayerPedId()

                    lKjHgFdSaZxCvBn(eRtYuIoPaSdFgHi, true)
                    Wait(0)
                end
            end)
        end

        UEvLBcXqM6()
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        zXcVbNmQwErTyUi = false
    ]]);end);MachoMenuCheckbox(v33[2 -1 ],"Anti-Headshot",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        if yHnvrVNkoOvGMWiS == nil then yHnvrVNkoOvGMWiS = false end
        yHnvrVNkoOvGMWiS = true

        local eeitKYqDwYbPslTW = CreateThread
        local function LIfbdMbeIAeHTnnx()
            eeitKYqDwYbPslTW(function()
                while yHnvrVNkoOvGMWiS and not Unloaded do
                    local fhw72q35d8sfj = SetPedSuffersCriticalHits
                    fhw72q35d8sfj(PlayerPedId(), false)
                    Wait(0)
                end
            end)
        end

        LIfbdMbeIAeHTnnx()
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        yHnvrVNkoOvGMWiS = false
        fhw72q35d8sfj(PlayerPedId(), true)
    ]]);end);MachoMenuCheckbox(v33[1 + 0 ],"Anti-Freeze",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        if nHgFdSaZxCvBnMq == nil then nHgFdSaZxCvBnMq = false end
        nHgFdSaZxCvBnMq = true

        local sdfw3w3tsdg = CreateThread
        local function XELa6FJtsB()
            sdfw3w3tsdg(function()
                while nHgFdSaZxCvBnMq and not Unloaded do
                    local fhw72q35d8sfj = FreezeEntityPosition
                    local segfhs347dsgf = ClearPedTasks

                    if IsEntityPositionFrozen(PlayerPedId()) then
                        fhw72q35d8sfj(PlayerPedId(), false)
                        segfhs347dsgf(PlayerPedId())
                    end
                    
                    Wait(0)
                end
            end)
        end

        XELa6FJtsB()
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        nHgFdSaZxCvBnMq = false
    ]]);end);MachoMenuCheckbox(v33[1025 -(706 + 318) ],"Anti-Blackscreen",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        if aDjsfmansdjwAEl == nil then aDjsfmansdjwAEl = false end
        aDjsfmansdjwAEl = true

        local sdfw3w3tsdg = CreateThread
        local function XELWAEDa6FJtsB()
            sdfw3w3tsdg(function()
                while aDjsfmansdjwAEl and not Unloaded do
                    DoScreenFadeIn(0)
                    Wait(0)
                end
            end)
        end

        XELWAEDa6FJtsB()
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        aDjsfmansdjwAEl = false
    ]]);end);local v45=MachoMenuInputbox(v33[2],"Model Name:","...");MachoMenuButton(v33[2],"Change Model",function() local v153=MachoMenuGetInputbox(v45);if ((type(v153)=="string") and (v153~="")) then local v248=1251 -(721 + 530) ;local v249;while true do if (0==v248) then v249=string.format([[
            local function GykR8qjWTp()
                local nHgFdSaZxCvBnMq = RequestModel
                local xCvBnMqWeRtYuIo = HasModelLoaded
                local aSdFgHjKlQwErTy = SetPlayerModel
                local oPlMnBvCxZlKjHg = SetPedDefaultComponentVariation

                nHgFdSaZxCvBnMq(GetHashKey("%s"))
                while not xCvBnMqWeRtYuIo(GetHashKey("%s")) do
                    Wait(1)
                end
                
                aSdFgHjKlQwErTy(PlayerId(), GetHashKey("%s"))
                oPlMnBvCxZlKjHg(PlayerPedId())
            end

            GykR8qjWTp()
        ]],v153,v153,v153);MachoInjectResource((v42("oxmysql") and "oxmysql") or "any" ,v249);break;end end end end);MachoMenuButton(v33[1273 -(945 + 326) ],"White Thug Drip",function() function WhiteThugDrip() local v231=0 -0 ;local v232;while true do if (v231==(0 + 0)) then v232=PlayerPedId();SetPedComponentVariation(v232,711 -(271 + 429) ,101 + 8 ,1500 -(1408 + 92) ,1088 -(461 + 625) );v231=1289 -(993 + 295) ;end if (v231==2) then SetPedComponentVariation(v232,1 + 3 ,56,1171 -(418 + 753) ,2);SetPedComponentVariation(v232,3 + 3 ,19,0 + 0 ,2);v231=1 + 2 ;end if (v231==(1 + 2)) then SetPedPropIndex(v232,529 -(406 + 123) ,1770 -(1749 + 20) ,0 + 0 ,true);break;end if (v231==(1323 -(1249 + 73))) then SetPedComponentVariation(v232,3 + 5 ,1160 -(466 + 679) ,0,4 -2 );SetPedComponentVariation(v232,3,5,0,2);v231=5 -3 ;end end end WhiteThugDrip();end);MachoMenuButton(v33[1902 -(106 + 1794) ],"JTG Mafia Drip",function() local v154=0 + 0 ;while true do if (0==v154) then function JTGMafia() local v281=PlayerPedId();SetPedComponentVariation(v281,11,2 + 3 ,0 -0 ,2);SetPedComponentVariation(v281,21 -13 ,15,114 -(4 + 110) ,586 -(57 + 527) );SetPedComponentVariation(v281,1430 -(41 + 1386) ,108 -(17 + 86) ,0,2 + 0 );SetPedComponentVariation(v281,4,93 -51 ,0 -0 ,168 -(122 + 44) );SetPedComponentVariation(v281,10 -4 ,19 -13 ,0 + 0 ,2);SetPedPropIndex(v281,0,4 + 22 ,0 -0 ,true);SetPedPropIndex(v281,66 -(30 + 35) ,3 + 0 ,1257 -(1043 + 214) ,true);end JTGMafia();break;end end end);MachoMenuButton(v33[11 -8 ],"Heal",function() SetEntityHealth(PlayerPedId(),1412 -(323 + 889) );end);MachoMenuButton(v33[7 -4 ],"Armor",function() SetPedArmour(PlayerPedId(),680 -(361 + 219) );end);MachoMenuButton(v33[323 -(53 + 267) ],"Fill Hunger",function() MachoInjectResource2(1 + 2 ,(v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function DawrjatjsfAW()
            TriggerEvent('esx_status:set', 'hunger', 1000000)
        end

        DawrjatjsfAW()
    ]]);end);MachoMenuButton(v33[3],"Fill Thirst",function() MachoInjectResource2(416 -(15 + 398) ,(v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function sWj238fsMAw()
            TriggerEvent('esx_status:set', 'thirst', 1000000)
        end

        sWj238fsMAw()
    ]]);end);MachoMenuButton(v33[3],"Revive",function() MachoInjectResource2(3,(v42("ox_inventory") and "ox_inventory") or (v42("ox_lib") and "ox_lib") or (v42("es_extended") and "es_extended") or (v42("qb-core") and "qb-core") or (v42("wasabi_ambulance") and "wasabi_ambulance") or (v42("ak47_ambulancejob") and "ak47_ambulancejob") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function AcjU5NQzKw()
            if GetResourceState('prp-injuries') == 'started' then
                TriggerEvent('prp-injuries:hospitalBedHeal', skipHeal)
                return
            end

            if GetResourceState('es_extended') == 'started' then
                TriggerEvent("esx_ambulancejob:revive")
                return
            end

            if GetResourceState('qb-core') == 'started' then
                TriggerEvent("hospital:client:Revive")
                return
            end

            if GetResourceState('wasabi_ambulance') == 'started' then
                TriggerEvent("wasabi_ambulance:revive")
                return
            end

            if GetResourceState('ak47_ambulancejob') == 'started' then
                TriggerEvent("ak47_ambulancejob:revive")
                return
            end

            NcVbXzQwErTyUiO = GetEntityHeading(PlayerPedId())
            BvCxZlKjHgFdSaP = GetEntityCoords(PlayerPedId())

            RtYuIoPlMnBvCxZ = NetworkResurrectLocalPlayer
            RtYuIoPlMnBvCxZ(BvCxZlKjHgFdSaP.x, BvCxZlKjHgFdSaP.y, BvCxZlKjHgFdSaP.z, NcVbXzQwErTyUiO, false, false, false, 1, 0)
        end

        AcjU5NQzKw()
    ]]);end);MachoMenuButton(v33[985 -(18 + 964) ],"Suicide",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function RGybF0JqEt()
            local aSdFgHjKlQwErTy = SetEntityHealth
            aSdFgHjKlQwErTy(PlayerPedId(), 0)
        end

        RGybF0JqEt()
    ]]);end);MachoMenuButton(v33[3],"Force Ragdoll",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function awfAEDSADWEf()
            local cWAmdjakwDksFD = SetPedToRagdoll
            cWAmdjakwDksFD(PlayerPedId(), 3000, 3000, 0, false, false, false)
        end

        awfAEDSADWEf()
    ]]);end);MachoMenuButton(v33[11 -8 ],"Clear Task",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function iPfT7kN3dU()
            local zXcVbNmAsDfGhJk = ClearPedTasksImmediately
            zXcVbNmAsDfGhJk(PlayerPedId())
        end

        iPfT7kN3dU()
    ]]);end);MachoMenuButton(v33[2 + 1 ],"Clear Vision",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function MsVqZ29ptY()
            local qWeRtYuIoPlMnBv = ClearTimecycleModifier
            local kJfGhTrEeWqAsDz = ClearExtraTimecycleModifier

            qWeRtYuIoPlMnBv()
            kJfGhTrEeWqAsDz()
        end

        MsVqZ29ptY()
    ]]);end);MachoMenuButton(v33[3],"Randomize Outfit",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function UxrKYLp378()
            local UwEsDxCfVbGtHy = PlayerPedId
            local FdSaQwErTyUiOp = GetNumberOfPedDrawableVariations
            local QwAzXsEdCrVfBg = SetPedComponentVariation
            local LkJhGfDsAqWeRt = SetPedHeadBlendData
            local MnBgVfCdXsZaQw = SetPedHairColor
            local RtYuIoPlMnBvCx = GetNumHeadOverlayValues
            local TyUiOpAsDfGhJk = SetPedHeadOverlay
            local ErTyUiOpAsDfGh = SetPedHeadOverlayColor
            local DfGhJkLzXcVbNm = ClearPedProp

            local function PqLoMzNkXjWvRu(component, exclude)
                local ped = UwEsDxCfVbGtHy()
                local total = FdSaQwErTyUiOp(ped, component)
                if total <= 1 then return 0 end
                local choice = exclude
                while choice == exclude do
                    choice = math.random(0, total - 1)
                end
                return choice
            end

            local function OxVnBmCxZaSqWe(component)
                local ped = UwEsDxCfVbGtHy()
                local total = FdSaQwErTyUiOp(ped, component)
                return total > 1 and math.random(0, total - 1) or 0
            end

            local ped = UwEsDxCfVbGtHy()

            QwAzXsEdCrVfBg(ped, 11, PqLoMzNkXjWvRu(11, 15), 0, 2)
            QwAzXsEdCrVfBg(ped, 6, PqLoMzNkXjWvRu(6, 15), 0, 2)
            QwAzXsEdCrVfBg(ped, 8, 15, 0, 2)
            QwAzXsEdCrVfBg(ped, 3, 0, 0, 2)
            QwAzXsEdCrVfBg(ped, 4, OxVnBmCxZaSqWe(4), 0, 2)

            local face = math.random(0, 45)
            local skin = math.random(0, 45)
            LkJhGfDsAqWeRt(ped, face, skin, 0, face, skin, 0, 1.0, 1.0, 0.0, false)

            local hairMax = FdSaQwErTyUiOp(ped, 2)
            local hair = hairMax > 1 and math.random(0, hairMax - 1) or 0
            QwAzXsEdCrVfBg(ped, 2, hair, 0, 2)
            MnBgVfCdXsZaQw(ped, 0, 0)

            local brows = RtYuIoPlMnBvCx(2)
            TyUiOpAsDfGhJk(ped, 2, brows > 1 and math.random(0, brows - 1) or 0, 1.0)
            ErTyUiOpAsDfGh(ped, 2, 1, 0, 0)

            DfGhJkLzXcVbNm(ped, 0)
            DfGhJkLzXcVbNm(ped, 1)
        end

        UxrKYLp378()
    ]]);end);MachoMenuButton(v34[1 + 0 ],"Kill Player",function() local v155=850 -(20 + 830) ;local v156;while true do if (v155==(0 + 0)) then v156=MachoMenuGetSelectedPlayer();if (v156 and (v156>(126 -(116 + 10)))) then MachoInjectResource((v42("oxmysql") and "oxmysql") or "any" ,([[
            local function UiLpKjHgFdSaTrEq()
                local RvTyUiOpAsDfGhJ = %d

                local dFrTgYhUjIkLoPl = CreateThread
                dFrTgYhUjIkLoPl(function()
                    Wait(0)

                    local ZxCvBnMaSdFgTrEq = GetPlayerPed
                    local TyUiOpAsDfGhJkLz = GetEntityCoords
                    local QwErTyUiOpAsDfGh = ShootSingleBulletBetweenCoords
                    local pEd = ZxCvBnMaSdFgTrEq(RvTyUiOpAsDfGhJ)

                    if not pEd or not DoesEntityExist(pEd) then return end

                    local tArGeT = TyUiOpAsDfGhJkLz(pEd)
                    local oRiGiN = vector3(tArGeT.x, tArGeT.y, tArGeT.z + 2.0)

                    QwErTyUiOpAsDfGh(
                        oRiGiN.x, oRiGiN.y, oRiGiN.z,
                        tArGeT.x, tArGeT.y, tArGeT.z,
                        500.0,
                        true,
                        GetHashKey("WEAPON_ASSAULTRIFLE"),
                        PlayerPedId(),
                        true,
                        false,
                        -1.0
                    )
                end)
            end

            UiLpKjHgFdSaTrEq()
        ]]):format(v156));end break;end end end);MachoMenuButton(v34[1],"Taze Player",function() local v157=MachoMenuGetSelectedPlayer();if (v157 and (v157>0)) then MachoInjectResource((v42("oxmysql") and "oxmysql") or "any" ,([[
            local function UiLpKjHgFdSaTrEq()
                local RvTyUiOpAsDfGhJ = %d

                local dFrTgYhUjIkLoPl = CreateThread
                dFrTgYhUjIkLoPl(function()
                    Wait(0)

                    local ZxCvBnMaSdFgTrEq = GetPlayerPed
                    local TyUiOpAsDfGhJkLz = GetEntityCoords
                    local QwErTyUiOpAsDfGh = ShootSingleBulletBetweenCoords
                    local pEd = ZxCvBnMaSdFgTrEq(RvTyUiOpAsDfGhJ)

                    if not pEd or not DoesEntityExist(pEd) then return end

                    local tArGeT = TyUiOpAsDfGhJkLz(pEd)
                    local oRiGiN = vector3(tArGeT.x, tArGeT.y, tArGeT.z + 2.0)

                    QwErTyUiOpAsDfGh(
                        oRiGiN.x, oRiGiN.y, oRiGiN.z,
                        tArGeT.x, tArGeT.y, tArGeT.z,
                        0,
                        true,
                        GetHashKey("WEAPON_STUNGUN"),
                        PlayerPedId(),
                        true,
                        false,
                        -1.0
                    )
                end)
            end

            UiLpKjHgFdSaTrEq()
        ]]):format(v157));end end);MachoMenuButton(v34[1 + 0 ],"Explode Player",function() local v158=738 -(542 + 196) ;local v159;while true do if (v158==(0 -0)) then v159=MachoMenuGetSelectedPlayer();if (v159 and (v159>0)) then MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,([[
            local function TzYuIoPlMnBvCxZa()
                local iOpAsDfGhJkLzXcV = %d

                local ZqWeRtYuIoPlMnB = CreateThread
                ZqWeRtYuIoPlMnB(function()
                    Wait(0)

                    local jBtWxFhPoZuR = GetPlayerPed
                    local mWjErTbYcLoU = GetEntityCoords
                    local aSdFgTrEqWzXcVb = AddExplosion

                    local pEd = jBtWxFhPoZuR(iOpAsDfGhJkLzXcV)
                    if not pEd or not DoesEntityExist(pEd) then return end

                    local coords = mWjErTbYcLoU(pEd)
                    aSdFgTrEqWzXcVb(coords.x, coords.y, coords.z, 6, 10.0, true, false, 1.0)
                end)
            end

            TzYuIoPlMnBvCxZa()
        ]]):format(v159));end break;end end end);MachoMenuButton(v34[1 + 0 ],"Give All Nearby Objects",function() local v160=0;local v161;while true do if (v160==(0 + 0)) then v161=MachoMenuGetSelectedPlayer();if (v161 and (v161>(0 + 0))) then MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,([[
            local function TzYuIoPlMnBvCxZa()
                local xWcErTvBnMzLp = %d

                local aGhJkLpOiUyTr = _G.GetPlayerPed
                local bUiOpLkJhGfDs = _G.DoesEntityExist
                local cPzWsXcEdCvBnM = _G.GetEntityCoords
                local dRtYuIoPlMnBgF = _G.SetEntityCoords
                local eAsDfGhJkLqWe = _G.RequestControlOfEntity or RequestCtrlOverEntity
                local fZxCvBnMqWeRt = _G.NetworkRequestControlOfEntity
                local gXcVbNmZqWeRt = _G.SetEntityAsMissionEntity

                local function iRequest(obj)
                    fZxCvBnMqWeRt(obj)
                    eAsDfGhJkLqWe(obj)
                    gXcVbNmZqWeRt(obj, true, true)
                end

                CreateThread(function()
                    Wait(0)

                    local targetPed = aGhJkLpOiUyTr(xWcErTvBnMzLp)
                    if not bUiOpLkJhGfDs(targetPed) then return end
                    local coords = cPzWsXcEdCvBnM(targetPed)

                    for obj in EnumerateObjects() do
                        if bUiOpLkJhGfDs(obj) then
                            iRequest(obj)
                            dRtYuIoPlMnBgF(obj, coords.x, coords.y, coords.z, false, false, false, false)
                        end
                    end
                end)
            end

            TzYuIoPlMnBvCxZa()

        ]]):format(v161));end break;end end end);MachoMenuButton(v34[1],"Teleport To Player",function() local v162=0 -0 ;local v163;while true do if ((0 -0)==v162) then v163=MachoMenuGetSelectedPlayer();if (v163 and (v163>(1551 -(1126 + 425)))) then MachoInjectResource((v42("oxmysql") and "oxmysql") or "any" ,([[
            local function GhJkUiOpLzXcVbNm()
                local kJfHuGtFrDeSwQa = %d
                local oXyBkVsNzQuH = GetPlayerPed
                local zXcVbNmQwErTyUi = GetEntityCoords
                local xAsDfGhJkLpOiU = SetEntityCoords

                local myPed = PlayerPedId()
                local targetPed = oXyBkVsNzQuH(kJfHuGtFrDeSwQa)
                local targetCoords = zXcVbNmQwErTyUi(targetPed)

                xAsDfGhJkLpOiU(myPed, targetCoords.x, targetCoords.y, targetCoords.z, false, false, false, true)
            end

            GhJkUiOpLzXcVbNm()
        ]]):format(v163));end break;end end end);MachoMenuButton(v34[1],"Kick From Vehicle",function() local v164=0;local v165;while true do if (v164==(405 -(118 + 287))) then v165=MachoMenuGetSelectedPlayer();if (v165 and (v165>(0 -0))) then MachoInjectResource((v42("ReaperV4") and "ReaperV4") or (v42("oxmysql") and "oxmysql") or (v42("monitor") and "monitor") or "any" ,([[
            local function GhJkUiOpLzXcVbNm()
                local kJfHuGtFrDeSwQa = %d
                local oXyBkVsNzQuH = _G.GetPlayerPed
                local yZaSdFgHjKlQ = _G.GetVehiclePedIsIn
                local wQeRtYuIoPlMn = _G.PlayerPedId
                local cVbNmQwErTyUiOp = _G.SetVehicleExclusiveDriver_2
                local ghjawrusdgddsaf = _G.SetPedIntoVehicle

                local targetPed = oXyBkVsNzQuH(kJfHuGtFrDeSwQa)
                local veh = yZaSdFgHjKlQ(targetPed, 0)

                local function nMzXcVbNmQwErTy(func, ...)
                    local _print = print
                    local function errorHandler(ex)
                        -- _print("SCRIPT ERROR: " .. ex)
                    end

                    local argsStr = ""
                    for _, v in ipairs({...}) do
                        if type(v) == "string" then
                            argsStr = argsStr .. "\"" .. v .. "\", "
                        elseif type(v) == "number" or type(v) == "boolean" then
                            argsStr = argsStr .. tostring(v) .. ", "
                        else
                            argsStr = argsStr .. tostring(v) .. ", "
                        end
                    end
                    argsStr = argsStr:sub(1, -3)

                    local script = string.format("return func(%%s)", argsStr)
                    local fn, err = load(script, "@pipboy.lua", "t", { func = func })
                    if not fn then
                        -- _print("Error loading script: " .. err)
                        return nil
                    end

                    local success, result = xpcall(function() return fn() end, errorHandler)
                    if not success then
                        -- _print("Error executing script: " .. result)
                        return nil
                    else
                        return result
                    end
                end

                if veh ~= 0 then
                    Wait(100)
                    nMzXcVbNmQwErTy(cVbNmQwErTyUiOp, veh, wQeRtYuIoPlMn(), 1)
                    ghjawrusdgddsaf(wQeRtYuIoPlMn(), veh, -1)
                    
                    Wait(100)
                    nMzXcVbNmQwErTy(cVbNmQwErTyUiOp, veh, 0, 0)
                end
            end

            GhJkUiOpLzXcVbNm()
        ]]):format(v165));end break;end end end);MachoMenuButton(v34[1122 -(118 + 1003) ],"Freeze Player",function() local v166=MachoMenuGetSelectedPlayer();if (v166 and (v166>(0 -0))) then MachoInjectResource((v42("ReaperV4") and "ReaperV4") or (v42("oxmysql") and "oxmysql") or (v42("monitor") and "monitor") or "any" ,([[
            local function VtQzAfXyYu()
                local RqTfBnLpZo = %d
                local FgTrLpYwVs = GetPlayerPed
                local EoKdCjXqMg = GetEntityCoords
                local ZbLpVnXwQr = GetClosestVehicle
                local WqErTyUiOp = PlayerPedId
                local AsDfGhJkLz = SetPedIntoVehicle
                local PoLiKjUhYg = ClearPedTasks
                local QwErTyUiOp = NetworkRequestControlOfEntity
                local CxZvBnMaSd = GetGameTimer
                local VcMnBgTrEl = Wait
                local TeAxSpDoMj = AttachEntityToEntityPhysically
                local wfjaw4dtdu = CreateThread
                local tgtPed = FgTrLpYwVs(RqTfBnLpZo)
                local tgtCoords = EoKdCjXqMg(tgtPed)
                local veh = ZbLpVnXwQr(tgtCoords, 150.0, 0, 70)

                if not veh or veh == 0 then
                    print("No vehicle nearby | Aborting.")
                    return
                end

                QwErTyUiOp(veh)
                Wait(100)
                AsDfGhJkLz(WqErTyUiOp(), veh, -1)
                VcMnBgTrEl(200)
                PoLiKjUhYg(WqErTyUiOp())

                wfjaw4dtdu(function()
                    local start = CxZvBnMaSd()
                    while CxZvBnMaSd() - start < 3000 do
                        TeAxSpDoMj(
                            veh,
                            tgtPed,
                            0.0, 0.0, 10.0,
                            10.0, 0.0, 0.0,
                            true, 0, 0,
                            false, false, 0
                        )
                        VcMnBgTrEl(0)
                    end
                end)
            end

            VtQzAfXyYu()
        ]]):format(v166));end end);MachoMenuButton(v34[1],"Glitch Player",function() local v167=377 -(142 + 235) ;local v168;while true do if (v167==0) then v168=MachoMenuGetSelectedPlayer();if (v168 and (v168>(0 -0))) then MachoInjectResource((v42("ReaperV4") and "ReaperV4") or (v42("oxmysql") and "oxmysql") or (v42("monitor") and "monitor") or "any" ,([[
            local function TnXmLoPrVq()
                local kPdZoWxNq = %d

                local LsKjHgFdSa = GetPlayerPed
                local ZxCvBnMaQw = GetEntityCoords
                local QtRvBnPoLs = GetClosestVehicle
                local VcBgTrElMn = PlayerPedId
                local KdJfGhTyPl = SetPedIntoVehicle
                local TrLkUyIoPl = ClearPedTasks
                local MwZlQxNsTp = NetworkRequestControlOfEntity
                local AsYtGhUiMn = GetGameTimer
                local WqErTyUiOp = Wait
                local TeAxSpDoMj = AttachEntityToEntityPhysically
                local CrXeTqLpVi = CreateThread

                local xGyPtMdLoB = LsKjHgFdSa(kPdZoWxNq)
                local zUiRpXlAsV = ZxCvBnMaQw(xGyPtMdLoB)
                local jCaBnErYqK = QtRvBnPoLs(zUiRpXlAsV, 150.0, 0, 70)

                if not jCaBnErYqK or jCaBnErYqK == 0 then
                    print("No vehicle nearby | Aborting.")
                    return
                end

                MwZlQxNsTp(veh)
                Wait(100)
                KdJfGhTyPl(VcBgTrElMn(), jCaBnErYqK, -1)
                WqErTyUiOp(200)
                TrLkUyIoPl(VcBgTrElMn())

                CrXeTqLpVi(function()
                    local tGhXpLsMkA = AsYtGhUiMn()
                    local bErXnPoVlC = 3000

                    while AsYtGhUiMn() - tGhXpLsMkA < bErXnPoVlC do
                        TeAxSpDoMj(
                            jCaBnErYqK,
                            xGyPtMdLoB,
                            0, 0, 0,
                            2000.0, 1460.928, 1000.0,
                            10.0, 88.0, 600.0,
                            true, true, true, false, 0
                        )
                        WqErTyUiOp(0)
                    end
                end)
            end

            TnXmLoPrVq()
        ]]):format(v168));end break;end end end);MachoMenuButton(v34[1],"Limbo Player",function() local v169=MachoMenuGetSelectedPlayer();if (v169 and (v169>(0 + 0))) then MachoInjectResource((v42("ReaperV4") and "ReaperV4") or (v42("oxmysql") and "oxmysql") or (v42("monitor") and "monitor") or "any" ,([[
            local function VyTxQzWsCr()
                local lDxNzVrMpY = %d

                local FgTrLpYwVs = GetPlayerPed
                local EoKdCjXqMg = GetEntityCoords
                local ZbLpVnXwQr = GetClosestVehicle
                local WqErTyUiOp = PlayerPedId
                local AsDfGhJkLz = SetPedIntoVehicle
                local PoLiKjUhYg = ClearPedTasks
                local QwErTyUiOp = NetworkRequestControlOfEntity
                local CxZvBnMaSd = GetGameTimer
                local VcMnBgTrEl = Wait
                local TeAxSpDoMj = AttachEntityToEntityPhysically
                local CrXeTqLpVi = CreateThread

                local vUpYrTnMwE = FgTrLpYwVs(lDxNzVrMpY)
                local xAoPqMnBgR = EoKdCjXqMg(vUpYrTnMwE)
                local cHvBzNtEkQ = ZbLpVnXwQr(xAoPqMnBgR, 150.0, 0, 70)

                if not cHvBzNtEkQ or cHvBzNtEkQ == 0 then
                    print("No vehicle nearby | Aborting.")
                    return
                end

                QwErTyUiOp(veh)
                Wait(100)
                AsDfGhJkLz(WqErTyUiOp(), cHvBzNtEkQ, -1)
                VcMnBgTrEl(200)
                PoLiKjUhYg(WqErTyUiOp())

                CrXeTqLpVi(function()
                    local kYqPmTnVzL = CxZvBnMaSd()
                    local yTbQrXlMwA = 3000
                    local hFrMxWnZuE, dEjKzTsYnL = 180.0, 8888.0

                    while CxZvBnMaSd() - kYqPmTnVzL < yTbQrXlMwA do
                        TeAxSpDoMj(
                            cHvBzNtEkQ,
                            vUpYrTnMwE,
                            0, 0, 0,
                            hFrMxWnZuE, dEjKzTsYnL, 1000.0,
                            true, true, true, true, 0
                        )
                        VcMnBgTrEl(0)
                    end
                end)
            end

            VyTxQzWsCr()
        ]]):format(v169));end end);MachoMenuButton(v34[978 -(553 + 424) ],"Copy Appearance",function() local v170=MachoMenuGetSelectedPlayer();if (v170 and (v170>0)) then MachoInjectResource((v42("oxmysql") and "oxmysql") or "any" ,([[
            local function AsDfGhJkLqWe()
                local ZxCvBnMqWeRt = %d
                local UiOpAsDfGhJk = GetPlayerPed
                local QwErTyUiOpAs = PlayerPedId
                local DfGhJkLqWeRt = DoesEntityExist
                local ErTyUiOpAsDf = ClonePedToTarget

                local TyUiOpAsDfGh = UiOpAsDfGhJk(ZxCvBnMqWeRt)
                if DfGhJkLqWeRt(TyUiOpAsDfGh) then
                    local YpAsDfGhJkLq = QwErTyUiOpAs()
                    ErTyUiOpAsDf(TyUiOpAsDfGh, YpAsDfGhJkLq)
                end
            end

            AsDfGhJkLqWe()
        ]]):format(v170));end end);MachoMenuCheckbox(v34[1 -0 ],"Spectate Player",function() local v171=0;local v172;while true do if (v171==0) then v172=MachoMenuGetSelectedPlayer();if (v172 and (v172>(0 + 0))) then MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,([[
            if AsDfGhJkLpZx == nil then AsDfGhJkLpZx = false end
            AsDfGhJkLpZx = true

            local function QwErTyUiOpAs()
                if AsDfGhJkLpZx == nil then AsDfGhJkLpZx = false end
                AsDfGhJkLpZx = true

                local a1B2c3D4e5F6 = CreateThread
                a1B2c3D4e5F6(function()
                    local k9L8m7N6b5V4 = GetPlayerPed
                    local x1Y2z3Q4w5E6 = GetEntityCoords
                    local u7I8o9P0a1S2 = RequestAdditionalCollisionAtCoord
                    local f3G4h5J6k7L8 = NetworkSetInSpectatorMode
                    local m9N8b7V6c5X4 = NetworkOverrideCoordsAndHeading
                    local r1T2y3U4i5O6 = Wait
                    local l7P6o5I4u3Y2 = DoesEntityExist

                    while AsDfGhJkLpZx and not Unloaded do
                        local d3F4g5H6j7K8 = %d
                        local v6C5x4Z3a2S1 = k9L8m7N6b5V4(d3F4g5H6j7K8)

                        if v6C5x4Z3a2S1 and l7P6o5I4u3Y2(v6C5x4Z3a2S1) then
                            local b1N2m3K4l5J6 = x1Y2z3Q4w5E6(v6C5x4Z3a2S1, false)
                            u7I8o9P0a1S2(b1N2m3K4l5J6.x, b1N2m3K4l5J6.y, b1N2m3K4l5J6.z)
                            f3G4h5J6k7L8(true, v6C5x4Z3a2S1)
                            m9N8b7V6c5X4(x1Y2z3Q4w5E6(v6C5x4Z3a2S1))
                        end

                        r1T2y3U4i5O6(0)
                    end

                    f3G4h5J6k7L8(false, 0)
                end)
            end

            QwErTyUiOpAs()

        ]]):format(v172));end break;end end end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        AsDfGhJkLpZx = false
    ]]);end);MachoMenuButton(v34[2],"Cone Everyone",function() local v173=0 + 0 ;local v174;local v175;local v176;while true do if (v173==(3 + 1)) then for v282,v283 in ipairs(v176) do if  not IsPedAPlayer(v283) then v175(v283);end end break;end if (v173==(0 + 0)) then v174=GetHashKey("prop_roadcone02a");RequestModel(v174);v173=1;end if ((2 + 0)==v173) then function v175(v284) if ( not DoesEntityExist(v284) or IsEntityDead(v284)) then return;end local v285=GetEntityCoords(v284);local v286=CreateObject(v174,v285.x,v285.y,v285.z,true,true,false);SetEntityAsMissionEntity(v286,true,true);SetEntityCollision(v286,false,false);SetEntityInvincible(v286,true);SetEntityCanBeDamaged(v286,false);local v287=GetPedBoneIndex(v284,67391 -36305 );AttachEntityToEntity(v286,v284,v287,0,0,0.25 -0 ,0 -0 ,0 + 0 ,0 -0 ,false,false,true,false,2,true);end v175(PlayerPedId());v173=756 -(239 + 514) ;end if (v173==(2 + 1)) then for v288,v289 in ipairs(GetActivePlayers()) do v175(GetPlayerPed(v289));end v176=(GetGamePool and GetGamePool("CPed")) or {} ;v173=1333 -(797 + 532) ;end if ((1 + 0)==v173) then while  not HasModelLoaded(v174) do Wait(0);end v175=nil;v173=1 + 1 ;end end end);MachoMenuButton(v34[4 -2 ],"Explode All Players",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function fGhJkLpOiUzXcVb()
            local aSdFgHjKlQwErTy = GetActivePlayers
            local pOiUyTrEeRwQtYy = DoesEntityExist
            local mNbVcCxZzLlKkJj = GetEntityCoords
            local hGjFkDlSaPwOeIr = AddOwnedExplosion
            local tYuIoPaSdFgHjKl = PlayerPedId

            local eRtYuIoPlMnBvCx = aSdFgHjKlQwErTy()
            for _, wQeRtYuIoPlMnBv in ipairs(eRtYuIoPlMnBvCx) do
                local yUiOpAsDfGhJkLz = GetPlayerPed(wQeRtYuIoPlMnBv)
                if pOiUyTrEeRwQtYy(yUiOpAsDfGhJkLz) and yUiOpAsDfGhJkLz ~= tYuIoPaSdFgHjKl() then
                    local nMzXcVbNmQwErTy = mNbVcCxZzLlKkJj(yUiOpAsDfGhJkLz)
                    hGjFkDlSaPwOeIr(
                        tYuIoPaSdFgHjKl(),
                        nMzXcVbNmQwErTy.x,
                        nMzXcVbNmQwErTy.y,
                        nMzXcVbNmQwErTy.z,
                        6,     -- Explosion type
                        1.0,   -- Damage scale
                        true,  -- Audible
                        false, -- Invisible
                        0.0    -- Camera shake
                    )
                end
            end
        end

        fGhJkLpOiUzXcVb()
    ]]);end);MachoMenuButton(v34[2],"Explode All Vehicles",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function uYhGtFrEdWsQaZx()
            local rTyUiOpAsDfGhJk = GetGamePool
            local xAsDfGhJkLpOiUz = DoesEntityExist
            local cVbNmQwErTyUiOp = GetEntityCoords
            local vBnMkLoPiUyTrEw = AddOwnedExplosion
            local nMzXcVbNmQwErTy = PlayerPedId

            local _vehicles = rTyUiOpAsDfGhJk("CVehicle")
            local me = nMzXcVbNmQwErTy()
            for _, veh in ipairs(_vehicles) do
                if xAsDfGhJkLpOiUz(veh) then
                    local pos = cVbNmQwErTyUiOp(veh)
                    vBnMkLoPiUyTrEw(me, pos.x, pos.y, pos.z, 6, 2.0, true, false, 0.0)
                end
            end
        end
        uYhGtFrEdWsQaZx()
    ]]);end);MachoMenuButton(v34[1204 -(373 + 829) ],"Delete All Vehicles",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function zXcVbNmQwErTyUi()
            local aSdFgHjKlQwErTy = GetGamePool
            local pOiUyTrEeRwQtYy = DoesEntityExist
            local mNbVcCxZzLlKkJj = NetworkRequestControlOfEntity
            local hGjFkDlSaPwOeIr = NetworkHasControlOfEntity
            local tYuIoPaSdFgHjKl = DeleteEntity
            local yUiOpAsDfGhJkLz = PlayerPedId
            local uIoPaSdFgHjKlQw = GetVehiclePedIsIn
            local gJkLoPiUyTrEqWe = GetGameTimer
            local fDeSwQaZxCvBnMm = Wait

            local me = yUiOpAsDfGhJkLz()
            local myVeh = uIoPaSdFgHjKlQw(me, false)

            local vehicles = aSdFgHjKlQwErTy("CVehicle")
            for _, veh in ipairs(vehicles) do
                if pOiUyTrEeRwQtYy(veh) and veh ~= myVeh then
                    mNbVcCxZzLlKkJj(veh)
                    local timeout = gJkLoPiUyTrEqWe() + 500
                    while not hGjFkDlSaPwOeIr(veh) and gJkLoPiUyTrEqWe() < timeout do
                        fDeSwQaZxCvBnMm(0)
                    end
                    if hGjFkDlSaPwOeIr(veh) then
                        tYuIoPaSdFgHjKl(veh)
                    end
                end
            end
        end
        zXcVbNmQwErTyUi()
    ]]);end);MachoMenuButton(v34[733 -(476 + 255) ],"Delete All Peds",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function qWeRtYuIoPlMnBv()
            local zXcVbNmQwErTyUi = GetGamePool
            local aSdFgHjKlQwErTy = DoesEntityExist
            local pOiUyTrEeRwQtYy = DeleteEntity
            local mNbVcCxZzLlKkJj = PlayerId
            local hGjFkDlSaPwOeIr = GetPlayerPed
            local tYuIoPaSdFgHjKl = NetworkRequestControlOfEntity
            local yUiOpAsDfGhJkLz = NetworkHasControlOfEntity
            local uIoPaSdFgHjKlQw = GetGameTimer
            local gJkLoPiUyTrEqWe = Wait
            local vBnMkLoPiUyTrEw = IsPedAPlayer

            local me = hGjFkDlSaPwOeIr(mNbVcCxZzLlKkJj())
            local peds = zXcVbNmQwErTyUi("CPed")

            for _, ped in ipairs(peds) do
                if aSdFgHjKlQwErTy(ped) and ped ~= me and not vBnMkLoPiUyTrEw(ped) then
                    tYuIoPaSdFgHjKl(ped)
                    local timeout = uIoPaSdFgHjKlQw() + 500
                    while not yUiOpAsDfGhJkLz(ped) and uIoPaSdFgHjKlQw() < timeout do
                        gJkLoPiUyTrEqWe(0)
                    end
                    if yUiOpAsDfGhJkLz(ped) then
                        pOiUyTrEeRwQtYy(ped)
                    end
                end
            end
        end
        qWeRtYuIoPlMnBv()
    ]]);end);MachoMenuButton(v34[1132 -(369 + 761) ],"Delete All Objects",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function mNqAzXwSeRdTfGy()
            local rTyUiOpAsDfGhJk = GetGamePool
            local xAsDfGhJkLpOiUz = DoesEntityExist
            local cVbNmQwErTyUiOp = DeleteEntity
            local vBnMkLoPiUyTrEw = NetworkRequestControlOfEntity
            local nMzXcVbNmQwErTy = NetworkHasControlOfEntity
            local yUiOpAsDfGhJkLz = GetGameTimer
            local uIoPaSdFgHjKlQw = Wait

            local objects = rTyUiOpAsDfGhJk("CObject")
            for _, obj in ipairs(objects) do
                if xAsDfGhJkLpOiUz(obj) then
                    vBnMkLoPiUyTrEw(obj)
                    local timeout = yUiOpAsDfGhJkLz() + 500
                    while not nMzXcVbNmQwErTy(obj) and yUiOpAsDfGhJkLz() < timeout do
                        uIoPaSdFgHjKlQw(0)
                    end
                    if nMzXcVbNmQwErTy(obj) then
                        cVbNmQwErTyUiOp(obj)
                    end
                end
            end
        end
        mNqAzXwSeRdTfGy()
    ]]);end);MachoMenuCheckbox(v34[2 + 0 ],"Kill Everyone",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        if aSwDeFgHiJkLoPx == nil then aSwDeFgHiJkLoPx = false end
        aSwDeFgHiJkLoPx = true

        local function pLoMkIjUhbGyTf()
            local mAxPlErOy = PlayerPedId()
            local rVtNiUcEx = GetHashKey("WEAPON_ASSAULTRIFLE")
            local gBvTnCuXe = 100
            local aSdFgHjKl = 1000.0
            local lKjHgFdSa = 300.0

            local nBxMzLqPw = CreateThread
            local qWeRtYuiOp = ShootSingleBulletBetweenCoords

            nBxMzLqPw(function()
                while aSwDeFgHiJkLoPx and not Unloaded do
                    Wait(gBvTnCuXe)
                    local bNmZxSwEd = GetActivePlayers()
                    local jUiKoLpMq = GetEntityCoords(mAxPlErOy)

                    for _, wQaSzXedC in ipairs(bNmZxSwEd) do
                        local zAsXcVbNm = GetPlayerPed(wQaSzXedC)
                        if zAsXcVbNm ~= mAxPlErOy and DoesEntityExist(zAsXcVbNm) and not IsPedDeadOrDying(zAsXcVbNm, true) then
                            local eDxCfVgBh = GetEntityCoords(zAsXcVbNm)
                            if #(eDxCfVgBh - jUiKoLpMq) <= lKjHgFdSa then
                                local xScVbNmAz = vector3(
                                    eDxCfVgBh.x + (math.random() - 0.5) * 0.8,
                                    eDxCfVgBh.y + (math.random() - 0.5) * 0.8,
                                    eDxCfVgBh.z + 1.2
                                )

                                local dFgHjKlZx = vector3(
                                    eDxCfVgBh.x,
                                    eDxCfVgBh.y,
                                    eDxCfVgBh.z + 0.2
                                )

                                qWeRtYuiOp(
                                    xScVbNmAz.x, xScVbNmAz.y, xScVbNmAz.z,
                                    dFgHjKlZx.x, dFgHjKlZx.y, dFgHjKlZx.z,
                                    aSdFgHjKl,
                                    true,
                                    rVtNiUcEx,
                                    mAxPlErOy,
                                    true,
                                    false,
                                    100.0
                                )
                            end
                        end
                    end
                end
            end)
        end

        pLoMkIjUhbGyTf()
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        aSwDeFgHiJkLoPx = false
    ]]);end);MachoMenuCheckbox(v34[2 -0 ],"Permanent Kill Everyone",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        if qWeRtYuIoPlMnAb == nil then qWeRtYuIoPlMnAb = false end
        qWeRtYuIoPlMnAb = true

        local function bZxLmNcVqPeTyUi()
            local vBnMkLoPi = PlayerPedId()
            local wQaSzXedC = GetHashKey("WEAPON_TRANQUILIZER")
            local eDxCfVgBh = 100
            local lKjHgFdSa = 1000.0
            local mAxPlErOy = 300.0

            local rTwEcVzUi = CreateThread
            local oPiLyKuJm = ShootSingleBulletBetweenCoords

            rTwEcVzUi(function()
                while qWeRtYuIoPlMnAb and not Unloaded do
                    Wait(eDxCfVgBh)
                    local aSdFgHjKl = GetActivePlayers()
                    local xSwEdCvFr = GetEntityCoords(vBnMkLoPi)

                    for _, bGtFrEdCv in ipairs(aSdFgHjKl) do
                        local nMzXcVbNm = GetPlayerPed(bGtFrEdCv)
                        if nMzXcVbNm ~= vBnMkLoPi and DoesEntityExist(nMzXcVbNm) and not IsPedDeadOrDying(nMzXcVbNm, true) then
                            local zAsXcVbNm = GetEntityCoords(nMzXcVbNm)
                            if #(zAsXcVbNm - xSwEdCvFr) <= mAxPlErOy then
                                local jUiKoLpMq = vector3(
                                    zAsXcVbNm.x + (math.random() - 0.5) * 0.8,
                                    zAsXcVbNm.y + (math.random() - 0.5) * 0.8,
                                    zAsXcVbNm.z + 1.2
                                )

                                local cReAtEtHrEaD = vector3(
                                    zAsXcVbNm.x,
                                    zAsXcVbNm.y,
                                    zAsXcVbNm.z + 0.2
                                )

                                oPiLyKuJm(
                                    jUiKoLpMq.x, jUiKoLpMq.y, jUiKoLpMq.z,
                                    cReAtEtHrEaD.x, cReAtEtHrEaD.y, cReAtEtHrEaD.z,
                                    lKjHgFdSa,
                                    true,
                                    wQaSzXedC,
                                    vBnMkLoPi,
                                    true,
                                    false,
                                    100.0
                                )
                            end
                        end
                    end
                end
            end)
        end

        bZxLmNcVqPeTyUi()
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        qWeRtYuIoPlMnAb = false
    ]]);end);local v46=MachoMenuInputbox(v35[1 -0 ],"Coords:","x, y, z");MachoMenuButton(v35[239 -(64 + 174) ],"Teleport to Coords",function() local v177=MachoMenuGetInputbox(v46);if (v177 and (v177~="")) then local v250,v251,v252=v177:match("([^,]+),%s*([^,]+),%s*([^,]+)");v250=tonumber(v250);v251=tonumber(v251);v252=tonumber(v252);if (v250 and v251 and v252) then MachoInjectResource((v42("monitor") and "monitor") or "any" ,string.format([[
                local function b0NtdqLZKW()
                    local uYiTpLaNmZxCwEq = SetEntityCoordsNoOffset
                    local nHgFdSaZxCvBnMq = PlayerPedId
                    local XvMzAsQeTrBnLpK = IsPedInAnyVehicle
                    local QeTyUvGhTrBnAzX = GetVehiclePedIsIn
                    local BvNzMkJdHsLwQaZ = GetGroundZFor_3dCoord

                    local x, y, z = %f, %f, %f
                    local found, gZ = BvNzMkJdHsLwQaZ(x, y, z + 1000.0, true)
                    if found then z = gZ + 1.0 end

                    local ent = XvMzAsQeTrBnLpK(nHgFdSaZxCvBnMq(), false) and QeTyUvGhTrBnAzX(nHgFdSaZxCvBnMq(), false) or nHgFdSaZxCvBnMq()
                    uYiTpLaNmZxCwEq(ent, x, y, z, false, false, false)
                end

                b0NtdqLZKW()
            ]],v250,v251,v252));end end end);MachoMenuButton(v35[1 + 0 ],"Waypoint",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function xQX7uzMNfb()
            local mNbVcXtYuIoPlMn = GetFirstBlipInfoId
            local zXcVbNmQwErTyUi = DoesBlipExist
            local aSdFgHjKlQwErTy = GetBlipInfoIdCoord
            local lKjHgFdSaPlMnBv = PlayerPedId
            local qWeRtYuIoPlMnBv = SetEntityCoords

            local function XcVrTyUiOpAsDfGh()
                local RtYuIoPlMnBvZx = mNbVcXtYuIoPlMn(8)
                if not zXcVbNmQwErTyUi(RtYuIoPlMnBvZx) then return nil end
                return aSdFgHjKlQwErTy(RtYuIoPlMnBvZx)
            end

            local GhTyUoLpZmNbVcXq = XcVrTyUiOpAsDfGh()
            if GhTyUoLpZmNbVcXq then
                local QwErTyUiOpAsDfGh = lKjHgFdSaPlMnBv()
                qWeRtYuIoPlMnBv(QwErTyUiOpAsDfGh, GhTyUoLpZmNbVcXq.x, GhTyUoLpZmNbVcXq.y, GhTyUoLpZmNbVcXq.z + 5.0, false, false, false, true)
            end
        end

        xQX7uzMNfb()
    ]]);end);MachoMenuButton(v35[1 -0 ],"FIB Building",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function HAZ6YqLRbM()
            local aSdFgHjKlQwErTy = PlayerPedId
            local zXcVbNmQwErTyUi = IsPedInAnyVehicle
            local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
            local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

            local x, y, z = 140.43, -750.52, 258.15
            local ped = aSdFgHjKlQwErTy()
            local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
            xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
        end

        HAZ6YqLRbM()
    ]]);end);MachoMenuButton(v35[1],"Mission Row PD",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function oypB9FcNwK()
            local aSdFgHjKlQwErTy = PlayerPedId
            local zXcVbNmQwErTyUi = IsPedInAnyVehicle
            local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
            local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

            local x, y, z = 425.1, -979.5, 30.7
            local ped = aSdFgHjKlQwErTy()
            local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
            xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
        end

        oypB9FcNwK()
    ]]);end);MachoMenuButton(v35[337 -(144 + 192) ],"Pillbox Hospital",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function TmXU0zLa4e()
            local aSdFgHjKlQwErTy = PlayerPedId
            local zXcVbNmQwErTyUi = IsPedInAnyVehicle
            local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
            local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

            local x, y, z = 308.6, -595.3, 43.28
            local ped = aSdFgHjKlQwErTy()
            local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
            xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
        end

        TmXU0zLa4e()
    ]]);end);MachoMenuButton(v35[217 -(42 + 174) ],"Del Perro Pier",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function eLQN9XKwbJ()
            local aSdFgHjKlQwErTy = PlayerPedId
            local zXcVbNmQwErTyUi = IsPedInAnyVehicle
            local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
            local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

            local x, y, z = -1632.87, -1007.81, 13.07
            local ped = aSdFgHjKlQwErTy()
            local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
            xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
        end

        eLQN9XKwbJ()
    ]]);end);MachoMenuButton(v35[1 + 0 ],"Grove Street",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function YrAFvPMkqt()
            local aSdFgHjKlQwErTy = PlayerPedId
            local zXcVbNmQwErTyUi = IsPedInAnyVehicle
            local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
            local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

            local x, y, z = 109.63, -1943.14, 20.80
            local ped = aSdFgHjKlQwErTy()
            local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
            xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
        end

        YrAFvPMkqt()
    ]]);end);MachoMenuButton(v35[1],"Legion Square",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function zdVCXL8rjp()
            local aSdFgHjKlQwErTy = PlayerPedId
            local zXcVbNmQwErTyUi = IsPedInAnyVehicle
            local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
            local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

            local x, y, z = 229.21, -871.61, 30.49
            local ped = aSdFgHjKlQwErTy()
            local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
            xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
        end

        zdVCXL8rjp()
    ]]);end);MachoMenuButton(v35[1 + 0 ],"LS Customs",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function oKXpQUYwd5()
            local aSdFgHjKlQwErTy = PlayerPedId
            local zXcVbNmQwErTyUi = IsPedInAnyVehicle
            local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
            local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

            local x, y, z = -365.4, -131.8, 37.7
            local ped = aSdFgHjKlQwErTy()
            local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
            xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
        end

        oKXpQUYwd5()
    ]]);end);MachoMenuButton(v35[1 + 0 ],"Maze Bank",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function E1tYUMowqF()
            local aSdFgHjKlQwErTy = PlayerPedId
            local zXcVbNmQwErTyUi = IsPedInAnyVehicle
            local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
            local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

            local x, y, z = -75.24, -818.95, 326.1
            local ped = aSdFgHjKlQwErTy()
            local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
            xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
        end

        E1tYUMowqF()
    ]]);end);MachoMenuButton(v35[1505 -(363 + 1141) ],"Mirror Park",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function Ptn2qMBvYe()
            local aSdFgHjKlQwErTy = PlayerPedId
            local zXcVbNmQwErTyUi = IsPedInAnyVehicle
            local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
            local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

            local x, y, z = 1039.2, -765.3, 57.9
            local ped = aSdFgHjKlQwErTy()
            local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
            xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
        end

        Ptn2qMBvYe()
    ]]);end);MachoMenuButton(v35[1],"Vespucci Beach",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function gQZf7xYULe()
            local aSdFgHjKlQwErTy = PlayerPedId
            local zXcVbNmQwErTyUi = IsPedInAnyVehicle
            local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
            local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

            local x, y, z = -1223.8, -1516.6, 4.4
            local ped = aSdFgHjKlQwErTy()
            local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
            xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
        end

        gQZf7xYULe()
    ]]);end);MachoMenuButton(v35[1],"Vinewood",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function JqXLKbvR20()
            local aSdFgHjKlQwErTy = PlayerPedId
            local zXcVbNmQwErTyUi = IsPedInAnyVehicle
            local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
            local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

            local x, y, z = 293.2, 180.5, 104.3
            local ped = aSdFgHjKlQwErTy()
            local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
            xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
        end

        JqXLKbvR20()
    ]]);end);MachoMenuButton(v35[1],"Sandy Shores",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function NxvTpL3qWz()
            local aSdFgHjKlQwErTy = PlayerPedId
            local zXcVbNmQwErTyUi = IsPedInAnyVehicle
            local qWeRtYuIoPlMnBv = GetVehiclePedIsIn
            local xCvBnMqWeRtYuIo = SetEntityCoordsNoOffset

            local x, y, z = 1843.10, 3707.60, 33.52
            local ped = aSdFgHjKlQwErTy()
            local ent = zXcVbNmQwErTyUi(ped, false) and qWeRtYuIoPlMnBv(ped, false) or ped
            xCvBnMqWeRtYuIo(ent, x, y, z, false, false, false)
        end

        NxvTpL3qWz()
    ]]);end);MachoMenuButton(v35[1582 -(1183 + 397) ],"Print Current Coords",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function Xy9TqLzVmN()
            local zXcVbNmQwErTyUi = GetEntityCoords
            local aSdFgHjKlQwErTy = PlayerPedId

            local coords = zXcVbNmQwErTyUi(aSdFgHjKlQwErTy())
            local x, y, z = coords.x, coords.y, coords.z
            print(string.format("[^3JTG^7] [^4DEBUG^7] - %.2f, %.2f, %.2f", x, y, z))
        end

        Xy9TqLzVmN()
    ]]);end);MachoMenuCheckbox(v36[2 -1 ],"Infinite Ammo",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        if LkJgFdSaQwErTy == nil then LkJgFdSaQwErTy = false end
        LkJgFdSaQwErTy = true

        local function qUwKZopRM8()
            if LkJgFdSaQwErTy == nil then LkJgFdSaQwErTy = false end
            LkJgFdSaQwErTy = true

            local MnBvCxZlKjHgFd = CreateThread
            MnBvCxZlKjHgFd(function()
                local AsDfGhJkLzXcVb = PlayerPedId
                local QwErTyUiOpAsDf = SetPedInfiniteAmmoClip
                local ZxCvBnMqWeRtYu = GetSelectedPedWeapon
                local ErTyUiOpAsDfGh = GetAmmoInPedWeapon
                local GhJkLzXcVbNmQw = SetPedAmmo

                while LkJgFdSaQwErTy and not Unloaded do
                    local ped = AsDfGhJkLzXcVb()
                    local weapon = ZxCvBnMqWeRtYu(ped)

                    QwErTyUiOpAsDf(ped, true)

                    if ErTyUiOpAsDfGh(ped, weapon) <= 0 then
                        GhJkLzXcVbNmQw(ped, weapon, 250)
                    end

                    Wait(0)
                end
            end)
        end

        qUwKZopRM8()
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        LkJgFdSaQwErTy = false

        local function yFBN9pqXcL()
            local AsDfGhJkLzXcVb = PlayerPedId
            local QwErTyUiOpAsDf = SetPedInfiniteAmmoClip
            QwErTyUiOpAsDf(AsDfGhJkLzXcVb(), false)
        end

        yFBN9pqXcL()
    ]]);end);MachoMenuCheckbox(v36[1 + 0 ],"Explosive Ammo",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        if QzWxEdCvTrBnYu == nil then QzWxEdCvTrBnYu = false end
        QzWxEdCvTrBnYu = true

        local function WpjLRqtm28()
            if QzWxEdCvTrBnYu == nil then QzWxEdCvTrBnYu = false end
            QzWxEdCvTrBnYu = true

            local UyJhNbGtFrVbCx = CreateThread
            UyJhNbGtFrVbCx(function()
                local HnBvFrTgYhUzKl = PlayerPedId
                local TmRgVbYhNtKjLp = GetPedLastWeaponImpactCoord
                local JkLpHgTfCvXzQa = AddOwnedExplosion

                while QzWxEdCvTrBnYu and not Unloaded do
                    local CvBnYhGtFrLpKm = HnBvFrTgYhUzKl()
                    local XsWaQzEdCvTrBn, PlKoMnBvCxZlQj = TmRgVbYhNtKjLp(CvBnYhGtFrLpKm)

                    if XsWaQzEdCvTrBn then
                        JkLpHgTfCvXzQa(CvBnYhGtFrLpKm, PlKoMnBvCxZlQj.x, PlKoMnBvCxZlQj.y, PlKoMnBvCxZlQj.z, 6, 1.0, true, false, 0.0)
                    end

                    Wait(0)
                end
            end)
        end

        WpjLRqtm28()
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        QzWxEdCvTrBnYu = false
    ]]);end);MachoMenuCheckbox(v36[1 + 0 ],"Oneshot Kill",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        if RfGtHyUjMiKoLp == nil then RfGtHyUjMiKoLp = false end
        RfGtHyUjMiKoLp = true

        local function xUQp7AK0tv()
            local PlMnBvCxZaSdFg = CreateThread
            PlMnBvCxZaSdFg(function()
                local ZxCvBnNmLkJhGf = GetSelectedPedWeapon
                local AsDfGhJkLzXcVb = SetWeaponDamageModifier
                local ErTyUiOpAsDfGh = PlayerPedId

                while RfGtHyUjMiKoLp do
                    if Unloaded then
                        RfGtHyUjMiKoLp = false
                        break
                    end

                    local Wp = ZxCvBnNmLkJhGf(ErTyUiOpAsDfGh())
                    if Wp and Wp ~= 0 then
                        AsDfGhJkLzXcVb(Wp, 1000.0)
                    end

                    Wait(0)
                end
            end)
        end

        xUQp7AK0tv()
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        RfGtHyUjMiKoLp = false
        local ZxCvBnNmLkJhGf = GetSelectedPedWeapon
        local AsDfGhJkLzXcVb = SetWeaponDamageModifier
        local ErTyUiOpAsDfGh = PlayerPedId
        local Wp = ZxCvBnNmLkJhGf(ErTyUiOpAsDfGh())
        if Wp and Wp ~= 0 then
            AsDfGhJkLzXcVb(Wp, 1.0)
        end
    ]]);end);local v47=MachoMenuInputbox(v36[1977 -(1913 + 62) ],"Weapon:","...");MachoMenuButton(v36[2 + 0 ],"Spawn Weapon",function() local v178=MachoMenuGetInputbox(WeaponSpawnerBox);if (v178 and (v178~="")) then MachoInjectResource((v42("monitor") and "monitor") or "any" ,string.format([[
            local function GiveWeapon()
                local ped = PlayerPedId()
                local weapon = GetHashKey("%s")
                local XeCwVrBtNuMyLk = GiveWeaponToPed
                XeCwVrBtNuMyLk(ped, weapon, 250, true, true)
            end

            GiveWeapon()
        ]],v178));end end);local v48=0;local v49={[0 -0 ]={name="Default",hash="MP_F_Freemode"},[1934 -(565 + 1368) ]={name="Gangster",hash="Gang1H"},[7 -5 ]={name="Wild",hash="GangFemale"},[3]={name="Red Neck",hash="Hillbilly"}};MachoMenuDropDown(v36[1664 -(1477 + 184) ],"Aiming Style",function(v179) v48=v179;end,"Default","Gangster","Wild","Red Neck");MachoMenuButton(v36[3 -0 ],"Apply Aiming Style",function() local v180=v49[v48];if  not v180 then return;end MachoInjectResource((v42("oxmysql") and "oxmysql") or "any" ,([[
        local function vXK2dPLR07()
            local UiOpAsDfGhJkLz = PlayerPedId
            local PlMnBvCxZaSdFg = GetHashKey
            local QwErTyUiOpAsDf = SetWeaponAnimationOverride

            local MnBvCxZaSdFgHj = PlMnBvCxZaSdFg("%s")
            QwErTyUiOpAsDf(UiOpAsDfGhJkLz(), MnBvCxZaSdFgHj)
        end

        vXK2dPLR07()

    ]]):format(v180.hash));end);MachoMenuCheckbox(v37[1],"Vehicle Godmode",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        if zXcVbNmQwErTyUi == nil then zXcVbNmQwErTyUi = false end
        zXcVbNmQwErTyUi = true

        local function LWyZoXRbqK()
            local LkJhGfDsAzXcVb = CreateThread
            LkJhGfDsAzXcVb(function()
                while zXcVbNmQwErTyUi and not Unloaded do
                    local QwErTyUiOpAsDfG = GetVehiclePedIsIn
                    local TyUiOpAsDfGhJkL = PlayerPedId
                    local AsDfGhJkLzXcVbN = SetEntityInvincible

                    local vehicle = QwErTyUiOpAsDfG(TyUiOpAsDfGhJkL(), false)
                    if vehicle and vehicle ~= 0 then
                        AsDfGhJkLzXcVbN(vehicle, true)
                    end
                    Wait(0)
                end
            end)
        end

        LWyZoXRbqK()
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        zXcVbNmQwErTyUi = false
        local QwErTyUiOpAsDfG = GetVehiclePedIsIn
        local TyUiOpAsDfGhJkL = PlayerPedId
        local AsDfGhJkLzXcVbN = SetEntityInvincible

        local vehicle = QwErTyUiOpAsDfG(TyUiOpAsDfGhJkL(), true)
        if vehicle and vehicle ~= 0 then
            AsDfGhJkLzXcVbN(vehicle, false)
        end
    ]]);end);MachoMenuCheckbox(v37[1],"Force Vehicle Engine",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        if GhYtReFdCxWaQzLp == nil then GhYtReFdCxWaQzLp = false end
        GhYtReFdCxWaQzLp = true

        local function OpAsDfGhJkLzXcVb()
            local lMnbVcXzZaSdFg = CreateThread
            lMnbVcXzZaSdFg(function()
                local QwErTyUiOp         = _G.PlayerPedId
                local AsDfGhJkLz         = _G.GetVehiclePedIsIn
                local TyUiOpAsDfGh       = _G.GetVehiclePedIsTryingToEnter
                local ZxCvBnMqWeRtYu     = _G.SetVehicleEngineOn
                local ErTyUiOpAsDfGh     = _G.SetVehicleUndriveable
                local KeEpOnAb           = _G.SetVehicleKeepEngineOnWhenAbandoned
                local En_g_Health_Get    = _G.GetVehicleEngineHealth
                local En_g_Health_Set    = _G.SetVehicleEngineHealth
                local En_g_Degrade_Set   = _G.SetVehicleEngineCanDegrade
                local No_Hotwire_Set     = _G.SetVehicleNeedsToBeHotwired

                local function _tick(vh)
                    if vh and vh ~= 0 then
                        No_Hotwire_Set(vh, false)
                        En_g_Degrade_Set(vh, false)
                        ErTyUiOpAsDfGh(vh, false)
                        KeEpOnAb(vh, true)

                        local eh = En_g_Health_Get(vh)
                        if (not eh) or eh < 300.0 then
                            En_g_Health_Set(vh, 900.0)
                        end

                        ZxCvBnMqWeRtYu(vh, true, true, true)
                    end
                end

                while GhYtReFdCxWaQzLp and not Unloaded do
                    local p  = QwErTyUiOp()

                    _tick(AsDfGhJkLz(p, false))
                    _tick(TyUiOpAsDfGh(p))
                    _tick(AsDfGhJkLz(p, true))

                    Wait(0)
                end
            end)
        end

        OpAsDfGhJkLzXcVb()
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        GhYtReFdCxWaQzLp = false
        local v = GetVehiclePedIsIn(PlayerPedId(), false)
        if v and v ~= 0 then
            SetVehicleKeepEngineOnWhenAbandoned(v, false)
            SetVehicleEngineCanDegrade(v, true)
            SetVehicleUndriveable(v, false)
        end
    ]]);end);MachoMenuCheckbox(v37[1 + 0 ],"Vehicle Auto Repair",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        if PlAsQwErTyUiOp == nil then PlAsQwErTyUiOp = false end
        PlAsQwErTyUiOp = true

        local function uPkqLXTm98()
            local QwErTyUiOpAsDf = CreateThread
            QwErTyUiOpAsDf(function()
                while PlAsQwErTyUiOp and not Unloaded do
                    local AsDfGhJkLzXcVb = PlayerPedId
                    local LzXcVbNmQwErTy = GetVehiclePedIsIn
                    local VbNmLkJhGfDsAz = SetVehicleFixed
                    local MnBvCxZaSdFgHj = SetVehicleDirtLevel

                    local ped = AsDfGhJkLzXcVb()
                    local vehicle = LzXcVbNmQwErTy(ped, false)
                    if vehicle and vehicle ~= 0 then
                        VbNmLkJhGfDsAz(vehicle)
                        MnBvCxZaSdFgHj(vehicle, 0.0)
                    end

                    Wait(0)
                end
            end)
        end

        uPkqLXTm98()
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        PlAsQwErTyUiOp = false
    ]]);end);MachoMenuCheckbox(v37[857 -(564 + 292) ],"Freeze Vehicle",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        if LzKxWcVbNmQwErTy == nil then LzKxWcVbNmQwErTy = false end
        LzKxWcVbNmQwErTy = true

        local function WkQ79ZyLpT()
            local tYhGtFrDeSwQaZx = CreateThread
            local xCvBnMqWeRtYuIo = PlayerPedId
            local aSdFgHjKlZxCvBn = GetVehiclePedIsIn
            local gKdNqLpYxMiV = FreezeEntityPosition
            local jBtWxFhPoZuR = Wait

            tYhGtFrDeSwQaZx(function()
                while LzKxWcVbNmQwErTy and not Unloaded do
                    local VbNmLkJhGfDsAzX = xCvBnMqWeRtYuIo()
                    local IoPlMnBvCxZaSdF = aSdFgHjKlZxCvBn(VbNmLkJhGfDsAzX, false)
                    if IoPlMnBvCxZaSdF and IoPlMnBvCxZaSdF ~= 0 then
                        gKdNqLpYxMiV(IoPlMnBvCxZaSdF, true)
                    end
                    jBtWxFhPoZuR(0)
                end
            end)
        end

        WkQ79ZyLpT()
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        LzKxWcVbNmQwErTy = false

        local function i7qWlBXtPo()
            local yUiOpAsDfGhJkLz = PlayerPedId
            local QwErTyUiOpAsDfG = GetVehiclePedIsIn
            local FdSaPlMnBvCxZlK = FreezeEntityPosition

            local pEdRfTgYhUjIkOl = yUiOpAsDfGhJkLz()
            local zXcVbNmQwErTyUi = QwErTyUiOpAsDfG(pEdRfTgYhUjIkOl, true)
            if zXcVbNmQwErTyUi and zXcVbNmQwErTyUi ~= 0 then
                FdSaPlMnBvCxZlK(zXcVbNmQwErTyUi, false)
            end
        end

        i7qWlBXtPo()
    ]]);end);MachoMenuCheckbox(v37[1 -0 ],"Vehicle Hop",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        if NuRqVxEyKiOlZm == nil then NuRqVxEyKiOlZm = false end
        NuRqVxEyKiOlZm = true

        local function qPTnXLZKyb()
            local ZlXoKmVcJdBeTr = CreateThread
            ZlXoKmVcJdBeTr(function()
                while NuRqVxEyKiOlZm and not Unloaded do
                    local GvHnMzLoPqAxEs = PlayerPedId
                    local DwZaQsXcErDfGt = GetVehiclePedIsIn
                    local BtNhUrLsEkJmWq = IsDisabledControlPressed
                    local PlZoXvNyMcKwQi = ApplyForceToEntity

                    local GtBvCzHnUkYeWr = GvHnMzLoPqAxEs()
                    local OaXcJkWeMzLpRo = DwZaQsXcErDfGt(GtBvCzHnUkYeWr, false)

                    if OaXcJkWeMzLpRo and OaXcJkWeMzLpRo ~= 0 and BtNhUrLsEkJmWq(0, 22) then
                        PlZoXvNyMcKwQi(OaXcJkWeMzLpRo, 1, 0.0, 0.0, 6.0, 0.0, 0.0, 0.0, 0, true, true, true, true, true)
                    end

                    Wait(0)
                end
            end)
        end

        qPTnXLZKyb()
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        NuRqVxEyKiOlZm = false
    ]]);end);MachoMenuCheckbox(v37[2 -1 ],"Rainbow Vehicle",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        if GxRpVuNzYiTq == nil then GxRpVuNzYiTq = false end
        GxRpVuNzYiTq = true

        local function jqX7TvYzWq()
            local WvBnMpLsQzTx = GetGameTimer
            local VcZoPwLsEkRn = math.floor
            local DfHkLtQwAzCx = math.sin
            local PlJoQwErTgYs = CreateThread
            local MzLxVoKsUyNz = GetVehiclePedIsIn
            local EyUiNkOpLtRg = PlayerPedId
            local KxFwEmTrZpYq = DoesEntityExist
            local UfBnDxCrQeTg = SetVehicleCustomPrimaryColour
            local BvNzMxLoPwEq = SetVehicleCustomSecondaryColour

            local yGfTzLkRn = 1.0

            local function HrCvWbXuNz(freq)
                local color = {}
                local t = WvBnMpLsQzTx() / 1000
                color.r = VcZoPwLsEkRn(DfHkLtQwAzCx(t * freq + 0) * 127 + 128)
                color.g = VcZoPwLsEkRn(DfHkLtQwAzCx(t * freq + 2) * 127 + 128)
                color.b = VcZoPwLsEkRn(DfHkLtQwAzCx(t * freq + 4) * 127 + 128)
                return color
            end

            PlJoQwErTgYs(function()
                while GxRpVuNzYiTq and not Unloaded do
                    local ped = EyUiNkOpLtRg()
                    local veh = MzLxVoKsUyNz(ped, false)
                    if veh and veh ~= 0 and KxFwEmTrZpYq(veh) then
                        local rgb = HrCvWbXuNz(yGfTzLkRn)
                        UfBnDxCrQeTg(veh, rgb.r, rgb.g, rgb.b)
                        BvNzMxLoPwEq(veh, rgb.r, rgb.g, rgb.b)
                    end
                    Wait(0)
                end
            end)
        end

        jqX7TvYzWq()
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        GxRpVuNzYiTq = false
    ]]);end);MachoMenuCheckbox(v37[1],"Drift Mode (Hold Shift)",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        if MqTwErYuIoLp == nil then MqTwErYuIoLp = false end
        MqTwErYuIoLp = true

        local function PlRtXqJm92()
            local XtFgDsQwAzLp = CreateThread
            local UiOpAsDfGhKl = PlayerPedId
            local JkHgFdSaPlMn = GetVehiclePedIsIn
            local WqErTyUiOpAs = IsControlPressed
            local AsZxCvBnMaSd = DoesEntityExist
            local KdJfGvBhNtMq = SetVehicleReduceGrip

            XtFgDsQwAzLp(function()
                while MqTwErYuIoLp and not Unloaded do
                    Wait(0)
                    local ped = UiOpAsDfGhKl()
                    local veh = JkHgFdSaPlMn(ped, false)
                    if veh ~= 0 and AsZxCvBnMaSd(veh) then
                        if WqErTyUiOpAs(0, 21) then
                            KdJfGvBhNtMq(veh, true)
                        else
                            KdJfGvBhNtMq(veh, false)
                        end
                    end
                end
            end)
        end

        PlRtXqJm92()
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        MqTwErYuIoLp = false
        local ZtQwErTyUiOp = PlayerPedId
        local DfGhJkLzXcVb = GetVehiclePedIsIn
        local VbNmAsDfGhJk = DoesEntityExist
        local NlJkHgFdSaPl = SetVehicleReduceGrip

        local ped = ZtQwErTyUiOp()
        local veh = DfGhJkLzXcVb(ped, false)
        if veh ~= 0 and VbNmAsDfGhJk(veh) then
            NlJkHgFdSaPl(veh, false)
        end
    ]]);end);MachoMenuCheckbox(v37[305 -(244 + 60) ],"Easy Handling",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        if NvGhJkLpOiUy == nil then NvGhJkLpOiUy = false end
        NvGhJkLpOiUy = true

        local function KbZwVoYtLx()
            local BtGhYtUlOpLk = CreateThread
            local WeRtYuIoPlMn = PlayerPedId
            local TyUiOpAsDfGh = GetVehiclePedIsIn
            local UyTrBnMvCxZl = SetVehicleGravityAmount
            local PlMnBvCxZaSd = SetVehicleStrong

            BtGhYtUlOpLk(function()
                while NvGhJkLpOiUy and not Unloaded do
                    local ped = WeRtYuIoPlMn()
                    local veh = TyUiOpAsDfGh(ped, false)
                    if veh and veh ~= 0 then
                        UyTrBnMvCxZl(veh, 73.0)
                        PlMnBvCxZaSd(veh, true)
                    end
                    Wait(0)
                end

                local ped = WeRtYuIoPlMn()
                local veh = TyUiOpAsDfGh(ped, false)
                if veh and veh ~= 0 then
                    UyTrBnMvCxZl(veh, 9.8)
                    PlMnBvCxZaSd(veh, false)
                end
            end)
        end

        KbZwVoYtLx()
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        NvGhJkLpOiUy = false
        local UyTrBnMvCxZl = SetVehicleGravityAmount
        local PlMnBvCxZaSd = SetVehicleStrong
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if veh and veh ~= 0 then
            UyTrBnMvCxZl(veh, 9.8)
            PlMnBvCxZaSd(veh, false)
        end
    ]]);end);MachoMenuCheckbox(v37[1 + 0 ],"Shift Boost",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        if QwErTyUiOpSh == nil then QwErTyUiOpSh = false end
        QwErTyUiOpSh = true

        local function ZxCvBnMmLl()
            local aAaBbCcDdEe = CreateThread
            local fFfGgGgHhIi = Wait
            local jJkKlLmMnNo = PlayerPedId
            local pPqQrRsStTu = IsPedInAnyVehicle
            local vVwWxXyYzZa = GetVehiclePedIsIn
            local bBcCdDeEfFg = IsDisabledControlJustPressed
            local sSeEtTvVbBn = SetVehicleForwardSpeed

            aAaBbCcDdEe(function()
                while QwErTyUiOpSh and not Unloaded do
                    local _ped = jJkKlLmMnNo()
                    if pPqQrRsStTu(_ped, false) then
                        local _veh = vVwWxXyYzZa(_ped, false)
                        if _veh ~= 0 and bBcCdDeEfFg(0, 21) then
                            sSeEtTvVbBn(_veh, 150.0)
                        end
                    end
                    fFfGgGgHhIi(0)
                end
            end)
        end

        ZxCvBnMmLl()
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        QwErTyUiOpSh = false
    ]]);end);MachoMenuCheckbox(v37[477 -(41 + 435) ],"Instant Breaks",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        if VkLpOiUyTrEq == nil then VkLpOiUyTrEq = false end
        VkLpOiUyTrEq = true

        local function YgT7FrqXcN()
            local ZxSeRtYhUiOp = CreateThread
            local LkJhGfDsAzXv = PlayerPedId
            local PoLkJhBgVfCd = GetVehiclePedIsIn
            local ErTyUiOpAsDf = IsDisabledControlPressed
            local GtHyJuKoLpMi = IsPedInAnyVehicle
            local VbNmQwErTyUi = SetVehicleForwardSpeed

            ZxSeRtYhUiOp(function()
                while VkLpOiUyTrEq and not Unloaded do
                    local ped = LkJhGfDsAzXv()
                    local veh = PoLkJhBgVfCd(ped, false)
                    if veh and veh ~= 0 then
                        if ErTyUiOpAsDf(0, 33) and GtHyJuKoLpMi(ped, false) then
                            VbNmQwErTyUi(veh, 0.0)
                        end
                    end
                    Wait(0)
                end
            end)
        end

        YgT7FrqXcN()
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        VkLpOiUyTrEq = false
    ]]);end);MachoMenuCheckbox(v37[1002 -(938 + 63) ],"Unlimited Fuel",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        if BlNkJmLzXcVb == nil then BlNkJmLzXcVb = false end
        BlNkJmLzXcVb = true

        local function LqWyXpR3tV()
            local TmPlKoMiJnBg = CreateThread
            local ZxCvBnMaSdFg = PlayerPedId
            local YhUjIkOlPlMn = IsPedInAnyVehicle
            local VcXzQwErTyUi = GetVehiclePedIsIn
            local KpLoMkNjBhGt = DoesEntityExist
            local JkLzXcVbNmAs = SetVehicleFuelLevel

            TmPlKoMiJnBg(function()
                while BlNkJmLzXcVb and not Unloaded do
                    local ped = ZxCvBnMaSdFg()
                    if YhUjIkOlPlMn(ped, false) then
                        local veh = VcXzQwErTyUi(ped, false)
                        if KpLoMkNjBhGt(veh) then
                            JkLzXcVbNmAs(veh, 100.0)
                        end
                    end
                    Wait(100)
                end
            end)
        end

        LqWyXpR3tV()
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        BlNkJmLzXcVb = false
    ]]);end);local v50=MachoMenuInputbox(v37[2],"License Plate:","...");MachoMenuButton(v37[2],"Set License Plate",function() local v181=MachoMenuGetInputbox(v50);if ((type(v181)=="string") and (v181~="")) then local v253=0 + 0 ;local v254;while true do if (v253==(1125 -(936 + 189))) then v254=string.format([[
            local function xKqLZVwPt9()
                local XcVbNmAsDfGhJkL = PlayerPedId
                local TyUiOpZxCvBnMzLk = GetVehiclePedIsIn
                local PoIuYtReWqAzXsDc = _G.SetVehicleNumberPlateText

                local pEd = XcVbNmAsDfGhJkL()
                local vEh = TyUiOpZxCvBnMzLk(pEd, false)

                if vEh and vEh ~= 0 then
                    PoIuYtReWqAzXsDc(vEh, "%s")
                end

            end

            xKqLZVwPt9()
        ]],v181);MachoInjectResource((v42("monitor") and "monitor") or "any" ,v254);break;end end end end);local v51=MachoMenuInputbox(v37[1 + 1 ],"Vehicle Model:","...");MachoMenuButton(v37[1615 -(1565 + 48) ],"Spawn Car",function() local v182=0;local v183;local v184;local v185;local v186;while true do if (v182==(0 + 0)) then v183=MachoMenuGetInputbox(v51);v184=GetResourceState("WaveShield")=="started" ;v182=1139 -(782 + 356) ;end if (v182==1) then v185=GetResourceState("lb-phone")=="started" ;v186=nil;v182=2;end if (v182==2) then if ( not v184 and v185) then local v294=267 -(176 + 91) ;while true do if (v294==0) then v186=([[ 
            if type(CreateFrameworkVehicle) == "function" then
                local model = "%s"
                local hash = GetHashKey(model)
                local ped = PlayerPedId()
                if DoesEntityExist(ped) then
                    local coords = GetEntityCoords(ped)
                    if coords then
                        local vehicleData = {
                            vehicle = json.encode({ model = model })
                        }
                        CreateFrameworkVehicle(vehicleData, coords)
                    end
                end
            end
        ]]):format(v183);MachoInjectResource("lb-phone",v186);break;end end else local v295=0 -0 ;while true do if (v295==(0 -0)) then v186=([[ 
            local function XzRtVbNmQwEr()
                local tYaPlXcUvBn = PlayerPedId
                local iKoMzNbHgTr = GetEntityCoords
                local wErTyUiOpAs = GetEntityHeading
                local hGtRfEdCvBg = RequestModel
                local bNjMkLoIpUh = HasModelLoaded
                local pLkJhGfDsAq = Wait
                local sXcVbNmZlQw = GetVehiclePedIsIn
                local yUiOpAsDfGh = DeleteVehicle
                local aSxDcFgHvBn = _G.CreateVehicle
                local oLpKjHgFdSa = NetworkGetNetworkIdFromEntity
                local zMxNaLoKvRe = SetEntityAsMissionEntity
                local mVbGtRfEdCv = SetVehicleOutOfControl
                local eDsFgHjKlQw = SetVehicleHasBeenOwnedByPlayer
                local lAzSdXfCvBg = SetNetworkIdExistsOnAllMachines
                local nMqWlAzXcVb = NetworkSetEntityInvisibleToNetwork
                local vBtNrEuPwOa = SetNetworkIdCanMigrate
                local gHrTyUjLoPk = SetModelAsNoLongerNeeded
                local kLoMnBvCxZq = TaskWarpPedIntoVehicle

                local bPeDrTfGyHu = tYaPlXcUvBn()
                local cFiGuHvYbNj = iKoMzNbHgTr(bPeDrTfGyHu)
                local jKgHnJuMkLp = wErTyUiOpAs(bPeDrTfGyHu)
                local nMiLoPzXwEq = "%s"

                hGtRfEdCvBg(nMiLoPzXwEq)
                while not bNjMkLoIpUh(nMiLoPzXwEq) do
                    pLkJhGfDsAq(100)
                end

                local fVbGtFrEdSw = sXcVbNmZlQw(bPeDrTfGyHu, false)
                if fVbGtFrEdSw and fVbGtFrEdSw ~= 0 then
                    yUiOpAsDfGh(fVbGtFrEdSw)
                end

                local xFrEdCvBgTn = aSxDcFgHvBn(nMiLoPzXwEq, cFiGuHvYbNj.x + 2.5, cFiGuHvYbNj.y, cFiGuHvYbNj.z, jKgHnJuMkLp, true, false)
                local sMnLoKiJpUb = oLpKjHgFdSa(xFrEdCvBgTn)

                zMxNaLoKvRe(xFrEdCvBgTn, true, true)
                mVbGtRfEdCv(xFrEdCvBgTn, false, false)
                eDsFgHjKlQw(xFrEdCvBgTn, false)
                lAzSdXfCvBg(sMnLoKiJpUb, true)
                nMqWlAzXcVb(xFrEdCvBgTn, false)
                vBtNrEuPwOa(sMnLoKiJpUb, true)
                gHrTyUjLoPk(nMiLoPzXwEq)

                kLoMnBvCxZq(bPeDrTfGyHu, xFrEdCvBgTn, -1)
            end

            XzRtVbNmQwEr()
        ]]):format(v183);MachoInjectResource((v42("monitor") and "monitor") or "any" ,v186);break;end end end break;end end end);MachoMenuButton(v37[1095 -(975 + 117) ],"Repair Vehicle",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function FgN7LqxZyP()
            local aBcD = PlayerPedId
            local eFgH = GetVehiclePedIsIn
            local iJkL = SetVehicleFixed
            local mNoP = SetVehicleDeformationFixed

            local p = aBcD()
            local v = eFgH(p, false)
            if v and v ~= 0 then
                iJkL(v)
                mNoP(v)
            end
        end

        FgN7LqxZyP()
    ]]);end);MachoMenuButton(v37[1878 -(157 + 1718) ],"Flip Vehicle",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function vXmYLT9pq2()
            local a = PlayerPedId
            local b = GetVehiclePedIsIn
            local c = GetEntityHeading
            local d = SetEntityRotation

            local ped = a()
            local veh = b(ped, false)
            if veh and veh ~= 0 then
                d(veh, 0.0, 0.0, c(veh))
            end
        end

        vXmYLT9pq2()
    ]]);end);MachoMenuButton(v37[3 + 0 ],"Clean Vehicle",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function qPwRYKz7mL()
            local a = PlayerPedId
            local b = GetVehiclePedIsIn
            local c = SetVehicleDirtLevel

            local ped = a()
            local veh = b(ped, false)
            if veh and veh ~= 0 then
                c(veh, 0.0)
            end
        end

        qPwRYKz7mL()
    ]]);end);MachoMenuButton(v37[10 -7 ],"Delete Vehicle",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function LXpTqWvR80()
            local aQw = PlayerPedId
            local bEr = GetVehiclePedIsIn
            local cTy = DoesEntityExist
            local dUi = NetworkHasControlOfEntity
            local eOp = SetEntityAsMissionEntity
            local fAs = DeleteEntity
            local gDf = DeleteVehicle
            local hJk = SetVehicleHasBeenOwnedByPlayer

            local ped = aQw()
            local veh = bEr(ped, false)

            if veh and veh ~= 0 and cTy(veh) then
                hJk(veh, true)
                eOp(veh, true, true)

                if dUi(veh) then
                    fAs(veh)
                    gDf(veh)
                end
            end

        end

        LXpTqWvR80()
    ]]);end);MachoMenuButton(v37[3],"Toggle Vehicle Engine",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function NKzqVoXYLm()
            local a = PlayerPedId
            local b = GetVehiclePedIsIn
            local c = GetIsVehicleEngineRunning
            local d = SetVehicleEngineOn

            local ped = a()
            local veh = b(ped, false)
            if veh and veh ~= 0 then
                if c(veh) then
                    d(veh, false, true, true)
                else
                    d(veh, true, true, false)
                end
            end
        end

        NKzqVoXYLm()
    ]]);end);MachoMenuButton(v37[10 -7 ],"Max Vehicle Upgrades",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function XzPmLqRnWyBtVkGhQe()
            local FnUhIpOyLkTrEzSd = PlayerPedId
            local VmBgTnQpLcZaWdEx = GetVehiclePedIsIn
            local RfDsHuNjMaLpOyBt = SetVehicleModKit
            local AqWsEdRzXcVtBnMa = SetVehicleWheelType
            local TyUiOpAsDfGhJkLz = GetNumVehicleMods
            local QwErTyUiOpAsDfGh = SetVehicleMod
            local ZxCvBnMqWeRtYuIo = ToggleVehicleMod
            local MnBvCxZaSdFgHjKl = SetVehicleWindowTint
            local LkJhGfDsQaZwXeCr = SetVehicleTyresCanBurst
            local UjMiKoLpNwAzSdFg = SetVehicleExtra
            local RvTgYhNuMjIkLoPb = DoesExtraExist

            local lzQwXcVeTrBnMkOj = FnUhIpOyLkTrEzSd()
            local jwErTyUiOpMzNaLk = VmBgTnQpLcZaWdEx(lzQwXcVeTrBnMkOj, false)
            if not jwErTyUiOpMzNaLk or jwErTyUiOpMzNaLk == 0 then return end

            RfDsHuNjMaLpOyBt(jwErTyUiOpMzNaLk, 0)
            AqWsEdRzXcVtBnMa(jwErTyUiOpMzNaLk, 7)

            for XyZoPqRtWnEsDfGh = 0, 16 do
                local uYtReWqAzXsDcVf = TyUiOpAsDfGhJkLz(jwErTyUiOpMzNaLk, XyZoPqRtWnEsDfGh)
                if uYtReWqAzXsDcVf and uYtReWqAzXsDcVf > 0 then
                    QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, XyZoPqRtWnEsDfGh, uYtReWqAzXsDcVf - 1, false)
                end
            end

            QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 14, 16, false)

            local aSxDcFgHiJuKoLpM = TyUiOpAsDfGhJkLz(jwErTyUiOpMzNaLk, 15)
            if aSxDcFgHiJuKoLpM and aSxDcFgHiJuKoLpM > 1 then
                QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 15, aSxDcFgHiJuKoLpM - 2, false)
            end

            for QeTrBnMkOjHuYgFv = 17, 22 do
                ZxCvBnMqWeRtYuIo(jwErTyUiOpMzNaLk, QeTrBnMkOjHuYgFv, true)
            end

            QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 23, 1, false)
            QwErTyUiOpAsDfGh(jwErTyUiOpMzNaLk, 24, 1, false)

            for TpYuIoPlMnBvCxZq = 1, 12 do
                if RvTgYhNuMjIkLoPb(jwErTyUiOpMzNaLk, TpYuIoPlMnBvCxZq) then
                    UjMiKoLpNwAzSdFg(jwErTyUiOpMzNaLk, TpYuIoPlMnBvCxZq, false)
                end
            end

            MnBvCxZaSdFgHjKl(jwErTyUiOpMzNaLk, 1)
            LkJhGfDsQaZwXeCr(jwErTyUiOpMzNaLk, false)
        end

        XzPmLqRnWyBtVkGhQe()
    ]]);end);MachoMenuButton(v37[1021 -(697 + 321) ],"Teleport into Closest Vehicle",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function uPKcoBaEHmnK()
            local ziCFzHyzxaLX = SetPedIntoVehicle
            local YPPvDlOGBghA = GetClosestVehicle

            local Coords = GetEntityCoords(PlayerPedId())
            local vehicle = YPPvDlOGBghA(Coords.x, Coords.y, Coords.z, 15.0, 0, 70)

            if DoesEntityExist(vehicle) and not IsPedInAnyVehicle(PlayerPedId(), false) then
                if GetPedInVehicleSeat(vehicle, -1) == 0 then
                    ziCFzHyzxaLX(PlayerPedId(), vehicle, -1)
                else
                    ziCFzHyzxaLX(PlayerPedId(), vehicle, 0)
                end
            end
        end

        uPKcoBaEHmnK()
    ]]);end);MachoMenuButton(v37[7 -4 ],"Unlock Closest Vehicle",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function TpLMqKtXwZ()
            local AsoYuTrBnMvCxZaQw = PlayerPedId
            local GhrTnLpKjUyVbMnZx = GetEntityCoords
            local UyeWsDcXzQvBnMaLp = GetClosestVehicle
            local ZmkLpQwErTyUiOpAs = DoesEntityExist
            local VczNmLoJhBgVfCdEx = SetEntityAsMissionEntity
            local EqWoXyBkVsNzQuH = SetVehicleDoorsLocked
            local YxZwQvTrBnMaSdFgHj = SetVehicleDoorsLockedForAllPlayers
            local RtYuIoPlMnBvCxZaSd = SetVehicleHasBeenOwnedByPlayer
            local LkJhGfDsAzXwCeVrBt = NetworkHasControlOfEntity

            local ped = AsoYuTrBnMvCxZaQw()
            local coords = GhrTnLpKjUyVbMnZx(ped)
            local veh = UyeWsDcXzQvBnMaLp(coords.x, coords.y, coords.z, 10.0, 0, 70)

            if veh and ZmkLpQwErTyUiOpAs(veh) and LkJhGfDsAzXwCeVrBt(veh) then
                VczNmLoJhBgVfCdEx(veh, true, true)
                RtYuIoPlMnBvCxZaSd(veh, true)
                EqWoXyBkVsNzQuH(veh, 1)
                YxZwQvTrBnMaSdFgHj(veh, false)
            end

        end

        TpLMqKtXwZ()
    ]]);end);MachoMenuButton(v37[3],"Lock Closest Vehicle",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function tRYpZvKLxQ()
            local WqEoXyBkVsNzQuH = PlayerPedId
            local LoKjBtWxFhPoZuR = GetEntityCoords
            local VbNmAsDfGhJkLzXcVb = GetClosestVehicle
            local TyUiOpAsDfGhJkLzXc = DoesEntityExist
            local PlMnBvCxZaSdFgTrEq = SetEntityAsMissionEntity
            local KjBtWxFhPoZuRZlK = SetVehicleHasBeenOwnedByPlayer
            local AsDfGhJkLzXcVbNmQwE = SetVehicleDoorsLocked
            local QwEoXyBkVsNzQuHL = SetVehicleDoorsLockedForAllPlayers
            local ZxCvBnMaSdFgTrEqWz = NetworkHasControlOfEntity

            local ped = WqEoXyBkVsNzQuH()
            local coords = LoKjBtWxFhPoZuR(ped)
            local veh = VbNmAsDfGhJkLzXcVb(coords.x, coords.y, coords.z, 10.0, 0, 70)

            if veh and TyUiOpAsDfGhJkLzXc(veh) and ZxCvBnMaSdFgTrEqWz(veh) then
                PlMnBvCxZaSdFgTrEq(veh, true, true)
                KjBtWxFhPoZuRZlK(veh, true)
                AsDfGhJkLzXcVbNmQwE(veh, 2)
                QwEoXyBkVsNzQuHL(veh, true)
            end
        end

        tRYpZvKLxQ()
    ]]);end);MachoMenuButton(v38[1 -0 ],"Detach All Entitys",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function zXqLJWt7pN()
            local xPvA71LtqzW = ClearPedTasks
            local bXcT2mpqR9f = DetachEntity

            xPvA71LtqzW(PlayerPedId())
            bXcT2mpqR9f(PlayerPedId())
        end

        zXqLJWt7pN()
    ]]);end);MachoMenuButton(v38[1],"Twerk On Them",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function OyWTpKvmXq()
            local closestPlayer, closestDistance = nil, math.huge
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            
            for _, playerId in ipairs(GetActivePlayers()) do
                local targetPed = GetPlayerPed(playerId)
                if targetPed ~= playerPed then
                    local targetCoords = GetEntityCoords(targetPed)
                    local distance = #(playerCoords - targetCoords)
                    
                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = playerId
                    end
                end
            end

            if closestPlayer then
                if StarkDaddy then
                    ClearPedSecondaryTask(playerPed)
                    DetachEntity(playerPed, true, false)
                    StarkDaddy = false
                else
                    StarkDaddy = true
                    if not HasAnimDictLoaded("switch@trevor@mocks_lapdance") then
                        RequestAnimDict("switch@trevor@mocks_lapdance")
                        while not HasAnimDictLoaded("switch@trevor@mocks_lapdance") do
                            Wait(0)
                        end        
                    end

                    local targetPed = GetPlayerPed(closestPlayer)
                    AttachEntityToEntity(playerPed, targetPed, 4103, 0.05, 0.38, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                    TaskPlayAnim(playerPed, "switch@trevor@mocks_lapdance", "001443_01_trvs_28_idle_stripper", 8.0, -8.0, 100000, 33, 0, false, false, false)
                end
            end
        end

        OyWTpKvmXq()
    ]]);end);MachoMenuButton(v38[1],"Give Them Backshots",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function bXzLqPTMn9()
            local closestPlayer, closestDistance = nil, math.huge
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            for _, playerId in ipairs(GetActivePlayers()) do
                local targetPed = GetPlayerPed(playerId)
                if targetPed ~= playerPed then
                    local targetCoords = GetEntityCoords(targetPed)
                    local distance = #(playerCoords - targetCoords)

                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = playerId
                    end
                end
            end

            if closestPlayer then
                if StarkDaddy then
                    ClearPedSecondaryTask(playerPed)
                    DetachEntity(playerPed, true, false)
                    StarkDaddy = false
                else
                    StarkDaddy = true
                    if not HasAnimDictLoaded("rcmpaparazzo_2") then
                        RequestAnimDict("rcmpaparazzo_2")
                        while not HasAnimDictLoaded("rcmpaparazzo_2") do
                            Wait(0)
                        end
                    end

                    local targetPed = GetPlayerPed(closestPlayer)
                    AttachEntityToEntity(PlayerPedId(), targetPed, 4103, 0.04, -0.4, 0.1, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                    TaskPlayAnim(PlayerPedId(), "rcmpaparazzo_2", "shag_loop_a", 8.0, -8.0, 100000, 33, 0, false, false, false)
                    TaskPlayAnim(GetPlayerPed(closestPlayer), "rcmpaparazzo_2", "shag_loop_poppy", 2.0, 2.5, -1, 49, 0, 0, 0, 0)
                end
            end
        end

        bXzLqPTMn9()
    ]]);end);MachoMenuButton(v38[2 -1 ],"Wank On Them",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function qXW7YpLtKv()
            local closestPlayer, closestDistance = nil, math.huge
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            for _, playerId in ipairs(GetActivePlayers()) do
                local targetPed = GetPlayerPed(playerId)
                if targetPed ~= playerPed then
                    local targetCoords = GetEntityCoords(targetPed)
                    local distance = #(playerCoords - targetCoords)

                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = playerId
                    end
                end
            end

            if closestPlayer then
                if isInPiggyBack then
                    ClearPedSecondaryTask(playerPed)
                    DetachEntity(playerPed, true, false)
                    wankoffperson = false
                else
                    wankoffperson = true
                    if not HasAnimDictLoaded("mp_player_int_upperwank") then
                        RequestAnimDict("mp_player_int_upperwank")
                        while not HasAnimDictLoaded("mp_player_int_upperwank") do
                            Wait(0)
                        end
                    end
                end

                TaskPlayAnim(PlayerPedId(), "mp_player_int_upperwank", "mp_player_int_wank_01", 8.0, -8.0, -1, 51, 1.0, false, false, false)
            end
        end

        qXW7YpLtKv()
    ]]);end);MachoMenuButton(v38[1 + 0 ],"Piggyback On Player",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function RtKpqLmXZV()
            local closestPlayer, closestDistance = nil, math.huge
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            for _, playerId in ipairs(GetActivePlayers()) do
                local targetPed = GetPlayerPed(playerId)
                if targetPed ~= playerPed then
                    local targetCoords = GetEntityCoords(targetPed)
                    local distance = #(playerCoords - targetCoords)

                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = playerId
                    end
                end
            end

            if closestPlayer then
                if isInPiggyBack then
                    ClearPedSecondaryTask(playerPed)
                    DetachEntity(playerPed, true, false)
                    isInPiggyBack = false
                else
                    isInPiggyBack = true
                    if not HasAnimDictLoaded("anim@arena@celeb@flat@paired@no_props@") then
                        RequestAnimDict("anim@arena@celeb@flat@paired@no_props@")
                        while not HasAnimDictLoaded("anim@arena@celeb@flat@paired@no_props@") do
                            Wait(0)
                        end
                    end

                    local targetPed = GetPlayerPed(closestPlayer)
                    AttachEntityToEntity(PlayerPedId(), targetPed, 0, 0.0, -0.25, 0.45, 0.5, 0.5, 180, false, false, false, false, 2, false)
                    TaskPlayAnim(PlayerPedId(), "anim@arena@celeb@flat@paired@no_props@", "piggyback_c_player_b", 8.0, -8.0, 1000000, 33, 0, false, false, false)
                end
            end
        end

        RtKpqLmXZV()
    ]]);end);MachoMenuButton(v38[1 -0 ],"Blame Arrest",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function WXY7LpqKto()
            local closestPlayer, closestDistance = nil, math.huge
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            for _, playerId in ipairs(GetActivePlayers()) do
                local targetPed = GetPlayerPed(playerId)
                if targetPed ~= playerPed then
                    local targetCoords = GetEntityCoords(targetPed)
                    local distance = #(playerCoords - targetCoords)

                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = playerId
                    end
                end
            end

            if closestPlayer then
                if StarkCuff then
                    ClearPedSecondaryTask(playerPed)
                    DetachEntity(playerPed, true, false)
                    StarkCuff = false
                else
                    StarkCuff = true
                    if not HasAnimDictLoaded("mp_arresting") then
                        RequestAnimDict("mp_arresting")
                        while not HasAnimDictLoaded("mp_arresting") do
                            Wait(0)
                        end
                    end

                    local targetPed = GetPlayerPed(closestPlayer)
                    AttachEntityToEntity(PlayerPedId(), targetPed, 4103, 0.35, 0.38, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                    TaskPlayAnim(PlayerPedId(), "mp_arresting", "idle", 8.0, -8, -1, 49, 0.0, false, false, false)
                end
            end
        end

        WXY7LpqKto()
    ]]);end);MachoMenuButton(v38[2 -1 ],"Blame Carry",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function KmXYpTzqLW()
            local closestPlayer, closestDistance = nil, math.huge
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            for _, playerId in ipairs(GetActivePlayers()) do
                local targetPed = GetPlayerPed(playerId)
                if targetPed ~= playerPed then
                    local targetCoords = GetEntityCoords(targetPed)
                    local distance = #(playerCoords - targetCoords)

                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = playerId
                    end
                end
            end

            if closestPlayer then
                if StarkCarry then
                    ClearPedSecondaryTask(playerPed)
                    DetachEntity(playerPed, true, false)
                    StarkCarry = false
                else
                    StarkCarry = true
                    if not HasAnimDictLoaded("nm") then
                        RequestAnimDict("nm")
                        while not HasAnimDictLoaded("nm") do
                            Wait(0)
                        end
                    end

                    local targetPed = GetPlayerPed(closestPlayer)
                    AttachEntityToEntity(PlayerPedId(), targetPed, 0, 0.35, 0.08, 0.63, 0.5, 0.5, 180, false, false, false, false, 2, false)
                    TaskPlayAnim(PlayerPedId(), "nm", "firemans_carry", 8.0, -8.0, 100000, 33, 0, false, false, false)
                end
            end
        end

        KmXYpTzqLW()
    ]]);end);MachoMenuButton(v38[1228 -(322 + 905) ],"Sit On Them",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function PxKvqLtNYz()
            local closestPlayer, closestDistance = nil, math.huge
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            for _, playerId in ipairs(GetActivePlayers()) do
                local targetPed = GetPlayerPed(playerId)
                if targetPed ~= playerPed then
                    local targetCoords = GetEntityCoords(targetPed)
                    local distance = #(playerCoords - targetCoords)

                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = playerId
                    end
                end
            end

            if not HasAnimDictLoaded("anim@heists@prison_heistunfinished_biztarget_idle") then
                RequestAnimDict("anim@heists@prison_heistunfinished_biztarget_idle")
                while not HasAnimDictLoaded("anim@heists@prison_heistunfinished_biztarget_idle") do
                    Wait(0)
                end
            end

            AttachEntityToEntity(PlayerPedId(), GetPlayerPed(closestPlayer), 4103, 0.10, 0.28, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
            TaskPlayAnim(PlayerPedId(), "anim@heists@prison_heistunfinished_biztarget_idle", "target_idle", 8.0, -8.0, 9999999, 33, 9999999, false, false, false)
            TaskSetBlockingOfNonTemporaryEvents(PlayerPedId(), true)
        end

        PxKvqLtNYz()
    ]]);end);MachoMenuButton(v38[1],"Ride Driver",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function vZqPWLXm97()
            local closestPlayer, closestDistance = nil, math.huge
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            for _, playerId in ipairs(GetActivePlayers()) do
                local targetPed = GetPlayerPed(playerId)
                if targetPed ~= playerPed then
                    local targetCoords = GetEntityCoords(targetPed)
                    local distance = #(playerCoords - targetCoords)

                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = playerId
                    end
                end
            end

            if closestPlayer then
                if RideDriver then
                    ClearPedSecondaryTask(playerPed)
                    DetachEntity(playerPed, true, false)
                    RideDriver = false
                else
                    RideDriver = true
                    if not HasAnimDictLoaded("mini@prostitutes@sexnorm_veh") then
                        RequestAnimDict("mini@prostitutes@sexnorm_veh")
                        while not HasAnimDictLoaded("mini@prostitutes@sexnorm_veh") do
                            Wait(0)
                        end
                    end

                    local targetPed = GetPlayerPed(closestPlayer)
                    AttachEntityToEntity(PlayerPedId(), targetPed, 0, 0.35, 0.08, 0.63, 0.5, 0.5, 180, false, false, false, false, 2, false)
                    TaskPlayAnim(PlayerPedId(), "mini@prostitutes@sexnorm_veh", "sex_loop_prostitute", 8.0, -8.0, 100000, 33, 0, false, false, false)
                end
            end
        end

        vZqPWLXm97()
    ]]);end);MachoMenuButton(v38[612 -(602 + 9) ],"Blow Driver",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function qPLWtXYzKm()
            local closestPlayer, closestDistance = nil, math.huge
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            for _, playerId in ipairs(GetActivePlayers()) do
                local targetPed = GetPlayerPed(playerId)
                if targetPed ~= playerPed then
                    local targetCoords = GetEntityCoords(targetPed)
                    local distance = #(playerCoords - targetCoords)

                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = playerId
                    end
                end
            end

            if closestPlayer then
                if BlowDriver then
                    ClearPedSecondaryTask(playerPed)
                    DetachEntity(playerPed, true, false)
                    BlowDriver = false
                else
                    BlowDriver = true
                    if not HasAnimDictLoaded("mini@prostitutes@sexnorm_veh") then
                        RequestAnimDict("mini@prostitutes@sexnorm_veh")
                        while not HasAnimDictLoaded("mini@prostitutes@sexnorm_veh") do
                            Wait(0)
                        end
                    end

                    TaskPlayAnim(PlayerPedId(), "mini@prostitutes@sexnorm_veh", "bj_loop_prostitute", 8.0, -8.0, 100000, 33, 0, false, false, false)
                end
            end
        end

        qPLWtXYzKm()
    ]]);end);MachoMenuButton(v38[1],"Meditate On Them",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        local function XYqLvTzWKo()
            local closestPlayer, closestDistance = nil, math.huge
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            for _, playerId in ipairs(GetActivePlayers()) do
                local targetPed = GetPlayerPed(playerId)
                if targetPed ~= playerPed then
                    local targetCoords = GetEntityCoords(targetPed)
                    local distance = #(playerCoords - targetCoords)

                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = playerId
                    end
                end
            end

            if not HasAnimDictLoaded("rcmcollect_paperleadinout@") then
                RequestAnimDict("rcmcollect_paperleadinout@")
                while not HasAnimDictLoaded("rcmcollect_paperleadinout@") do
                    Wait(0)
                end
            end

            AttachEntityToEntity(PlayerPedId(), GetPlayerPed(closestPlayer), 57005, 0, -0.12, 1.53, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
            TaskPlayAnim(PlayerPedId(), "rcmcollect_paperleadinout", "meditiate_idle", 8.0, -8.0, 9999999, 33, 9999999, false, false, false)
            TaskSetBlockingOfNonTemporaryEvents(PlayerPedId(), true)
        end

        XYqLvTzWKo()
    ]]);end);local v52=0;local v53=false;local v54=nil;local v55={[0]="slapped",[1190 -(449 + 740) ]="punched",[874 -(826 + 46) ]="receiveblowjob",[3]="GiveBlowjob",[951 -(245 + 702) ]="headbutted",[15 -10 ]="hug4",[6]="streetsexfemale",[7]="streetsexmale",[3 + 5 ]="pback2",[1907 -(260 + 1638) ]="carry3",[450 -(382 + 58) ]=".....gta298",[35 -24 ]=".....gta304",[10 + 2 ]=".....gta284"};MachoMenuDropDown(v38[3 -1 ],"Emote Choice",function(v187) v52=v187;end,"Slapped","Punched","Give BJ","Recieve BJ","Headbutt","Hug","StreetSexFemale","StreetSexMale","Piggyback","Carry","Butt Rape","Amazing Head","Lesbian Scissors");MachoMenuButton(v38[2],"Give Emote",function() local v188=v55[v52];if v188 then MachoInjectResource2(8 -5 ,(v42("monitor") and "monitor") or "any" ,string.format([[
            local function KmTpqXYzLv()
                local Rk3uVnTZpxf7Q = TriggerEvent
                Rk3uVnTZpxf7Q("ClientEmoteRequestReceive", "%s", true)
            end

            KmTpqXYzLv()
        ]],v188));end end);InputBoxHandle=MachoMenuInputbox(v39[1206 -(902 + 303) ],"Name:","...");InputBoxHandle2=MachoMenuInputbox(v39[1],"Amount:","...");MachoMenuButton(v39[1 -0 ],"Spawn",function() local v189=0 -0 ;local v190;local v191;while true do if ((0 + 0)==v189) then v190=MachoMenuGetInputbox(InputBoxHandle);v191=MachoMenuGetInputbox(InputBoxHandle2);v189=1;end if (v189==1) then if (v190 and (v190~="") and v191 and tonumber(v191)) then local v296=tonumber(v191);local v297={ak47_drugmanager=function() MachoInjectResource2(3,(v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
                    local function efjwr8sfr()
                        TriggerServerEvent('ak47_drugmanager:pickedupitem', "]]   .. v190   .. [[", "]]   .. v190   .. [[", ]]   .. v191   .. [[)
                    end

                    efjwr8sfr()
                ]] );end,["bobi-selldrugs"]=function() MachoInjectResource2(1693 -(1121 + 569) ,(v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
                    local function safdagwawe()
                        TriggerServerEvent('bobi-selldrugs:server:RetrieveDrugs', "]]   .. v190   .. [[", ]]   .. v191   .. [[)
                    end

                    safdagwawe()
                ]] );end,["mc9-taco"]=function() MachoInjectResource2(3,(v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
                    local function cesfw33w245d()
                        TriggerServerEvent('mc9-taco:server:addItem', "]]   .. v190   .. [[", ]]   .. v191   .. [[)
                    end

                    cesfw33w245d()
                ]] );end,["bobi-selldrugs"]=function() MachoInjectResource2(217 -(22 + 192) ,(v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
                    local function safdagwawe()
                        TriggerServerEvent('bobi-selldrugs:server:RetrieveDrugs', "]]   .. v190   .. [[", ]]   .. v191   .. [[)
                    end

                    safdagwawe()
                ]] );end,["wp-pocketbikes"]=function() MachoInjectResource2(686 -(483 + 200) ,(v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
                    local function awdfaweawewaeawe()
                        TriggerServerEvent("wp-pocketbikes:server:AddItem", "]]   .. v190   .. [[", ]]   .. v191   .. [[)
                    end

                    awdfaweawewaeawe()
                ]] );end,["solos-jointroll"]=function() MachoInjectResource2(3,(v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
                    local function weawasfawfasfa()
                        TriggerServerEvent('solos-joints:server:itemadd', "]]   .. v190   .. [[", ]]   .. v191   .. [[)
                    end

                    weawasfawfasfa()
                ]] );end,["angelicxs-CivilianJobs"]=function() MachoInjectResource2(1466 -(1404 + 59) ,(v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
                    local function safafawfaws()
                        TriggerServerEvent('angelicxs-CivilianJobs:Server:GainItem', "]]   .. v190   .. [[", ]]   .. v191   .. [[)
                    end

                    safafawfaws()
                ]] );end,ars_whitewidow_v2=function() MachoInjectResource2(8 -5 ,(v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
                    local function sDfjMawT34()
                        TriggerServerEvent('ars_whitewidow_v2:Buyitem', {
                            items = {
                                {
                                    id = "]]   .. v190   .. [[",
                                    image = "JTG",
                                    name = "JTG",
                                    page = 1,
                                    price = 500,
                                    quantity = ]]   .. v191   .. [[,
                                    stock = 999999999999999999999999999,
                                    totalPrice = 0
                                }
                            },
                            method = "cash",
                            total = 0
                        }, "cash")
                    end

                    sDfjMawT34()
                ]] );end,ars_cannabisstore_v2=function() MachoInjectResource2(3,(v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
                local function sDfjMawT34()
                    TriggerServerEvent("ars_cannabisstore_v2:Buyitem", {
                        items = {
                            {
                                id = "]]   .. v190   .. [[",
                                image = "JTG",
                                name = "JTG",
                                page = JTG,
                                price = JTG,
                                quantity = ]]   .. v191   .. [[,
                                stock = JTG,
                                totalPrice = 0
                            }
                        },
                        method = "JTG",
                        total = 0
                    }, "cash")
                end

                sDfjMawT34()
                ]] );end,ars_hunting=function() MachoInjectResource2(3 -0 ,(v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
                    local function sDfjMawT34()
                        TriggerServerEvent("ars_hunting:sellBuyItem",  {
                            item = "]]   .. v190   .. [[",
                            price = 1,
                            quantity = ]]   .. v191   .. [[,
                            buy = true
                        })
                    end

                    sDfjMawT34()
                ]] );end,["boii-whitewidow"]=function() local v307={"217.20.242.24:30120"};local function v308(v337) for v364,v365 in ipairs(v307) do if (v337==v365) then return true;end end return false;end local v309=GetCurrentServerEndpoint();if v308(v309) then MachoInjectResource2(565 -(334 + 228) ,(v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
                        local function sDfjMawT34()
                            TriggerServerEvent('boii-whitewidow:server:AddItem', ']]   .. v190   .. [[', ]]   .. v191   .. [[)
                        end

                        sDfjMawT34()
                    ]] );end end,["codewave-cannabis-cafe"]=function() local v310=0 -0 ;local v311;local v312;local v313;while true do if (v310==(0 -0)) then v311={"185.244.106.45:30120"};v312=nil;v310=1 + 0 ;end if (v310==(238 -(141 + 95))) then if v312(v313) then MachoInjectResource2(3 + 0 ,(v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
                        local function sDfjMawT34()
                            TriggerServerEvent("cannabis_cafe:giveStockItems", { item = "]]   .. v190   .. [[", newItem = "JTG", pricePerItem = 0 }, ]]   .. v191   .. [[)
                        end

                        sDfjMawT34()
                    ]] );end break;end if (v310==(2 -1)) then function v312(v377) local v378=0 -0 ;while true do if (v378==0) then for v392,v393 in ipairs(v311) do if (v377==v393) then return true;end end return false;end end end v313=GetCurrentServerEndpoint();v310=1 + 1 ;end end end,["snipe-boombox"]=function() MachoInjectResource2(3,(v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
                    local function sDfjMawT34()
                        TriggerServerEvent("snipe-boombox:server:pickup", ]]   .. v191   .. [[, vector3(0.0, 0.0, 0.0), "]]   .. v190   .. [[")
                    end

                    sDfjMawT34()
                ]] );end,devkit_bbq=function() MachoInjectResource2(8 -5 ,(v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
                    local function sDfjMawT34()
                        TriggerServerEvent('devkit_bbq:addinv', ']]   .. v190   .. [[', ]]   .. v191   .. [[)
                    end

                    sDfjMawT34()
                ]] );end,mt_printers=function() MachoInjectResource2(3 + 0 ,(v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[  
                    local function sDfjMawT34()
                        TriggerServerEvent('__ox_cb_mt_printers:server:itemActions', "mt_printers", "mt_printers:server:itemActions:JTG", "]]   .. v190   .. [[", "add")
                    end

                    sDfjMawT34()
                ]] );end,WayTooCerti_3D_Printer=function() MachoInjectResource2(3,(v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[ 
                    local function ZxUwQsErTy12()
                        TriggerServerEvent('waytoocerti_3dprinter:CompletePurchase', ']]   .. v190   .. [[', ]]   .. v191   .. [[)
                    end
                    ZxUwQsErTy12()
                ]] );end,["pug-fishing"]=function() MachoInjectResource2(2 + 1 ,(v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
                    local function MnBvCxZlKjHgFd23()
                        TriggerServerEvent('Pug:server:GiveFish', "]]   .. v190   .. [[", ]]   .. v191   .. [[)
                    end
                    MnBvCxZlKjHgFd23()
                ]] );end,apex_koi=function() MachoInjectResource2(3,(v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
                    local function ErTyUiOpAsDfGh45()
                        TriggerServerEvent("apex_koi:client:addItem", "]]   .. v190   .. [[", ]]   .. v191   .. [[)
                    end
                    ErTyUiOpAsDfGh45()
                ]] );end,apex_peckerwood=function() MachoInjectResource2(4 -1 ,(v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
                    local function UiOpAsDfGhJkLz67()
                        TriggerServerEvent("apex_peckerwood:client:addItem", "]]   .. v190   .. [[", ]]   .. v191   .. [[)
                    end
                    UiOpAsDfGhJkLz67()
                ]] );end,apex_thetown=function() MachoInjectResource2(3,(v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
                    local function PlMnBvCxZaSdFg89()
                        TriggerServerEvent("apex_thetown:client:addItem", "]]   .. v190   .. [[", ]]   .. v191   .. [[)
                    end
                    PlMnBvCxZaSdFg89()
                ]] );end,["codewave-bbq"]=function() MachoInjectResource2(2 + 1 ,(v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
                    local function QwErTyUiOpAsDf90()
                        for i = 1, ]]   .. v191   .. [[ do
                            TriggerServerEvent('placeProp:returnItem', "]]   .. v190   .. [[")
                            Wait(1)
                        end
                    end
                    QwErTyUiOpAsDf90()
                ]] );end,brutal_hunting=function() MachoInjectResource2(166 -(92 + 71) ,(v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
                    local function TyUiOpAsDfGhJk01()
                        Wait(1)
                        TriggerServerEvent("brutal_hunting:server:AddItem", {
                            {
                                amount = "]]   .. v191   .. [[",
                                item = "]]   .. v190   .. [[",
                                label = "J",
                                price = 0
                            }
                        })
                    end
                    TyUiOpAsDfGhJk01()
                ]] );end,xmmx_bahamas=function() MachoInjectResource2(3,(v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
                    local function JkLzXcVbNmQwEr02()
                        TriggerServerEvent("xmmx-bahamas:Making:GetItem", "]]   .. v190   .. [[", {
                            amount = ]]   .. v191   .. [[,
                            cash = {
                            }
                        })
                    end
                    JkLzXcVbNmQwEr02()
                ]] );end,ak47_drugmanager=function() local v314=0 + 0 ;local v315;local v316;local v317;while true do if (v314==1) then function v316(v379) for v385,v386 in ipairs(v315) do if (v379==v386) then return true;end end return false;end v317=GetCurrentServerEndpoint();v314=2;end if ((2 -0)==v314) then if v316(v317) then MachoInjectResource2(768 -(574 + 191) ,(v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
                        local function aKf48SlWd()
                            Wait(1)
                            TriggerServerEvent('ak47_drugmanager:pickedupitem', "]]   .. v190   .. [[", "]]   .. v190   .. [[", ]]   .. v191   .. [[)
                        end
                        aKf48SlWd()
                    ]] );end break;end if (v314==0) then v315={"162.222.16.18:30120"};v316=nil;v314=1 + 0 ;end end end,xmmx_letscookplus=function() MachoInjectResource2(7 -4 ,(v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
                    local function QwErTy123()
                        Wait(1)
                        TriggerServerEvent('xmmx_letscookplus:server:BuyItems', {
                            totalCost = 0,
                            cart = {
                                {name = "]]   .. v190   .. [[", quantity = ]]   .. v191   .. [[}
                            }
                        }, "bank")
                    end
                    QwErTy123()
                ]] );end,["xmmx-letscamp"]=function() local v318={"66.70.153.70:80"};local function v319(v338) local v339=0 + 0 ;while true do if (v339==0) then for v387,v388 in ipairs(v318) do if (v338==v388) then return true;end end return false;end end end local v320=GetCurrentServerEndpoint();if  not v319(v320) then local v366=string.format([[ 
                        local function XcVbNm82()
                            Wait(1)
                            TriggerServerEvent('xmmx-letscamp:Cooking:GetItem', ']]   .. v190   .. [[', {
                                ["%s"] = {
                                    ['lccampherbs'] = 0,
                                    ['lccampmeat'] = 0,
                                    ['lccampbutta'] = 0
                                },
                                ['amount'] = ]]   .. v191   .. [[
                            })
                        end
                        XcVbNm82()
                    ]] ,v190);MachoInjectResource2(852 -(254 + 595) ,"xmmx-letscamp",v366);end end,wasabi_mining=function() MachoInjectResource2(3,(v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
                    local function MzXnJqKs88()
                        local item = {
                            difficulty = { "medium", "medium" },
                            item = "]]   .. v190   .. [[",
                            label = "JTG",
                            price = { 110, 140 }
                        }

                        local index = 3
                        local amount = ]]   .. v191   .. [[

                        for i = 1, amount do
                            Wait(1)
                            TriggerServerEvent('wasabi_mining:mineRock', item, index)
                        end
                    end
                    MzXnJqKs88()
                ]] );end,apex_bahama=function() local v321=126 -(55 + 71) ;local v322;local v323;local v324;while true do if (v321==0) then v322={"89.31.216.161:30120"};v323=nil;v321=1 -0 ;end if (v321==(1791 -(573 + 1217))) then function v323(v380) local v381=0 -0 ;while true do if (0==v381) then for v394,v395 in ipairs(v322) do if (v380==v395) then return true;end end return false;end end end v324=GetCurrentServerEndpoint();v321=1 + 1 ;end if ((2 -0)==v321) then if v323(v324) then MachoInjectResource2(942 -(714 + 225) ,(v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
                        local function PlMnBv55()
                            Wait(1)
                            TriggerServerEvent("apex_bahama:client:addItem", "]]   .. v190   .. [[", ]]   .. v191   .. [[)
                        end
                        PlMnBv55()
                    ]] );end break;end end end,["jg-mechanic"]=function() local v325=0 -0 ;local v326;local v327;local v328;while true do if (v325==(1 -0)) then function v327(v382) local v383=0 + 0 ;while true do if (v383==0) then for v396,v397 in ipairs(v326) do if (v382==v397) then return true;end end return false;end end end v328=GetCurrentServerEndpoint();v325=2 -0 ;end if ((806 -(118 + 688))==v325) then v326={"91.190.154.43:30120"};v327=nil;v325=1 + 0 ;end if (v325==(1888 -(927 + 959))) then if v327(v328) then MachoInjectResource2(10 -7 ,(v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
                        local function HjKlYu89()
                            Wait(1)
                            TriggerServerEvent('jg-mechanic:server:buy-item', "]]   .. v190   .. [[", 0, ]]   .. v191   .. [[, "autoexotic", 1)
                        end
                        HjKlYu89()
                    ]] );end break;end end end,["jg-mechanic"]=function() local v329={"191.96.152.17:30121"};local function v330(v340) local v341=732 -(16 + 716) ;while true do if (v341==0) then for v389,v390 in ipairs(v329) do if (v340==v390) then return true;end end return false;end end end local v331=GetCurrentServerEndpoint();if v330(v331) then MachoInjectResource2(3,(v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
                        local function LkJfQwOp78()
                            Wait(1)
                            TriggerServerEvent('jg-mechanic:server:buy-item', "]]   .. v190   .. [[", 0, ]]   .. v191   .. [[, "TheCultMechShop", 1)
                        end
                        LkJfQwOp78()
                    ]] );end end};local v298=false;for v332,v333 in pairs(v297) do if (GetResourceState(v332)=="started") then v333();v298=true;break;end end if  not v298 then MachoMenuNotification("[NOTIFICATION] JTG Menu","No Triggers Found.");end else MachoMenuNotification("[NOTIFICATION] JTG Menu","Invalid Item or Amount.");end break;end end end);MoneyInputBox=MachoMenuInputbox(v39[2],"Amount:","...");MachoMenuButton(v39[2],"Spawn",function() local v192=MachoMenuGetInputbox(MoneyInputBox);if (v192 and tonumber(v192)) then local v255=0;local v256;local v257;local v258;while true do if (v255==0) then v256=tonumber(v192);v257={["codewave-lashes-phone"]=function() MachoInjectResource2(5 -2 ,(v42("ReaperV4") and "ReaperV4") or (v42("monitor") and "monitor") or "any" ,[[
                    Wait(1)
                    TriggerServerEvent('delivery:giveRewardlashes', ]]   .. v256   .. [[)
                ]] );end,["codewave-nails-phone"]=function() MachoInjectResource2(100 -(11 + 86) ,(v42("ReaperV4") and "ReaperV4") or (v42("monitor") and "monitor") or "any" ,[[
                    Wait(1)
                    TriggerServerEvent('delivery:giveRewardnails', ]]   .. v256   .. [[)
                ]] );end,["codewave-caps-client-phone"]=function() MachoInjectResource2(6 -3 ,(v42("ReaperV4") and "ReaperV4") or (v42("monitor") and "monitor") or "any" ,[[
                    Wait(1)
                    TriggerServerEvent('delivery:giveRewardCaps', ]]   .. v256   .. [[)
                ]] );end,["codewave-wigs-v3-phone"]=function() MachoInjectResource2(288 -(175 + 110) ,(v42("ReaperV4") and "ReaperV4") or (v42("monitor") and "monitor") or "any" ,[[
                    Wait(1)
                    TriggerServerEvent('delivery:giveRewardWigss', ]]   .. v256   .. [[)
                ]] );end,["codewave-icebox-phone"]=function() MachoInjectResource2(6 -3 ,(v42("ReaperV4") and "ReaperV4") or (v42("monitor") and "monitor") or "any" ,[[
                    Wait(1)
                    TriggerServerEvent('delivery:giveRewardiceboxs', ]]   .. v256   .. [[)
                ]] );end,["codewave-sneaker-phone"]=function() MachoInjectResource2(3,(v42("ReaperV4") and "ReaperV4") or (v42("monitor") and "monitor") or "any" ,[[
                    Wait(1)
                    TriggerServerEvent('delivery:giveRewardShoes', ]]   .. v256   .. [[)
                ]] );end,["codewave-handbag-phone"]=function() MachoInjectResource2(14 -11 ,(v42("ReaperV4") and "ReaperV4") or (v42("monitor") and "monitor") or "any" ,[[
                    Wait(1)
                    TriggerServerEvent('delivery:giveRewardhandbags', ]]   .. v256   .. [[)
                ]] );end};v255=1797 -(503 + 1293) ;end if (v255==(2 -1)) then v258=false;for v334,v335 in pairs(v257) do if (GetResourceState(v334)=="started") then v335();v258=true;break;end end v255=2;end if ((2 + 0)==v255) then if  not v258 then MachoMenuNotification("[NOTIFICATION] JTG Menu","No Triggers Found.");end break;end end else MachoMenuNotification("[NOTIFICATION] JTG Menu","Invalid Item or Amount.");end end);local v56=MachoMenuInputbox(v39[1065 -(810 + 251) ],"Event:","...");local v57=MachoMenuInputbox(v39[3 + 1 ],"Type:","...");local v58=MachoMenuInputbox(v39[2 + 2 ],"Resource:","...");local v59={"monitor","any"};MachoMenuButton(v39[4],"Execute",function() local v193=MachoMenuGetInputbox(v56);local v194=MachoMenuGetInputbox(v57);local v195=MachoMenuGetInputbox(v58);if ( not v193 or (v193=="")) then return;end local v196,v197=load("return function() return "   .. v193   .. " end" );if  not v196 then return;end local v198,v199=pcall(v196);if ( not v198 or (type(v199)~="function")) then return;end local v200={pcall(v199)};if  not v200[534 -(43 + 490) ] then return;end local v201=v200[735 -(711 + 22) ];local v202={};for v233=11 -8 , #v200 do table.insert(v202,v200[v233]);end local function v203(v234) if (type(v234)=="string") then return string.format("%q",v234);elseif ((type(v234)=="number") or (type(v234)=="boolean")) then return tostring(v234);elseif (type(v234)=="table") then local v342,v343=pcall(function() return json.encode(v234);end);return (v342 and string.format("json.decode(%q)",v343)) or "nil" ;else return "nil";end end local v204={};for v235,v236 in ipairs(v202) do table.insert(v204,v203(v236));end local v205=(( #v204>0) and table.concat(v204,", ")) or "" ;local v206=string.format([[
        local event = %q
        local triggerType = string.lower(%q)
        local args = { %s }

        if triggerType == "server" then
            TriggerServerEvent(event, table.unpack(args))
        else
            TriggerEvent(event, table.unpack(args))
        end
    ]],tostring(v201),string.lower(v194 or "client" ),v205);local v207=nil;if (v195 and (v195~="")) then if (GetResourceState(v195)=="started") then v207=v195;end else for v266,v267 in ipairs(v59) do if (GetResourceState(v267)=="started") then v207=v267;break;end end end if v207 then MachoInjectResource(v207,v206);end end);local v60=0;local v61={[859 -(240 + 619) ]={name="[E] Force Rob",resource=nil,code=nil},[1 + 0 ]={name="Phantom RP",resource=nil,code=[[
            local function ffff()
                CreateThread(function()
                    for i = 1, 100 do
                        local function e123()
                            local coords = GetEntityCoords(PlayerPedId())
                            TriggerServerEvent('qb-diving:server:TakeCoral', coords, coral, true)
                            Wait(3)
                        end

                        e123()

                        TriggerServerEvent('qb-diving:server:SellCorals')
                    end
                end)
            end

            ffff()
        ]]}};MachoMenuDropDown(v39[4 -1 ],"Exploit Choice",function(v208) v60=v208;end,v61[0 + 0 ].name,v61[1745 -(1344 + 400) ].name);MachoMenuButton(v39[408 -(255 + 150) ],"Execute",function() local v209=0 + 0 ;local v210;while true do if (v209==(1 + 0)) then if (v60==0) then local v299=0;local v300;local v301;local v302;while true do if (1==v299) then v302={ox="ox_inventory",qb="qb-inventory"};for v367,v368 in pairs(v302) do if (GetResourceState(v368)=="started") then v300=v367;break;end end v299=2;end if (v299==0) then v300=nil;v301={"ox_inventory","ox_doorlock","ox_fuel","ox_target","ox_lib","ox_sit","ox_appearance"};v299=1;end if (2==v299) then for v369,v370 in ipairs(v301 or {} ) do if (GetResourceState(v370)=="started") then MachoInjectResource2(409 -(183 + 223) ,v370,([[
                    local function awt72q48dsgn()
                        local awgfh347gedhs = CreateThread
                        awgfh347gedhs(function()
                            local dict = 'missminuteman_1ig_2'
                            local anim = 'handsup_enter'

                            RequestAnimDict(dict)
                            while not HasAnimDictLoaded(dict) do
                                Wait(0)
                            end

                            while true do
                                Wait(0)
                                if IsDisabledControlJustPressed(0, 38) then
                                    local selfPed = PlayerPedId()
                                    local selfCoords = GetEntityCoords(selfPed)
                                    local closestPlayer = -1
                                    local closestDistance = -1

                                    for _, player in ipairs(GetActivePlayers()) do
                                        local targetPed = GetPlayerPed(player)
                                        if targetPed ~= selfPed then
                                            local coords = GetEntityCoords(targetPed)
                                            local dist = #(selfCoords - coords)
                                            if closestDistance == -1 or dist < closestDistance then
                                                closestDistance = dist
                                                closestPlayer = player
                                            end
                                        end
                                    end

                                    if closestPlayer ~= -1 and closestDistance <= 3.0 then
                                        local ped = GetPlayerPed(closestPlayer)

                                        local CEPressPlayer = SetEnableHandcuffs
                                        local CEDeadPlayerCheck = SetEntityHealth

                                        if not IsPedCuffed(ped) then
                                            CEPressPlayer(ped, true)
                                            CEDeadPlayerCheck(ped, 0)
                                            CEPressPlayer(ped, true)
                                        end

                                        if not IsEntityPlayingAnim(ped, dict, anim, 13) then
                                            TaskPlayAnim(ped, dict, anim, 8.0, 8.0, -1, 50, 0, false, false, false)
                                        end
                                        
                                        local ActiveInventory = "%s"
                                        local serverId = GetPlayerServerId(closestPlayer)
                                        if ActiveInventory == "ox" then
                                            TriggerEvent('ox_inventory:openInventory', 'otherplayer', serverId)
                                        elseif ActiveInventory == "qb" then
                                            TriggerServerEvent('inventory:server:OpenInventory', 'otherplayer', serverId)
                                        end
                                    end
                                end
                            end
                        end)
                    end

                    awt72q48dsgn()

                ]]):format(v300));break;end end break;end end else MachoInjectResource2(3 -0 ,v210.resource,v210.code);end break;end if (v209==(0 + 0)) then v210=v61[v60];if  not v210 then return;end v209=1 + 0 ;end end end);ItemNameHandle=MachoMenuInputbox(v40[338 -(10 + 327) ],"Name:","...");ItemAmountHandle=MachoMenuInputbox(v40[1],"Amount:","...");MachoMenuButton(v40[1 + 0 ],"Spawn",function() if  not HasValidKey() then return;end local v211=MachoMenuGetInputbox(ItemNameHandle);local v212=MachoMenuGetInputbox(ItemAmountHandle);if (v211 and (v211~="") and v212 and tonumber(v212)) then local v259=tonumber(v212);local v260={["qb-uwujob"]=function() MachoInjectResource2(341 -(118 + 220) ,(v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
                    local function aswdaw4atsdf()
                        TriggerServerEvent("qb-uwujob:addItem", "]]   .. v211   .. [[", ]]   .. v212   .. [[)
                    end

                    aswdaw4atsdf()
                ]] );end,skirpz_drugplug=function() MachoInjectResource2(1 + 2 ,(v42("ReaperV4") and "ReaperV4") or (v42("monitor") and "monitor") or "any" ,[[
                    local function fawfafffsfzxfzx()
                        XTYZ = CreateThread
                        XTYZ(function()
                            for i = 1, ]]   .. v212   .. [[ do
                                local jtgdealer = "jtglol" .. math.random(1000,9999)
                                JTG_TriggerServerEvent = TriggerServerEvent
                                JTG_TriggerServerEvent('shop:purchaseItem', jtgdealer, ']]   .. v211   .. [[', 0)
                                Wait(100)
                            end
                        end)
                    end


                    fawfafffsfzxfzx()
                ]] );end,ak47_whitewidowv2=function() MachoInjectResource2(452 -(108 + 341) ,(v42("ReaperV4") and "ReaperV4") or (v42("monitor") and "monitor") or "any" ,[[
                    local function aXj49WqTpL()
                        local keyName = "ak47_whitewidowv2:process"
                        TriggerServerEvent(keyName, "]]   .. v211   .. [[", {money = 0}, ]]   .. v212   .. [[, 0)
                    end
                    aXj49WqTpL()
                ]] );end,ak47_business=function() MachoInjectResource2(2 + 1 ,(v42("ReaperV4") and "ReaperV4") or (v42("monitor") and "monitor") or "any" ,[[
                    local function agjw37257gj()
                        local keyName = "ak47_business:processed"
                        TriggerServerEvent(keyName, "]]   .. v211   .. [[", ]]   .. v212   .. [[)
                    end

                    agjw37257gj()
                ]] );end,ars_hunting=function() MachoInjectResource2(12 -9 ,(v42("ReaperV4") and "ReaperV4") or (v42("monitor") and "monitor") or "any" ,[[
                    local function ZqMwLpTrYv()
                        local keyName = "ars_hunting:sellBuyItem"
                        TriggerServerEvent(keyName, { buy = true, item = "]]   .. v211   .. [[", price = 0, quantity = ]]   .. v212   .. [[ })
                    end

                    ZqMwLpTrYv()
                ]] );end,fivecode_camping=function() MachoInjectResource2(1496 -(711 + 782) ,(v42("monitor") and "monitor") or "any" ,[[
                    local function GnRtCvXpKa()
                        local keyName = 'fivecode_camping:callCallback'
                        local KeyNameParams = 'fivecode_camping:shopPay'
                        TriggerServerEvent(keyName, KeyNameParams, 0, {
                            ['price'] = 0,
                            ['item'] = "]]   .. v211   .. [[",
                            ['amount'] = ]]   .. v212   .. [[,
                            ['label'] = 'JTG'
                        }, {
                            ['args'] = {
                                ['payment'] = {
                                    ['bank'] = true,
                                    ['cash'] = true
                                }
                            },
                            ['entity'] = 9218,
                            ['distance'] = 0.64534759521484,
                            ['hide'] = false,
                            ['type'] = 'bank',
                            ['label'] = 'Open Shop',
                            ['coords'] = 'vector3(-773.2181, 5597.66, 33.97217)',
                            ['name'] = 'npcShop-vec4(-773.409973, 5597.819824, 33.590000, 172.910004)'
                        })
                    end

                    GnRtCvXpKa()
                ]] );end,spoodyGunPlug=function() MachoInjectResource2(5 -2 ,(v42("spoodyGunPlug") and "spoodyGunPlug") or "any" ,[[
                    local function GnRtCvXpKa()
                        common:giveItem({ { item = "]]   .. v211   .. [[", amount = ]]   .. v212   .. [[ } })  
                    end

                    GnRtCvXpKa()
                ]] );end,["solos-weedtable"]=function() MachoInjectResource2(472 -(270 + 199) ,(v42("ReaperV4") and "ReaperV4") or (v42("monitor") and "monitor") or "any" ,[[
                    local function aqrqtsgw32w523w()
                        local keyName = "solos-weed:server:itemadd"
                        TriggerServerEvent(keyName, "]]   .. v211   .. [[", ]]   .. v212   .. [[)
                    end

                    aqrqtsgw32w523w()
                ]] );end};local v261=false;for v269,v270 in pairs(v260) do if (GetResourceState(v269)=="started") then v270();v261=true;end end if  not v261 then MachoMenuNotification("[NOTIFICATION] JTG Menu","No Triggers Found.");end else MachoMenuNotification("[NOTIFICATION] JTG Menu","Invalid Item or Amount.");end end);MachoMenuButton(v40[1 + 1 ],"Police Job",function() if  not HasValidKey() then return;end if v42("wasabi_multijob") then MachoInjectResource("wasabi_multijob",[[
            local job = { label = "Police", name = "police", grade = 1, grade_label = "Officer", grade_name = "officer" }
            CheckJob(job, true) 
        ]]);else MachoMenuNotification("[NOTIFICATION] JTG Menu","Resource Not Found.");end end);MachoMenuButton(v40[1821 -(580 + 1239) ],"EMS Job",function() if  not HasValidKey() then return;end if v42("wasabi_multijob") then MachoInjectResource("wasabi_multijob",[[
            local job = { label = "EMS", name = "ambulance", grade = 1, grade_label = "Medic", grade_name = "medic" }
            CheckJob(job, true) 
        ]]);else MachoMenuNotification("[NOTIFICATION] JTG Menu","Resource Not Found.");end end);MachoMenuButton(v40[8 -5 ],"Staff (1) (BETA) - Menu",function() local v213=0;while true do if (v213==0) then if  not HasValidStaffKey() then return;end if v42("mc9-adminmenu") then MachoInjectResource2(2 + 0 ,"mc9-adminmenu",[[
            _G.lib = _G.lib or lib
            _G.QBCore = _G.QBCore or exports['qb-core']:GetCoreObject()

            _G.lib.callback.register("mc9-adminmenu:callback:GetAllowedActions", function()
                local all = {}
                for k, v in pairs(_G.Config.Actions) do
                    all[k] = true
                end
                return all
            end)

            _G.CheckPerms = function(_)
                return true
            end

            _G.setupMenu = function()
                _G.PlayerData = _G.QBCore.Functions.GetPlayerData()
                _G.QBCore.Shared.Vehicles = _G.lib.callback.await("mc9-adminmenu:callback:GetSharedVehicles", false)
                _G.resources = _G.lib.callback.await("mc9-adminmenu:callback:GetResources", false)
                _G.commands = _G.lib.callback.await("mc9-adminmenu:callback:GetCommands", false)
                _G.GetData()

                _G.actions = {}
                for k, v in pairs(_G.Config.Actions) do
                    _G.actions[k] = v
                end

                _G.playerActions = {}
                for k, v in pairs(_G.Config.PlayerActions or {}) do
                    _G.playerActions[k] = v
                end

                _G.otherActions = {}
                for k, v in pairs(_G.Config.OtherActions or {}) do
                    _G.otherActions[k] = v
                end

                _G.SendNUIMessage({
                    action = "setupUI",
                    data = {
                        actions = _G.actions,
                        playerActions = _G.playerActions,
                        otherActions = _G.otherActions,
                        resources = _G.resources,
                        playerData = _G.PlayerData,
                        commands = _G.commands,
                        weapons = _G.QBCore.Shared.Weapons,
                    }
                })

                _G.uiReady = true
            end

            _G.setupMenu()
            _G.ToggleUI(true)
        ]]);else MachoMenuNotification("[NOTIFICATION] JTG Menu","Resource Not Found.");end break;end end end);MachoMenuButton(v40[1 + 2 ],"Staff (2) (BETA) - Announce",function() if  not HasValidStaffKey() then return;end if v42("ps-dispatch") then MachoInjectResource2(2,"ps-dispatch",[[
            local AllJobs = {
                'police','sheriff','state','ranger','ambulance','ems','doc','doj',
                'mechanic','bennys','lsc','tow','taxi','bus','trucker','garbage',
                'news','realestate','cardealer','gruppe6','casino','government','judge','lawyer',
                'unemployed'
            }

            local data = {
                message = 'Hey, I’m JTG — one of the best devs in the FiveM scene. Hit me up: YT JayThaaGamer - P.S. JTG',
                codeName = 'j5_blast',
                code = '',
                icon = 'fas fa-bullhorn',
                priority = 1,
                coords = vector3(0.0, 0.0, 0.0),
                alertTime = 9999,
                jobs = AllJobs,
                alert = { radius=200, sprite=84, color=1, scale=2.0, length=15, flash=true }
            }

            local function WoodyBETA()
                _G.Twiga = TriggerServerEvent
                _G.Twiga('ps-dispatch:server:notify', data)
            end

            WoodyBETA()
        ]]);else MachoMenuNotification("[NOTIFICATION] Wize Menu","Resource Not Found.");end end);MachoMenuButton(v41[1 + 0 ],"Unload",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        Unloaded = true
    ]]);MachoInjectResource((v42("core") and "core") or (v42("es_extended") and "es_extended") or (v42("qb-core") and "qb-core") or (v42("monitor") and "monitor") or "any" ,[[
        anvzBDyUbl = false
        if fLwYqKoXpRtB then fLwYqKoXpRtB() end
        kLpMnBvCxZqWeRt = false
    ]]);MachoMenuDestroy(v13);end);MachoMenuCheckbox(v41[2],"RGB Menu",function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        if FmxmAlwkjfsfmaW == nil then FmxmAlwkjfsfmaW = false end
        FmxmAlwkjfsfmaW = true

        local function CreateRGBUI()
            local wfgsmWAEJKF = CreateThread
            wfgsmWAEJKF(function()
                local offset = 0.0
                while FmxmAlwkjfsfmaW and not Unloaded do
                    offset = offset + 0.065
                    local r = math.floor(127 + 127 * math.sin(offset))
                    local g = math.floor(127 + 127 * math.sin(offset + 2))
                    local b = math.floor(127 + 127 * math.sin(offset + 4))
                    MachoMenuSetAccent(MenuWindow, r, g, b)
                    Wait(25)
                end
            end)
        end

        CreateRGBUI()
    ]]);end,function() MachoInjectResource((v42("monitor") and "monitor") or (v42("oxmysql") and "oxmysql") or "any" ,[[
        FmxmAlwkjfsfmaW = false
    ]]);end);local v62,v63,v64=135 -83 ,86 + 51 ,1402 -(645 + 522) ;MachoMenuSlider(v41[1792 -(1010 + 780) ],"R",v62,0,255 + 0 ,"",0,function(v214) v62=v214;MachoMenuSetAccent(v13,math.floor(v62),math.floor(v63),math.floor(v64));end);MachoMenuSlider(v41[9 -7 ],"G",v63,0 -0 ,2091 -(1045 + 791) ,"",0 -0 ,function(v215) local v216=0 -0 ;while true do if ((505 -(351 + 154))==v216) then v63=v215;MachoMenuSetAccent(v13,math.floor(v62),math.floor(v63),math.floor(v64));break;end end end);MachoMenuSlider(v41[2],"B",v64,1574 -(1281 + 293) ,521 -(28 + 238) ,"",0 -0 ,function(v217) local v218=0;while true do if (v218==(1559 -(1381 + 178))) then v64=v217;MachoMenuSetAccent(v13,math.floor(v62),math.floor(v63),math.floor(v64));break;end end end);MachoMenuButton(v41[3 + 0 ],"Anti-Cheat Checker",function() local function v219(v237,...) MachoMenuNotification("[NOTIFICATION] JTG Menu",string.format(v237,...));end local function v220(v238,v239) local v240=LoadResourceFile(v238,v239);return v240~=nil ;end local v221=GetNumResources();local v222={{name="ai_module_fg-obfuscated.lua",acName="FiveGuard"}};for v241=0,v221-(1 + 0)  do local v242=0 -0 ;local v243;local v244;local v245;while true do if (v242==(1 + 0)) then for v303,v304 in ipairs(v222) do if v220(v243,v304.name) then local v344=0;while true do if (v344==0) then v219("Anti-Cheat: %s",v304.acName);AntiCheat=v304.acName;v344=1;end if (v344==1) then return v243,v304.acName;end end end end v245=nil;v242=472 -(381 + 89) ;end if (v242==0) then v243=GetResourceByFindIndex(v241);v244=string.lower(v243);v242=1 + 0 ;end if (v242==2) then if (v244:sub(1 + 0 ,11 -4 )=="reaperv") then v245="ReaperV4";elseif (v244:sub(1157 -(1074 + 82) ,4)=="fini") then v245="FiniAC";elseif (v244:sub(1,7)=="chubsac") then v245="ChubsAC";elseif (v244:sub(1 -0 ,1790 -(214 + 1570) )=="fireac") then v245="FireAC";elseif (v244:sub(1456 -(990 + 465) ,3 + 4 )=="drillac") then v245="DrillAC";elseif (v244:sub( -(4 + 3))=="eshield") then v245="WaveShield";elseif (v244:sub( -(10 + 0))=="likizao_ac") then v245="Likizao-AC";elseif (v244:sub(3 -2 ,5)=="greek") then v245="GreekAC";elseif (v244=="pac") then v245="PhoenixAC";elseif (v244=="electronac") then v245="ElectronAC";end if v245 then local v336=1726 -(1668 + 58) ;while true do if (v336==(626 -(512 + 114))) then v219("Anti-Cheat: %s",v245);AntiCheat=v245;v336=2 -1 ;end if (v336==1) then return v243,v245;end end end break;end end end v219("No Anti-Cheat found");return nil,nil;end);MachoMenuButton(v41[3],"Framework Checker",function() local function v223(v246,...) MachoMenuNotification("[NOTIFICATION] JTG Menu",string.format(v246,...));end local function v224(v247) return GetResourceState(v247)=="started" ;end local v225={{label="ESX",globals={"ESX"},resources={"es_extended","esx-legacy"}},{label="QBCore",globals={"QBCore"},resources={"qb-core"}},{label="Qbox",globals={},resources={"qbox"}},{label="QBX Core",globals={},resources={"qbx-core"}},{label="ox_core",globals={"Ox"},resources={"ox_core"}},{label="ND_Core",globals={"NDCore"},resources={"nd-core","ND_Core"}},{label="vRP",globals={"vRP"},resources={"vrp"}}};local function v226() for v262,v263 in ipairs(v225) do for v271,v272 in ipairs(v263.globals) do if (_G[v272]~=nil) then return v263.label;end end end for v264,v265 in ipairs(v225) do for v273,v274 in ipairs(v265.resources) do if v224(v274) then return v265.label;end end end return "Standalone";end local v227=v226();v223("Framework: %s",v227);end);