local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_NONE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)

local maxsummons = 3

function onCastSpell(cid, var)
	local summoncount = getCreatureSummons(cid)
	if #summoncount < 3 then
			mid = doSummonCreature("Demon2", getCreaturePosition(cid))
    			if mid == false then
				return false
			end
			doConvinceCreature(cid, mid)

	end
	return doCombat(cid, combat, var)
end