local combat = {}

for i = 1, 1 do
	combat[i] = createCombatObject()
	setCombatParam(combat[i], COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
	setCombatParam(combat[i], COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)
	setCombatParam(combat[i], COMBAT_PARAM_EFFECT, CONST_ME_SMALLCLOUDS)

	local condition = createConditionObject(CONDITION_CURSED)
	setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)

	local damage = i
	addDamageCondition(condition, 1, 4000, -damage)
	for j = 1, 19 do
		damage = damage * 1.25
		addDamageCondition(condition, 1, 4000, -damage)
	end

	setCombatCondition(combat[i], condition)
end

function onCastSpell(cid, var)
	return doCombat(cid, combat[math.random(1, 1)], var)
end
