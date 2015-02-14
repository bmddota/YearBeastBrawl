print ('[BAREBONES] barebones.lua' )
require('lib.statcollection')
statcollection.addStats({
  modID = 'e9a615b11be0a8044a2756c961da1466', --GET THIS FROM http://getdotastats.com/#d2mods__my_mods
  map = GetMapName()
})

ENABLE_HERO_RESPAWN = true              -- Should the heroes automatically respawn on a timer or stay dead until manually respawned
UNIVERSAL_SHOP_MODE = false             -- Should the main shop contain Secret Shop items as well as regular items
ALLOW_SAME_HERO_SELECTION = true        -- Should we let people select the same hero as each other

HERO_SELECTION_TIME = 20.0              -- How long should we let people select their hero?
PRE_GAME_TIME = 0.0                    -- How long after people select their heroes should the horn blow and the game start?
POST_GAME_TIME = 60.0                   -- How long should we let people look at the scoreboard before closing the server automatically?
TREE_REGROW_TIME = 60.0                 -- How long should it take individual trees to respawn after being cut down/destroyed?

GOLD_PER_TICK = 0                     -- How much gold should players get per tick?
GOLD_TICK_TIME = 5                      -- How long should we wait in seconds between gold ticks?

RECOMMENDED_BUILDS_DISABLED = false     -- Should we disable the recommened builds for heroes (Note: this is not working currently I believe)
CAMERA_DISTANCE_OVERRIDE = 1555.0        -- How far out should we allow the camera to go?  1134 is the default in Dota

MINIMAP_ICON_SIZE = .6                  -- What icon size should we use for our heroes?
MINIMAP_CREEP_ICON_SIZE = 1             -- What icon size should we use for creeps?
MINIMAP_RUNE_ICON_SIZE = 1              -- What icon size should we use for runes?

RUNE_SPAWN_TIME = 120                    -- How long in seconds should we wait between rune spawns?
CUSTOM_BUYBACK_COST_ENABLED = true      -- Should we use a custom buyback cost setting?
CUSTOM_BUYBACK_COOLDOWN_ENABLED = true  -- Should we use a custom buyback time?
BUYBACK_ENABLED = false                 -- Should we allow people to buyback when they die?

DISABLE_FOG_OF_WAR_ENTIRELY = true      -- Should we disable fog of war entirely for both teams?
--USE_STANDARD_DOTA_BOT_THINKING = false  -- Should we have bots act like they would in Dota? (This requires 3 lanes, normal items, etc)
USE_STANDARD_HERO_GOLD_BOUNTY = true    -- Should we give gold for hero kills the same as in Dota, or allow those values to be changed?

USE_CUSTOM_TOP_BAR_VALUES = true        -- Should we do customized top bar values or use the default kill count per team?
TOP_BAR_VISIBLE = true                  -- Should we display the top bar score/count at all?
SHOW_KILLS_ON_TOPBAR = true             -- Should we display kills only on the top bar? (No denies, suicides, kills by neutrals)  Requires USE_CUSTOM_TOP_BAR_VALUES

ENABLE_TOWER_BACKDOOR_PROTECTION = false-- Should we enable backdoor protection for our towers?
REMOVE_ILLUSIONS_ON_DEATH = false       -- Should we remove all illusions if the main hero dies?
DISABLE_GOLD_SOUNDS = false             -- Should we disable the gold sound when players get gold?

END_GAME_ON_KILLS = true                -- Should the game end after a certain number of kills?
KILLS_TO_END_GAME_FOR_TEAM = 50         -- How many kills for a team should signify an end of game?

USE_CUSTOM_HERO_LEVELS = true           -- Should we allow heroes to have custom levels?
MAX_LEVEL = 25                          -- What level should we let heroes get to?
USE_CUSTOM_XP_VALUES = true             -- Should we use custom XP values to level up heroes, or the default Dota numbers?

-- Fill this table up with the required XP per level if you want to change it
XP_PER_LEVEL_TABLE = {}
for i=1,MAX_LEVEL do
  XP_PER_LEVEL_TABLE[i] = i * 100
end


TOTAL_GAME_TIME = 600

-- Generated from template
if GameMode == nil then
    print ( '[BAREBONES] creating barebones game mode' )
    GameMode = class({})
end


