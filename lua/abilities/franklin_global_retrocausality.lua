if franklin_global_retrocausality == nil then franklin_global_retrocausality = class({}) end

LinkLuaModifier( "modifier_franklin_global_retrocausality", "abilities/franklin_global_retrocausality.lua", LUA_MODIFIER_MOTION_NONE )

function franklin_global_retrocausality:IsRefreshable()
   return false
end

function franklin_global_retrocausality:OnSpellStart()
	local duration = self:GetSpecialValueFor(  "tooltip_duration" )

	local units = FindUnitsInRadius( self:GetCaster():GetTeamNumber(), self:GetCaster():GetOrigin(), self:GetCaster(), 999999, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NOT_ILLUSIONS, 0, false )
	if #units > 0 then
		for _,unit in pairs(units) do
			unit:AddNewModifier( self:GetCaster(), self, "modifier_franklin_global_retrocausality", { duration = duration } )
		end
	end
  EmitSoundOn("Hero_ObsidianDestroyer.SanityEclipse.Cast", self:GetCaster())
end

if modifier_franklin_global_retrocausality == nil then modifier_franklin_global_retrocausality = class({}) end


function modifier_franklin_global_retrocausality:IsPurgable()
    return false
end

function modifier_franklin_global_retrocausality:IsHidden()
    return true
end


function modifier_franklin_global_retrocausality:IsPurgable()
	return false
end

function modifier_franklin_global_retrocausality:RemoveOnDeath()
	return false
end


function modifier_franklin_global_retrocausality:GetStatusEffectName()
	return "particles/status_fx/status_effect_ancestral_spirit.vpcf"
end


function modifier_franklin_global_retrocausality:StatusEffectPriority()
	return 1000
end

function modifier_franklin_global_retrocausality:GetHeroEffectName()
	return "particles/units/heroes/hero_sven/sven_gods_strength_hero_effect.vpcf"
end

function modifier_franklin_global_retrocausality:HeroEffectPriority()
	return 100
end

function modifier_franklin_global_retrocausality:GetEffectName()
	return "particles/units/heroes/hero_dazzle/dazzle_armor_friend_ring.vpcf"
end

function modifier_franklin_global_retrocausality:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end

function modifier_franklin_global_retrocausality:OnCreated(params)
	if IsServer() then
	    local warp = ParticleManager:CreateParticle("particles/hero_franklin/franklin_global_retrocausality_screen.vpcf", PATTACH_EYES_FOLLOW, self:GetParent())
	    self:AddParticle( warp, false, false, -1, false, true )
  	end
end

function modifier_franklin_global_retrocausality:OnDestroy()
	if IsServer() then
    	EmitSoundOn("Hero_Oracle.FalsePromise.FP", self:GetParent())
  	end
end

function modifier_franklin_global_retrocausality:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_TOTALDAMAGEOUTGOING_PERCENTAGE
    }

    return funcs
end


function modifier_franklin_global_retrocausality:GetModifierTotalDamageOutgoing_Percentage ( params )
    return self:GetAbility():GetSpecialValueFor("bonus_damage_outgoing")
end

function franklin_global_retrocausality:GetAbilityTextureName() return self.BaseClass.GetAbilityTextureName(self)  end 

