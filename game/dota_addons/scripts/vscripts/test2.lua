function swipeLeft2(keys)
  local caster = keys.caster
  local radius = 300
  local testPoint = caster:GetAbsOrigin() + RotatePosition(Vector(0,0,0), QAngle(0,35,0), caster:GetForwardVector()) * (radius - 50)
  local enemyHeroes = FindUnitsInRadius(caster:GetTeam(), testPoint, nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO, 0, 0, false)

  --DebugDrawCircle(testPoint, Vector(255,0,0), 5, radius, true, 3)

  print("TARGETS")
  for i,v in ipairs(enemyHeroes) do
    damageAndPush(caster, v, keys.Damage, keys.Power)
    v:EmitSound("CNY_Beast.Bash")
  end
end

function swipeRight2(keys)
  local caster = keys.caster
  local radius = 300
  local testPoint = caster:GetAbsOrigin() + RotatePosition(Vector(0,0,0), QAngle(0,-35,0), caster:GetForwardVector()) * (radius - 50)
  local enemyHeroes = FindUnitsInRadius(caster:GetTeam(), testPoint, nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO, 0, 0, false)

  --DebugDrawCircle(testPoint, Vector(255,0,0), 5, radius, true, 3)

  print("TARGETS")
  for i,v in pairs(enemyHeroes) do
    damageAndPush(caster, v, keys.Damage, keys.Power)
    v:EmitSound("CNY_Beast.Bash")
  end
end

function leap2(keys)
  local caster = keys.caster
  
  Timers:CreateTimer(.3, function() caster:AddPhysicsVelocity(caster:GetForwardVector() * keys.Power) end)
  caster:AddNewModifier(caster, nil, "modifier_rooted", {duration=1})
  --caster:AddNewModifier(caster, nil, "modifier_tutorial_forceanimation", {activity=ACT_DOTA_LEAP_STUN,loop=0})
end

function roar2(keys)
  local caster = keys.caster
  local radius = 525
  local testPoint = caster:GetAbsOrigin()
  local enemyHeroes = FindUnitsInRadius(caster:GetTeam(), testPoint, nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO, 0, 0, false)

  --DebugDrawCircle(testPoint, Vector(255,0,0), 5, radius, true, 3)

  print("TARGETS")
  for i,v in pairs(enemyHeroes) do
    damageAndPush(caster, v, keys.Damage, keys.Power)
    v:EmitSound("CNY_Beast.Bash")
  end
end

function tailSlam2(keys)
  local caster = keys.caster
  local radius = 350
  local testPoint = caster:GetAbsOrigin() + caster:GetForwardVector() * -300
  local enemyHeroes = FindUnitsInRadius(caster:GetTeam(), testPoint, nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO, 0, 0, false)

  --DebugDrawCircle(testPoint, Vector(255,0,0), 5, radius, true, 3)

  local particle = ParticleManager:CreateParticle("particles/brewmaster_thunder_clap.vpcf", PATTACH_POINT, caster)
  ParticleManager:SetParticleControl(particle, 0, testPoint)
  ParticleManager:SetParticleControl(particle, 1, Vector(radius, 0, 0))
  --ParticleManager:SetParticleControlEnt(particle, 3, unit, 1, "follow_origin", unit:GetAbsOrigin(), true)

  print("TARGETS")
  for i,v in pairs(enemyHeroes) do
    damageAndPush(caster, v, keys.Damage, keys.Power)
    v:EmitSound("CNY_Beast.Bash")
  end
end

function shootStart2(keys)
  local caster = keys.caster
  caster.shotStart = GameRules:GetGameTime()
end

function shootEnd2(keys)
  local caster = keys.caster
  local chargeTime = GameRules:GetGameTime() - caster.shotStart

  if chargeTime > 3 then
    chargeTime = 3
  elseif chargeTime < .2 then
    chargeTime = .2
  end

  local unit = CreateUnitByName('npc_dummy_unit', caster:GetAbsOrigin() + caster:GetForwardVector() * 150, true, caster, caster, caster:GetTeamNumber())
  unit:FindAbilityByName("reflex_dummy_unit"):SetLevel(1)
  --unit:SetModel("models/props_gameplay/rune_doubledamage01.vmdl")
  --unit:SetOriginalModel("models/props_gameplay/rune_doubledamage01.vmdl")

  local particle = ParticleManager:CreateParticle("particles/reflex_particles/blue_orb.vpcf", PATTACH_ABSORIGIN_FOLLOW, unit)
  ParticleManager:SetParticleControlEnt(particle, 3, unit, 1, "follow_origin", unit:GetAbsOrigin(), true)

  unit:AddNewModifier(unit, nil, "modifier_phased", {})

  Physics:Unit(unit)
  unit:SetPhysicsFriction(0)
  unit:FollowNavMesh(true)
  unit:Hibernate(false)
  unit:SetNavCollisionType(PHYSICS_NAV_BOUNCE)
  unit:SetAutoUnstuck(false)
  unit:SetMass(100)
  unit:SetNavGridLookahead(2)
  unit:SetGroundBehavior(PHYSICS_GRONUD_LOCK)

  local momCollider = unit:AddColliderFromProfile("momentum")
  momCollider.blockRadius = 0
  momCollider.elasticity = 0
  momCollider.radius = 200
  momCollider.test = function(self, collider, collided)
    return IsPhysicsUnit(collided) and collided.GetUnitName ~= nil and collided:GetUnitName() == "npc_dummy_unit"
  end

  local projCollider = unit:AddColliderFromProfile("delete")
  projCollider.radius = 100
  projCollider.test = function(self, collider, collided)
    return IsPhysicsUnit(collided) and collided.IsRealHero and collided:IsRealHero() and collided ~= caster
  end
  projCollider.preaction = function(self, collider, collided)
    print("damageandpush")
    collided:EmitSound("Hero_Lich.ChainFrostImpact.Hero")
    damageAndPush(caster, collided, 100 * chargeTime / 1.8, 200 * chargeTime / 1.8, collider.vVelocity:Normalized())
  end

  
  unit:AddPhysicsVelocity(caster:GetForwardVector() * 1350 * (chargeTime + .5))

  Timers:CreateTimer(10, function()
    if IsValidEntity(unit) then
      unit:RemoveSelf()
    end
  end)
end

--if hero == nil then
  --local hero = PlayerResource:GetPlayer(0):GetAssignedHero()
  --hero:EmitSound("CNY_Beast.Breath")
  --Physics:Unit(hero)
--end


function damageAndPush(source, target, damage, power, direction)
  if direction == nil then
    direction = (target:GetAbsOrigin() - source:GetAbsOrigin()):Normalized()
  end

  target.lastDamagedBy = source
  print("DAMAGE: " .. math.min(damage, target:GetHealth() - 1))

  local damTable = {
    victim = target,
    attacker = source,
    damage = math.min(damage, target:GetHealth() - 1),
    damage_type = DAMAGE_TYPE_PURE,
    damage_flags = 0
  }

  ApplyDamage(damTable)

  local scalar = math.pow(100 - target:GetHealthPercent(), 1.3) / 15 + .5
  print("--SCALAR: " .. scalar)
  target:AddPhysicsVelocity(power * direction * scalar)
end
--hero:AddNewModifier(hero, nil, "modifier_tutorial_forceanimation", {activity=ACT_DOTA_AREA_DENY,loop=0})
--hero:AddNewModifier(hero, nil, "modifier_tutorial_forceanimation", {activity=ACT_DOTA_CAST_ABILITY_6,loop=0})