--[[
  This function should be used to set up Async precache calls at the beginning of the game.  The Precache() function 
  in addon_game_mode.lua used to and may still sometimes have issues with client's appropriately precaching stuff.
  If this occurs it causes the client to never precache things configured in that block.

  In this function, place all of your PrecacheItemByNameAsync and PrecacheUnitByNameAsync.  These calls will be made
  after all players have loaded in, but before they have selected their heroes. PrecacheItemByNameAsync can also
  be used to precache dynamically-added datadriven abilities instead of items.  PrecacheUnitByNameAsync will 
  precache the precache{} block statement of the unit and all precache{} block statements for every Ability# 
  defined on the unit.

  This function should only be called once.  If you want to/need to precache more items/abilities/units at a later
  time, you can call the functions individually (for example if you want to precache units in a new wave of
  holdout).
]]
function GameMode:PostLoadPrecache()
  print("[BAREBONES] Performing Post-Load precache")    
  --PrecacheItemByNameAsync("item_example_item", function(...) end)
  --PrecacheItemByNameAsync("example_ability", function(...) end)

  --PrecacheUnitByNameAsync("npc_dota_hero_viper", function(...) end)
  --PrecacheUnitByNameAsync("npc_dota_hero_enigma", function(...) end)
  --PrecacheUnitByNameAsync("npc_precache_everything", function(...) end)
end

--[[
  This function is called once and only once as soon as the first player (almost certain to be the server in local lobbies) loads in.
  It can be used to initialize state that isn't initializeable in InitGameMode() but needs to be done before everyone loads in.
]]
function GameMode:OnFirstPlayerLoaded()
  print("[BAREBONES] First Player has loaded")

  Timers:CreateTimer(1, function()
    for i=0,9 do
      if PlayerResource:GetPlayer(i) ~= nil then
        if PlayerResource:GetTeam(i) ~= self.pIDtoTeam[i] then
          print(i)
          print(self.pIDtoTeam[i])
          PlayerResource:SetCustomTeamAssignment(i, self.pIDtoTeam[i])
        end
      end
    end

    return 1
  end)
end

--[[
  This function is called once and only once after all players have loaded into the game, right as the hero selection time begins.
  It can be used to initialize non-hero player state or adjust the hero selection (i.e. force random etc)
]]
function GameMode:OnAllPlayersLoaded()
  print("[BAREBONES] All Players have loaded into the game")
end

--[[
  This function is called once and only once for every player when they spawn into the game for the first time.  It is also called
  if the player's hero is replaced with a new hero for any reason.  This function is useful for initializing heroes, such as adding
  levels, changing the starting gold, removing/adding abilities, adding physics, etc.

  The hero parameter is the hero entity that just spawned in
]]
function GameMode:OnHeroInGame(hero)
  print("[BAREBONES] Hero spawned in game for first time -- " .. hero:GetUnitName())

  --[[ Multiteam configuration, currently unfinished

  local team = "team1"
  local playerID = hero:GetPlayerID()
  if playerID > 3 then
    team = "team2"
  end
  print("setting " .. playerID .. " to team: " .. team)
  MultiTeam:SetPlayerTeam(playerID, team)]]

  -- This line for example will set the starting gold of every hero to 500 unreliable gold
  hero:SetGold(0, false)
  hero:SetGold(0, true)

  Timers:CreateTimer(1, function()
    local teamID = PlayerResource:GetTeam( hero:GetPlayerID() )
    local color = self.m_TeamColors[teamID]
    hero:SetCustomHealthLabel( GetTeamName( teamID ), color[1], color[2], color[3])
  end)


  hero.lastDamagedBy = nil

  Physics:Unit(hero)
  hero:SetMass(100)
  --hero:Slide(true)
  --hero:SkipSlide(30)
  hero:SetPhysicsFriction(.05)
  hero:FollowNavMesh(false)
  hero:Hibernate(false)
  --hero:SetSlideMultiplier(.5)
  hero:SetNavCollisionType(PHYSICS_NAV_NONE)
  hero:SetAutoUnstuck(false)
  hero:SetPhysicsAcceleration(Vector(0,0,-300))

  local collider=  hero:AddColliderFromProfile("momentum")
  collider.radius = 200
  collider.blockRadius = 150
  collider.elasticity = 0
  collider.test = function(self, collider, collided)
    return IsPhysicsUnit(collided) and collided.IsRealHero and collided:IsRealHero()
  end

  --hero:

  --hero:AddNewModifier(hero, nil, "modifier_tutorial_forceanimation", {activity=ACT_DOTA_NIAN_INTRO_LEAP, loop=0, duration=5})
  --if true then
  --  return
  --end

  local horn = Entities:CreateByClassname("prop_dynamic")
  hero.horn = horn
  horn:SetModel("models/creeps/nian/nian_horn.vmdl")

  local tail = Entities:CreateByClassname("prop_dynamic")
  hero.tail = tail
  --tail = Entities:CreateByClassname("dota_item_wearable")
  --tail:SetAbsOrigin(Vector(0,0,200))
  tail:SetModel("models/creeps/nian/nian_tail.vmdl")

  --hero:SetForwardVector(Vector(1,0,0))
  hero:SetForwardVector(Vector(1,0,0))
  hero:Stop()
  local angles = hero:GetAngles()
  local forward = hero:GetForwardVector()

  Timers:CreateTimer(.03, function()
    hero:Stop()
    tail:SetAbsOrigin(hero:GetAbsOrigin() + Vector(-110,0,-110))
    tail:SetAngles(angles.x + 45, angles.y + 10, angles.z)
    tail:SetParent(hero, "attach_stump")

    horn:SetAngles(angles.x - 15, angles.y - 2, angles.z - 20)
    horn:SetAbsOrigin(hero:GetAbsOrigin() + Vector(-15,-90,-130))
    horn:SetModelScale(.9)
    tail:SetModelScale(1.3)

    horn:SetParent(hero, "attach_mouthbase")
  end)

  for i=0,5 do
    local abil = hero:GetAbilityByIndex(i)
    abil:SetLevel(1)
  end

  for i=1,24 do
    hero:HeroLevelUp(false)
  end
  hero:SetAbilityPoints(0)
  hero.bFlying = false

  hero:OnPhysicsFrame(function(unit)
    local pos = unit:GetAbsOrigin()
    local groundPos = GetGroundPosition(pos, unit)

    if not unit.bFlying and pos.z > groundPos.z and unit:GetPhysicsVelocity():Length() > 50 then
      unit:PreventDI(true)
      unit:AddNewModifier(unit, nil, "modifier_pudge_meat_hook", {})
      unit.bFlying = true
    elseif unit.bFlying and pos.z <= groundPos.z then
      unit:PreventDI(false)
      unit.bFlying = false
      unit:RemoveModifierByName("modifier_pudge_meat_hook")
    end
  end)

  Timers:CreateTimer(.1, function()
    if hero:IsAlive() then
      if hero:GetAbsOrigin().z < 150 then
        -- knocked off map
        print(hero.lastDamagedBy)
        local damTable = {
          victim = hero,
          attacker = hero.lastDamagedBy or hero,
          damage = 1000,
          damage_type = DAMAGE_TYPE_PURE,
          damage_flags = 0
        }

        ApplyDamage(damTable)
      end
    end

    return .1
  end)
end

--[[
  This function is called once and only once when the game completely begins (about 0:00 on the clock).  At this point,
  gold will begin to go up in ticks if configured, creeps will spawn, towers will become damageable etc.  This function
  is useful for starting any game logic timers/thinkers, beginning the first round, etc.
]]
function GameMode:OnGameInProgress()
  print("[BAREBONES] The game has officially begun")

  local counts = 9

  Timers:CreateTimer(TOTAL_GAME_TIME / 2, function()    
    Say(nil, "5 minutes remaining!", false)
    Timers:CreateTimer(120, function()
      Say(nil, "3 minutes remaining!", false)
      Timers:CreateTimer(60, function()
        Say(nil, "2 minutes remaining!", false)
        Timers:CreateTimer(60, function()
          Say(nil, "1 minute remaining!", false)
          Timers:CreateTimer(50, function()
            local msg = {
              message = tostring(counts),
              duration = 0.9
            }
            FireGameEvent("show_center_message", msg)
            counts = counts - 1
            if counts == 0 then
              -- game is done
              -- figure out winner
              local nTeamID = 0
              local winner = 0
              local maxKills = -1
              local minDeaths = 1000
              for i=0,9 do
                if PlayerResource:GetPlayer(i) ~= nil then
                  local kills = PlayerResource:GetKills(i)
                  local deaths = PlayerResource:GetDeaths(i)
                  if kills > maxKills or (kills == maxKills and deaths < minDeaths) or (kills == maxKills and deaths == minDeaths 
                      and PlayerResource:GetKillsDoneToHero(i, winner) > PlayerResource:GetKillsDoneToHero(winner, i)) then
                    winner = i
                    nTeamID = PlayerResource:GetTeam(i)
                    maxKills = kills
                    minDeaths = deaths
                  end
                end
              end

              print("game winner: " .. nTeamID)
              print("pIDtoTeam: " .. self.pIDtoTeam[winner])

              statcollection.sendStats()

              GameRules:SetCustomVictoryMessage( self.m_VictoryMessages[nTeamID] )
              GameRules:SetGameWinner( nTeamID )
            else
              return 1
            end
          end)
        end)
      end)
    end)
  end)
end




-- Cleanup a player when they leave
function GameMode:OnDisconnect(keys)
  print('[BAREBONES] Player Disconnected ' .. tostring(keys.userid))
  PrintTable(keys)

  local name = keys.name
  local networkid = keys.networkid
  local reason = keys.reason
  local userid = keys.userid

end
-- The overall game state has changed
function GameMode:OnGameRulesStateChange(keys)
  print("[BAREBONES] GameRules State Changed")
  PrintTable(keys)

  local newState = GameRules:State_Get()
  if newState == DOTA_GAMERULES_STATE_WAIT_FOR_PLAYERS_TO_LOAD then
    self.bSeenWaitForPlayers = true
  elseif newState == DOTA_GAMERULES_STATE_INIT then
    Timers:RemoveTimer("alljointimer")
  elseif newState == DOTA_GAMERULES_STATE_HERO_SELECTION then
    local et = 6
    if self.bSeenWaitForPlayers then
      et = .01
    end
    Timers:CreateTimer("alljointimer", {
      useGameTime = true,
      endTime = et,
      callback = function()
        if PlayerResource:HaveAllPlayersJoined() then
          GameMode:PostLoadPrecache()
          GameMode:OnAllPlayersLoaded()
          return 
        end
        return 1
      end
      })
  elseif newState == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
    GameMode:OnGameInProgress()
  end
end

-- An NPC has spawned somewhere in game.  This includes heroes
function GameMode:OnNPCSpawned(keys)
  --print("[BAREBONES] NPC Spawned")
  --PrintTable(keys)
  local npc = EntIndexToHScript(keys.entindex)

  if npc:IsRealHero() and npc.bFirstSpawned == nil then
    npc.bFirstSpawned = true
    GameMode:OnHeroInGame(npc)
  end
end

-- An entity somewhere has been hurt.  This event fires very often with many units so don't do too many expensive
-- operations here
function GameMode:OnEntityHurt(keys)
  --print("[BAREBONES] Entity Hurt")
  --PrintTable(keys)
  local entCause = EntIndexToHScript(keys.entindex_attacker)
  local entVictim = EntIndexToHScript(keys.entindex_killed)
end

-- An item was picked up off the ground
function GameMode:OnItemPickedUp(keys)
  --print ( '[BAREBONES] OnItemPurchased' )
  --PrintTable(keys)

  local heroEntity = EntIndexToHScript(keys.HeroEntityIndex)
  local itemEntity = EntIndexToHScript(keys.ItemEntityIndex)
  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local itemname = keys.itemname
end

-- A player has reconnected to the game.  This function can be used to repaint Player-based particles or change
-- state as necessary
function GameMode:OnPlayerReconnect(keys)
  print ( '[BAREBONES] OnPlayerReconnect' )
  PrintTable(keys) 
end

-- An item was purchased by a player
function GameMode:OnItemPurchased( keys )
  print ( '[BAREBONES] OnItemPurchased' )
  PrintTable(keys)

  -- The playerID of the hero who is buying something
  local plyID = keys.PlayerID
  if not plyID then return end

  -- The name of the item purchased
  local itemName = keys.itemname 
  
  -- The cost of the item purchased
  local itemcost = keys.itemcost
  
end

-- An ability was used by a player
function GameMode:OnAbilityUsed(keys)
  --print('[BAREBONES] AbilityUsed')
  --PrintTable(keys)

  local player = EntIndexToHScript(keys.PlayerID)
  local abilityname = keys.abilityname
end

-- A non-player entity (necro-book, chen creep, etc) used an ability
function GameMode:OnNonPlayerUsedAbility(keys)
  --print('[BAREBONES] OnNonPlayerUsedAbility')
  --PrintTable(keys)

  local abilityname=  keys.abilityname
end

-- A player changed their name
function GameMode:OnPlayerChangedName(keys)
  --print('[BAREBONES] OnPlayerChangedName')
  --PrintTable(keys)

  local newName = keys.newname
  local oldName = keys.oldName
end

-- A player leveled up an ability
function GameMode:OnPlayerLearnedAbility( keys)
  --print ('[BAREBONES] OnPlayerLearnedAbility')
  --PrintTable(keys)

  local player = EntIndexToHScript(keys.player)
  local abilityname = keys.abilityname
end

-- A channelled ability finished by either completing or being interrupted
function GameMode:OnAbilityChannelFinished(keys)
  --print ('[BAREBONES] OnAbilityChannelFinished')
  --PrintTable(keys)

  local abilityname = keys.abilityname
  local interrupted = keys.interrupted == 1
end

-- A player leveled up
function GameMode:OnPlayerLevelUp(keys)
  --print ('[BAREBONES] OnPlayerLevelUp')
  --PrintTable(keys)

  local player = EntIndexToHScript(keys.player)
  local level = keys.level
end

-- A player last hit a creep, a tower, or a hero
function GameMode:OnLastHit(keys)
  --print ('[BAREBONES] OnLastHit')
  --PrintTable(keys)

  local isFirstBlood = keys.FirstBlood == 1
  local isHeroKill = keys.HeroKill == 1
  local isTowerKill = keys.TowerKill == 1
  local player = PlayerResource:GetPlayer(keys.PlayerID)
end

-- A tree was cut down by tango, quelling blade, etc
function GameMode:OnTreeCut(keys)
  --print ('[BAREBONES] OnTreeCut')
  --PrintTable(keys)

  local treeX = keys.tree_x
  local treeY = keys.tree_y
end

-- A rune was activated by a player
function GameMode:OnRuneActivated (keys)
 -- print ('[BAREBONES] OnRuneActivated')
  --PrintTable(keys)

  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local rune = keys.rune

  --[[ Rune Can be one of the following types
  DOTA_RUNE_DOUBLEDAMAGE
  DOTA_RUNE_HASTE
  DOTA_RUNE_HAUNTED
  DOTA_RUNE_ILLUSION
  DOTA_RUNE_INVISIBILITY
  DOTA_RUNE_MYSTERY
  DOTA_RUNE_RAPIER
  DOTA_RUNE_REGENERATION
  DOTA_RUNE_SPOOKY
  DOTA_RUNE_TURBO
  ]]
end

-- A player took damage from a tower
function GameMode:OnPlayerTakeTowerDamage(keys)
  --print ('[BAREBONES] OnPlayerTakeTowerDamage')
  --PrintTable(keys)

  local player = PlayerResource:GetPlayer(keys.PlayerID)
  local damage = keys.damage
end

-- A player picked a hero
function GameMode:OnPlayerPickHero(keys)
  --print ('[BAREBONES] OnPlayerPickHero')
  --PrintTable(keys)

  local heroClass = keys.hero
  local heroEntity = EntIndexToHScript(keys.heroindex)
  local player = EntIndexToHScript(keys.player)
end

-- A player killed another player in a multi-team context
function GameMode:OnTeamKillCredit(keys)
  print ('[BAREBONES] OnTeamKillCredit')
  PrintTable(keys)

  local killerPlayer = PlayerResource:GetPlayer(keys.killer_userid)
  local victimPlayer = PlayerResource:GetPlayer(keys.victim_userid)
  local numKills = keys.herokills
  local killerTeamNumber = keys.teamnumber
end

-- An entity died
function GameMode:OnEntityKilled( keys )
  print( '[BAREBONES] OnEntityKilled Called' )
  PrintTable( keys )
  
  -- The Unit that was Killed
  local killedUnit = EntIndexToHScript( keys.entindex_killed )
  -- The Killing entity
  local killerEntity = nil

  if keys.entindex_attacker ~= nil then
    killerEntity = EntIndexToHScript( keys.entindex_attacker )
  end

  if killedUnit:IsRealHero() then 
    print ("KILLEDKILLER: " .. killedUnit:GetName() .. " -- " .. killerEntity:GetName())
    if killedUnit:GetTeam() == DOTA_TEAM_BADGUYS and killerEntity:GetTeam() == DOTA_TEAM_GOODGUYS then
      self.nRadiantKills = self.nRadiantKills + 1
      if END_GAME_ON_KILLS and self.nRadiantKills >= KILLS_TO_END_GAME_FOR_TEAM then
        GameRules:SetSafeToLeave( true )
        GameRules:SetGameWinner( DOTA_TEAM_GOODGUYS )
      end
    elseif killedUnit:GetTeam() == DOTA_TEAM_GOODGUYS and killerEntity:GetTeam() == DOTA_TEAM_BADGUYS then
      self.nDireKills = self.nDireKills + 1
      if END_GAME_ON_KILLS and self.nDireKills >= KILLS_TO_END_GAME_FOR_TEAM then
        GameRules:SetSafeToLeave( true )
        GameRules:SetGameWinner( DOTA_TEAM_BADGUYS )
      end
    end

    if SHOW_KILLS_ON_TOPBAR then
      GameRules:GetGameModeEntity():SetTopBarTeamValue ( DOTA_TEAM_BADGUYS, self.nDireKills )
      GameRules:GetGameModeEntity():SetTopBarTeamValue ( DOTA_TEAM_GOODGUYS, self.nRadiantKills )
    end

    killedUnit:SetTimeUntilRespawn(10)

    local topKills = 0
    local nextKills = 0

    for i=0,9 do
      if PlayerResource:GetPlayer(i) ~= nil then
        local kills = PlayerResource:GetKills(i)
        if kills > topKills then
          nextKills = topKills
          topKills = kills
        elseif kills > nextKills then
          nextKills = kills
        end
      end
    end

    GameRules:GetGameModeEntity():SetTopBarTeamValue ( DOTA_TEAM_BADGUYS, nextKills )
    GameRules:GetGameModeEntity():SetTopBarTeamValue ( DOTA_TEAM_GOODGUYS, topKills )
  end

  -- Put code here to handle when an entity gets killed
end


-- This function initializes the game mode and is called before anyone loads into the game
-- It can be used to pre-initialize any values/tables that will be needed later
function GameMode:InitGameMode()
  GameMode = self
  print('[BAREBONES] Starting to load Barebones gamemode...')

  -- Setup rules
  GameRules:SetHeroRespawnEnabled( ENABLE_HERO_RESPAWN )
  GameRules:SetUseUniversalShopMode( UNIVERSAL_SHOP_MODE )
  GameRules:SetSameHeroSelectionEnabled( ALLOW_SAME_HERO_SELECTION )
  GameRules:SetHeroSelectionTime( HERO_SELECTION_TIME )
  GameRules:SetPreGameTime( PRE_GAME_TIME)
  GameRules:SetPostGameTime( POST_GAME_TIME )
  GameRules:SetTreeRegrowTime( TREE_REGROW_TIME )
  GameRules:SetUseCustomHeroXPValues ( USE_CUSTOM_XP_VALUES )
  GameRules:SetGoldPerTick(GOLD_PER_TICK)
  GameRules:SetGoldTickTime(GOLD_TICK_TIME)
  GameRules:SetRuneSpawnTime(RUNE_SPAWN_TIME)
  GameRules:SetUseBaseGoldBountyOnHeroes(USE_STANDARD_HERO_GOLD_BOUNTY)
  GameRules:SetHeroMinimapIconScale( MINIMAP_ICON_SIZE )
  GameRules:SetCreepMinimapIconScale( MINIMAP_CREEP_ICON_SIZE )
  GameRules:SetRuneMinimapIconScale( MINIMAP_RUNE_ICON_SIZE )
  print('[BAREBONES] GameRules set')

  InitLogFile( "log/barebones.txt","")

  -- Event Hooks
  -- All of these events can potentially be fired by the game, though only the uncommented ones have had
  -- Functions supplied for them.  If you are interested in the other events, you can uncomment the
  -- ListenToGameEvent line and add a function to handle the event
  ListenToGameEvent('dota_player_gained_level', Dynamic_Wrap(GameMode, 'OnPlayerLevelUp'), self)
  ListenToGameEvent('dota_ability_channel_finished', Dynamic_Wrap(GameMode, 'OnAbilityChannelFinished'), self)
  ListenToGameEvent('dota_player_learned_ability', Dynamic_Wrap(GameMode, 'OnPlayerLearnedAbility'), self)
  ListenToGameEvent('entity_killed', Dynamic_Wrap(GameMode, 'OnEntityKilled'), self)
  ListenToGameEvent('player_connect_full', Dynamic_Wrap(GameMode, 'OnConnectFull'), self)
  ListenToGameEvent('player_disconnect', Dynamic_Wrap(GameMode, 'OnDisconnect'), self)
  ListenToGameEvent('dota_item_purchased', Dynamic_Wrap(GameMode, 'OnItemPurchased'), self)
  ListenToGameEvent('dota_item_picked_up', Dynamic_Wrap(GameMode, 'OnItemPickedUp'), self)
  ListenToGameEvent('last_hit', Dynamic_Wrap(GameMode, 'OnLastHit'), self)
  ListenToGameEvent('dota_non_player_used_ability', Dynamic_Wrap(GameMode, 'OnNonPlayerUsedAbility'), self)
  ListenToGameEvent('player_changename', Dynamic_Wrap(GameMode, 'OnPlayerChangedName'), self)
  ListenToGameEvent('dota_rune_activated_server', Dynamic_Wrap(GameMode, 'OnRuneActivated'), self)
  ListenToGameEvent('dota_player_take_tower_damage', Dynamic_Wrap(GameMode, 'OnPlayerTakeTowerDamage'), self)
  ListenToGameEvent('tree_cut', Dynamic_Wrap(GameMode, 'OnTreeCut'), self)
  ListenToGameEvent('entity_hurt', Dynamic_Wrap(GameMode, 'OnEntityHurt'), self)
  ListenToGameEvent('player_connect', Dynamic_Wrap(GameMode, 'PlayerConnect'), self)
  ListenToGameEvent('dota_player_used_ability', Dynamic_Wrap(GameMode, 'OnAbilityUsed'), self)
  ListenToGameEvent('game_rules_state_change', Dynamic_Wrap(GameMode, 'OnGameRulesStateChange'), self)
  ListenToGameEvent('npc_spawned', Dynamic_Wrap(GameMode, 'OnNPCSpawned'), self)
  ListenToGameEvent('dota_player_pick_hero', Dynamic_Wrap(GameMode, 'OnPlayerPickHero'), self)
  ListenToGameEvent('dota_team_kill_credit', Dynamic_Wrap(GameMode, 'OnTeamKillCredit'), self)
  ListenToGameEvent("player_reconnected", Dynamic_Wrap(GameMode, 'OnPlayerReconnect'), self)
  --ListenToGameEvent('player_spawn', Dynamic_Wrap(GameMode, 'OnPlayerSpawn'), self)
  --ListenToGameEvent('dota_unit_event', Dynamic_Wrap(GameMode, 'OnDotaUnitEvent'), self)
  --ListenToGameEvent('nommed_tree', Dynamic_Wrap(GameMode, 'OnPlayerAteTree'), self)
  --ListenToGameEvent('player_completed_game', Dynamic_Wrap(GameMode, 'OnPlayerCompletedGame'), self)
  --ListenToGameEvent('dota_match_done', Dynamic_Wrap(GameMode, 'OnDotaMatchDone'), self)
  --ListenToGameEvent('dota_combatlog', Dynamic_Wrap(GameMode, 'OnCombatLogEvent'), self)
  --ListenToGameEvent('dota_player_killed', Dynamic_Wrap(GameMode, 'OnPlayerKilled'), self)
  --ListenToGameEvent('player_team', Dynamic_Wrap(GameMode, 'OnPlayerTeam'), self)


  self.m_TeamColors = {}
  self.m_TeamColors[DOTA_TEAM_GOODGUYS] = { 255, 0, 0 }
  self.m_TeamColors[DOTA_TEAM_BADGUYS] = { 0, 255, 0 }
  self.m_TeamColors[DOTA_TEAM_CUSTOM_1] = { 0, 0, 255 }
  self.m_TeamColors[DOTA_TEAM_CUSTOM_2] = { 255, 128, 64 }
  self.m_TeamColors[DOTA_TEAM_CUSTOM_3] = { 255, 255, 0 }
  self.m_TeamColors[DOTA_TEAM_CUSTOM_4] = { 128, 255, 0 }
  self.m_TeamColors[DOTA_TEAM_CUSTOM_5] = { 128, 0, 255 }
  self.m_TeamColors[DOTA_TEAM_CUSTOM_6] = { 255, 0, 128 }
  self.m_TeamColors[DOTA_TEAM_CUSTOM_7] = { 0, 255, 255 }
  self.m_TeamColors[DOTA_TEAM_CUSTOM_8] = { 255, 255, 255 }

  self.pIDtoTeam = {}
  self.pIDtoTeam[0] = DOTA_TEAM_GOODGUYS
  self.pIDtoTeam[1] = DOTA_TEAM_BADGUYS
  self.pIDtoTeam[2] = DOTA_TEAM_CUSTOM_1
  self.pIDtoTeam[3] = DOTA_TEAM_CUSTOM_2
  self.pIDtoTeam[4] = DOTA_TEAM_CUSTOM_3
  self.pIDtoTeam[5] = DOTA_TEAM_CUSTOM_4
  self.pIDtoTeam[6] = DOTA_TEAM_CUSTOM_5
  self.pIDtoTeam[7] = DOTA_TEAM_CUSTOM_6
  self.pIDtoTeam[8] = DOTA_TEAM_CUSTOM_7
  self.pIDtoTeam[9] = DOTA_TEAM_CUSTOM_8

  self.m_VictoryMessages = {}
  self.m_VictoryMessages[DOTA_TEAM_GOODGUYS] = "#VictoryMessage_GoodGuys"
  self.m_VictoryMessages[DOTA_TEAM_BADGUYS] = "#VictoryMessage_BadGuys"
  self.m_VictoryMessages[DOTA_TEAM_CUSTOM_1] = "#VictoryMessage_Custom1"
  self.m_VictoryMessages[DOTA_TEAM_CUSTOM_2] = "#VictoryMessage_Custom2"
  self.m_VictoryMessages[DOTA_TEAM_CUSTOM_3] = "#VictoryMessage_Custom3"
  self.m_VictoryMessages[DOTA_TEAM_CUSTOM_4] = "#VictoryMessage_Custom4"
  self.m_VictoryMessages[DOTA_TEAM_CUSTOM_5] = "#VictoryMessage_Custom5"
  self.m_VictoryMessages[DOTA_TEAM_CUSTOM_6] = "#VictoryMessage_Custom6"
  self.m_VictoryMessages[DOTA_TEAM_CUSTOM_7] = "#VictoryMessage_Custom7"
  self.m_VictoryMessages[DOTA_TEAM_CUSTOM_8] = "#VictoryMessage_Custom8"

  self.m_GatheredShuffledTeams = {}
  self.m_PlayerTeamAssignments = {}
  self.m_NumAssignedPlayers = 0

  self.TEAM_KILLS_TO_WIN = 15

  GameRules:SetCustomVictoryMessageDuration( 0 )
  GameRules:SetHideKillMessageHeaders( true )


  -- Commands can be registered for debugging purposes or as functions that can be called by the custom Scaleform UI
  Convars:RegisterCommand( "command_example", Dynamic_Wrap(GameMode, 'ExampleConsoleCommand'), "A console command example", 0 )
  
  -- Fill server with fake clients
  -- Fake clients don't use the default bot AI for buying items or moving down lanes and are sometimes necessary for debugging
  Convars:RegisterCommand('fake', function()
    -- Check if the server ran it
    if not Convars:GetCommandClient() then
      -- Create fake Players
      SendToServerConsole('dota_create_fake_clients')
        
      Timers:CreateTimer('assign_fakes', {
        useGameTime = false,
        endTime = Time(),
        callback = function(barebones, args)
          local userID = 20
          for i=0, 9 do
            userID = userID + 1
            -- Check if this player is a fake one
            if PlayerResource:IsFakeClient(i) then
              -- Grab player instance
              local ply = PlayerResource:GetPlayer(i)
              -- Make sure we actually found a player instance
              if ply then
                CreateHeroForPlayer('npc_dota_hero_axe', ply)
                self:OnConnectFull({
                  userid = userID,
                  index = ply:entindex()-1
                })

                ply:GetAssignedHero():SetControllableByPlayer(0, true)
              end
            end
          end
        end})
    end
  end, 'Connects and assigns fake Players.', 0)

  --[[This block is only used for testing events handling in the event that Valve adds more in the future
  Convars:RegisterCommand('events_test', function()
      GameMode:StartEventTest()
    end, "events test", 0)]]

  -- Change random seed
  local timeTxt = string.gsub(string.gsub(GetSystemTime(), ':', ''), '0','')
  math.randomseed(tonumber(timeTxt))

  -- Initialized tables for tracking state
  self.vUserIds = {}
  self.vSteamIds = {}
  self.vBots = {}
  self.vBroadcasters = {}

  self.vPlayers = {}
  self.vRadiant = {}
  self.vDire = {}

  self.nRadiantKills = 0
  self.nDireKills = 0

  self.bSeenWaitForPlayers = false

  print('[BAREBONES] Done loading Barebones gamemode!\n\n')
end

mode = nil

-- This function is called as the first player loads and sets up the GameMode parameters
function GameMode:CaptureGameMode()
  if mode == nil then
    -- Set GameMode parameters
    mode = GameRules:GetGameModeEntity()        
    mode:SetRecommendedItemsDisabled( RECOMMENDED_BUILDS_DISABLED )
    mode:SetCameraDistanceOverride( CAMERA_DISTANCE_OVERRIDE )
    mode:SetCustomBuybackCostEnabled( CUSTOM_BUYBACK_COST_ENABLED )
    mode:SetCustomBuybackCooldownEnabled( CUSTOM_BUYBACK_COOLDOWN_ENABLED )
    mode:SetBuybackEnabled( BUYBACK_ENABLED )
    mode:SetTopBarTeamValuesOverride ( USE_CUSTOM_TOP_BAR_VALUES )
    mode:SetTopBarTeamValuesVisible( TOP_BAR_VISIBLE )
    mode:SetUseCustomHeroLevels ( USE_CUSTOM_HERO_LEVELS )
    mode:SetCustomHeroMaxLevel ( MAX_LEVEL )
    mode:SetCustomXPRequiredToReachNextLevel( XP_PER_LEVEL_TABLE )

    --mode:SetBotThinkingEnabled( USE_STANDARD_DOTA_BOT_THINKING )
    mode:SetTowerBackdoorProtectionEnabled( ENABLE_TOWER_BACKDOOR_PROTECTION )

    mode:SetFogOfWarDisabled(DISABLE_FOG_OF_WAR_ENTIRELY)
    mode:SetGoldSoundDisabled( DISABLE_GOLD_SOUNDS )
    mode:SetRemoveIllusionsOnDeath( REMOVE_ILLUSIONS_ON_DEATH )


    --GameRules:GetGameModeEntity():SetThink( "Think", self, "GlobalThink", 2 )

    self:SetupMultiTeams()
    self:OnFirstPlayerLoaded()
  end 
end

-- Multiteam support is unfinished currently
function GameMode:SetupMultiTeams()
  MultiTeam:start()
  MultiTeam:CreateTeam("team1")
  MultiTeam:CreateTeam("team2")
end

-- This function is called 1 to 2 times as the player connects initially but before they 
-- have completely connected
function GameMode:PlayerConnect(keys)
  print('[BAREBONES] PlayerConnect')
  PrintTable(keys)
  
  if keys.bot == 1 then
    -- This user is a Bot, so add it to the bots table
    self.vBots[keys.userid] = 1
  end
end

-- This function is called once when the player fully connects and becomes "Ready" during Loading
function GameMode:OnConnectFull(keys)
  print ('[BAREBONES] OnConnectFull')
  PrintTable(keys)
  GameMode:CaptureGameMode()
  
  local entIndex = keys.index+1
  -- The Player entity of the joining user
  local ply = EntIndexToHScript(entIndex)
  
  -- The Player ID of the joining player
  local playerID = ply:GetPlayerID()
  
  -- Update the user ID table with this user
  self.vUserIds[keys.userid] = ply

  -- Update the Steam ID table
  self.vSteamIds[PlayerResource:GetSteamAccountID(playerID)] = ply
  
  -- If the player is a broadcaster flag it in the Broadcasters table
  if PlayerResource:IsBroadcaster(playerID) then
    self.vBroadcasters[keys.userid] = 1
    return
  end
end

-- This is an example console command
function GameMode:ExampleConsoleCommand()
  print( '******* Example Console Command ***************' )
  local cmdPlayer = Convars:GetCommandClient()
  if cmdPlayer then
    local playerID = cmdPlayer:GetPlayerID()
    if playerID ~= nil and playerID ~= -1 then
      -- Do something here for the player who called this command
      PlayerResource:ReplaceHeroWith(playerID, "npc_dota_hero_viper", 1000, 1000)
    end
  end

  print( '*********************************************' )
end

--require('eventtest')
--GameMode:StartEventTest()