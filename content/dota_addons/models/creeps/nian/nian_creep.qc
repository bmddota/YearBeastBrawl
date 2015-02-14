// Created by Crowbar 0.24.0.0

$modelname "creeps/nian/nian_creep.mdl"

$bodygroup "default"
{
	studio "nian_creep_reference.smd"
}


$poseparameter "turn" -1 1 0

$cdmaterials ""

$texturegroup "skinfamilies"
{
	{
		"models\creeps\nian\nian_creep_body_color.vmt"
	}
	{
		"models\creeps\nian\nian_dire_body_color.vmt"
	}
}

$attachment "attach_mouthbase" "HeadEnd_JNT" -10 90 0 rotate 0 35 0
$attachment "attach_mouthend" "Head0_JNT" 500 400 0 rotate 0 0 0
$attachment "attach_attack2" "LeftPawA0_JNT" 0 0 0 rotate 0 0 0
$attachment "attach_attack4" "LeftWrist0_JNT" 0 0 0 rotate 0 0 0
$attachment "attach_attack1" "RightPawA0_JNT" 0 0 0 rotate 0 0 0
$attachment "attach_pindown" "RightArm3_JNT" -40 0 -50 rotate 0 90 -90
$attachment "attach_attack3" "RightWrist0_JNT" 0 0 0 rotate 0 0 0
$attachment "attach_hitloc" "Spine1_JNT" 0 0 0 rotate 0 0 0
$attachment "attach_stump" "Tail0_JNT" 50 0 0 rotate 0 0 0

$surfaceprop "default"

$contents "solid"

// $hboxset "default"
// $hbox 0 "Head0_JNT" -99.751656 -67.596214 -72.398041 99.043167 101.891579 72.398041
// $hbox 0 "LeftArm3_JNT" -18.540529 -75.454933 -37.910179 49.187206 30.479757 39.061184
// $hbox 0 "RightArm3_JNT" -49.18721 -30.479805 -39.061226 18.540527 75.454887 37.910137
// $hbox 0 "Spine2_JNT" -68.560661 -66.405434 -93.13369 83.994652 119.444443 93.13369
// $hbox 0 "LeftLeg3_JNT" -22.700401 -55.077801 -34.68248 33.849342 22.715042 28.33334
// $hbox 0 "RightLeg3_JNT" -33.849281 -22.715073 -28.333399 22.700462 55.07777 34.682419
// $hbox 0 "Root0_JNT" -90.798943 -111.634926 -70.628983 67.173157 63.254028 70.628983
// $hboxset "head"
// $hbox 0 "Head0_JNT" -99.751656 -67.596214 -72.398041 99.043167 101.891579 72.398041
// $hboxset "hands"
// $hbox 0 "LeftArm3_JNT" -18.540529 -75.454933 -37.910179 49.187206 30.479757 39.061184
// $hbox 0 "RightArm3_JNT" -49.18721 -30.479805 -39.061226 18.540527 75.454887 37.910137
// $hboxset "select_high"
// $hbox 0 "Spine2_JNT" -68.560661 -66.405434 -93.13369 83.994652 119.444443 93.13369
// $hbox 0 "Root0_JNT" -90.798943 -111.634926 -70.628983 67.173157 63.254028 70.628983
// $hboxset "feet"
// $hbox 0 "LeftLeg3_JNT" -22.700401 -55.077801 -34.68248 33.849342 22.715042 28.33334
// $hbox 0 "RightLeg3_JNT" -33.849281 -22.715073 -28.333399 22.700462 55.07777 34.682419
// $hboxset "select_low"
// $hbox 0 "Root0_JNT" -61.601322 -177.900528 -133.816406 192.221603 99.635872 133.816406

// NOTE: The following commented-out $definebone lines might be needed, as is often the case for view models. When needed, simply remove the two slashes '//' from the start of each line.
// $definebone "Root0_JNT" "" 0 187.403366 -89.328918 -1.570802 -1.548234 1.570802 0 0 0 0 0 0
// $definebone "RightThigh0_JNT" "Root0_JNT" -15.659813 -11.646042 34.84029 3.121401 0.191976 1.766182 0 0 0 0 0 0
// $definebone "RightLeg0_JNT" "Root0_JNT" -15.659813 -11.646042 34.84029 3.121401 0.191976 1.766182 0 0 0 0 0 0
// $definebone "Tail0_JNT" "Root0_JNT" -63.301971 -22.324188 -0.000004 0 0 -2.690122 0 0 0 0 0 0
// $definebone "LeftThigh0_JNT" "Root0_JNT" -15.659729 -11.645676 -34.840321 3.121401 0.191976 -1.375411 0 0 0 0 0 0
// $definebone "LeftLeg0_JNT" "Root0_JNT" -15.659729 -11.645676 -34.840321 3.121401 0.191976 -1.375411 0 0 0 0 0 0
// $definebone "Spine0_JNT" "Root0_JNT" 37.94878 -1.630371 0.000002 -3.141591 0 0.091547 0 0 0 0 0 0
// $definebone "RightLeg1_JNT" "RightLeg0_JNT" -91.828674 0.000175 -0.000092 0 0 1.223804 0 0 0 0 0 0
// $definebone "RightLeg2_JNT" "RightLeg1_JNT" -43.693729 0.000107 0 -0.069292 0.024232 -1.415063 0 0 0 0 0 0
// $definebone "RightLeg3_JNT" "RightLeg2_JNT" -49.295437 0 0.000053 0 0 0 0 0 0 0 0 0
// $definebone "RightRearPawA0_JNT" "RightLeg3_JNT" -6.270378 13.168846 1.213173 3.032365 -0.058043 -1.044339 0 0 0 0 0 0
// $definebone "Tail1_JNT" "Tail0_JNT" 38.471161 -0.000015 -0.000005 -0.000001 0 -0.102723 0 0 0 0 0 0
// $definebone "Tail2_JNT" "Tail1_JNT" 74.359306 -0.000031 0.000005 0 0 -0.089664 0 0 0 0 0 0
// $definebone "Tail3_JNT" "Tail2_JNT" 74.359497 0 -0.000003 0 0 -0.110536 0 0 0 0 0 0
// $definebone "Tail4_JNT" "Tail3_JNT" 74.336029 0 -0.000005 0.000013 0 -0.178803 0 0 0 0 0 0
// $definebone "Tail5_JNT" "Tail4_JNT" 74.340546 0.000015 0.000005 -0.000013 -0.000002 -0.138391 0 0 0 0 0 0
// $definebone "UpperTailEnd0_JNT" "Tail5_JNT" 33.457581 -5.634781 0.000006 3.141592 0 -0.365655 0 0 0 0 0 0
// $definebone "LowerTailEnd0_JNT" "Tail5_JNT" 45.022827 10.455208 -0.000003 3.141592 0 0.480821 0 0 0 0 0 0
// $definebone "UpperTailEnd1_JNT" "UpperTailEnd0_JNT" 19.286346 0.000031 0.000045 0 0.000001 0.309445 0 0 0 0 0 0
// $definebone "UpperTailEnd2_JNT" "UpperTailEnd1_JNT" 34.14563 -0.000061 0.000001 0 0 0.411182 0 0 0 0 0 0
// $definebone "LowerTailEnd1_JNT" "LowerTailEnd0_JNT" 9.817841 0.000031 0.000044 0 0.000001 0.000791 0 0 0 0 0 0
// $definebone "LowerTailEnd2_JNT" "LowerTailEnd1_JNT" 34.850677 -0.000031 0.000019 0 0.000001 0.475843 0 0 0 0 0 0
// $definebone "LeftLeg1_JNT" "LeftLeg0_JNT" 91.82901 -0.000023 0 0 0 1.223804 0 0 0 0 0 0
// $definebone "LeftLeg2_JNT" "LeftLeg1_JNT" 43.69376 -0.000015 0 -0.069292 0.024232 -1.415063 0 0 0 0 0 0
// $definebone "LeftLeg3_JNT" "LeftLeg2_JNT" 49.295479 0.000023 0.000008 0 0 0 0 0 0 0 0 0
// $definebone "LeftRearPawA0_JNT" "LeftLeg3_JNT" 6.270397 -13.168831 -1.213264 3.032365 -0.058043 -1.044339 0 0 0 0 0 0
// $definebone "Spine1_JNT" "Spine0_JNT" 40.058216 0.000046 0.000001 -0.000002 0 -0.202678 0 0 0 0 0 0
// $definebone "Spine2_JNT" "Spine1_JNT" 40.7644 -0.000031 -0.000006 0 0 -0.217012 0 0 0 0 0 0
// $definebone "Spine3_JNT" "Spine2_JNT" 65.501419 -0.000015 0.000007 0 0 0.099394 0 0 0 0 0 0
// $definebone "RightArm0_JNT" "Spine3_JNT" -17.09642 1.064423 -18.925093 -2.835904 -0.47283 -1.74238 0 0 0 0 0 0
// $definebone "LeftArm0_JNT" "Spine3_JNT" -17.096451 1.064529 18.925119 -2.835903 -0.47283 1.399212 0 0 0 0 0 0
// $definebone "LowerMane0_JNT" "Spine3_JNT" 11.217285 77.441483 1.360841 0 0 2.05371 0 0 0 0 0 0
// $definebone "Neck0_JNT" "Spine3_JNT" 38.796494 0 -0.000008 0 0 0.267124 0 0 0 0 0 0
// $definebone "RightDeltoid0_JNT" "RightArm0_JNT" -53.643097 0.00029 -0.000214 0.536593 -0.078798 -1.080947 0 0 0 0 0 0
// $definebone "RightArm1_JNT" "RightArm0_JNT" -53.643097 0.00029 -0.000214 0.536593 -0.078798 -1.080947 0 0 0 0 0 0
// $definebone "RightArm2_JNT" "RightArm1_JNT" -82.038216 -0.000004 -0.000053 0 0 0.998221 0 0 0 0 0 0
// $definebone "RightWrist0_JNT" "RightArm2_JNT" -54.390419 -0.000137 0.000137 0 0 0 0 0 0 0 0 0
// $definebone "RightArm3_JNT" "RightArm2_JNT" -108.781204 -0.00021 0.000107 2.637841 0 0 0 0 0 0 0 0
// $definebone "RightPawC0_JNT" "RightArm3_JNT" -11.016523 10.224998 -22.987419 3.073719 -0.326998 -1.029229 0 0 0 0 0 0
// $definebone "RightPawA0_JNT" "RightArm3_JNT" -8.422379 13.841278 17.970203 -3.026708 0.343003 -0.989492 0 0 0 0 0 0
// $definebone "RightPawB0_JNT" "RightArm3_JNT" -8.714287 16.745705 -2.265762 3.110055 -0.059451 -1.044639 0 0 0 0 0 0
// $definebone "LeftDeltoid0_JNT" "LeftArm0_JNT" 53.642693 -0.000046 -0.000015 0.536595 -0.078797 -1.080948 0 0 0 0 0 0
// $definebone "LeftArm1_JNT" "LeftArm0_JNT" 53.642693 -0.000046 -0.000015 0.536595 -0.078797 -1.080948 0 0 0 0 0 0
// $definebone "LeftArm2_JNT" "LeftArm1_JNT" 82.038277 -0.000023 0 0 0 0.99822 0 0 0 0 0 0
// $definebone "LeftWrist0_JNT" "LeftArm2_JNT" 54.390823 -0.000023 -0.000023 0 0 0 0 0 0 0 0 0
// $definebone "LeftArm3_JNT" "LeftArm2_JNT" 108.781639 -0.000008 -0.000031 2.637841 0 0 0 0 0 0 0 0
// $definebone "LeftPawC0_JNT" "LeftArm3_JNT" 11.016636 -10.225258 22.987289 3.073719 -0.326998 -1.029229 0 0 0 0 0 0
// $definebone "LeftPawA0_JNT" "LeftArm3_JNT" 8.422626 -13.841759 -17.97031 -3.026708 0.343003 -0.989492 0 0 0 0 0 0
// $definebone "LeftPawB0_JNT" "LeftArm3_JNT" 8.71452 -16.746101 2.265839 3.110056 -0.059451 -1.044638 0 0 0 0 0 0
// $definebone "LowerMane1_JNT" "LowerMane0_JNT" 15.217133 -0.000038 0 0 0.000001 0 0 0 0 0 0 0
// $definebone "UpperMane0_JNT" "Neck0_JNT" 5.670181 -47.512726 0.000004 0 0 -2.065728 0 0 0 0 0 0
// $definebone "Head0_JNT" "Neck0_JNT" 35.483948 0.000015 0.000001 -0.000001 0 0.172287 0 0 0 0 0 0
// $definebone "UpperMane1_JNT" "UpperMane0_JNT" 5.757294 0 -0.000002 0 0.000001 0.000001 0 0 0 0 0 0
// $definebone "Jaw0_JNT" "Head0_JNT" 9.46991 45.195587 0.000058 -3.141592 -0.000001 0.848055 0 0 0 0 0 0
// $definebone "RightWhiskerA0_JNT" "Head0_JNT" 49.483337 44.54335 -21.16054 0.984897 -0.925043 -1.088436 0 0 0 0 0 0
// $definebone "LeftWhiskerA0_JNT" "Head0_JNT" 49.483444 44.543121 21.160654 0.984895 -0.925045 2.053158 0 0 0 0 0 0
// $definebone "Horn0_JNT" "Head0_JNT" 61.77504 -8.504639 -0.000011 0.000001 0.000001 -0.646636 0 0 0 0 0 0
// $definebone "HeadEnd_JNT" "Head0_JNT" 56.325745 0.000061 0 0 0 0 0 0 0 0 0 0
// $definebone "Tongue0_JNT" "Jaw0_JNT" 19.894485 -7.622498 -0.000001 0 0 0.74719 0 0 0 0 0 0
// $definebone "LeftWhiskerB0_JNT" "Jaw0_JNT" 43.802917 -7.378723 -26.289034 -2.510542 0.244953 -1.038175 0 0 0 0 0 0
// $definebone "RightWhiskerB0_JNT" "Jaw0_JNT" 43.802734 -7.378265 26.288994 -2.791217 -0.297509 -0.948673 0 0 0 0 0 0
// $definebone "Tongue1_JNT" "Tongue0_JNT" 19.992294 -0.000031 -0.000001 0 0 -0.060676 0 0 0 0 0 0
// $definebone "LeftWhiskerB1_JNT" "LeftWhiskerB0_JNT" 12.02507 -0.452637 1.131027 -0.02654 0.010362 -0.028627 0 0 0 0 0 0
// $definebone "LeftWhiskerB2_JNT" "LeftWhiskerB1_JNT" 26.773651 0 0 -0.02247 0.008121 -0.025507 0 0 0 0 0 0
// $definebone "LeftWhiskerB3_JNT" "LeftWhiskerB2_JNT" 31.028687 0.000023 0.000015 0.019205 -0.007452 0.023233 0 0 0 0 0 0
// $definebone "LeftWhiskerB4_JNT" "LeftWhiskerB3_JNT" 30.950485 0.000011 0.000015 -0.06147 0.028157 0.058852 0 0 0 0 0 0
// $definebone "RightWhiskerB1_JNT" "RightWhiskerB0_JNT" 12.086884 -0.000061 -0.000004 -0.020911 -0.048231 0.092717 0 0 0 0 0 0
// $definebone "RightWhiskerB2_JNT" "RightWhiskerB1_JNT" 26.774033 0.000031 0 -0.005385 -0.025552 -0.008029 0 0 0 0 0 0
// $definebone "RightWhiskerB3_JNT" "RightWhiskerB2_JNT" 31.028809 0.000046 0.000078 -0.00067 0.023093 0.007894 0 0 0 0 0 0
// $definebone "RightWhiskerB4_JNT" "RightWhiskerB3_JNT" 30.950256 0.000015 0.000032 -0.006763 0.031427 0.057185 0 0 0 0 0 0
// $definebone "RightWhiskerA1_JNT" "RightWhiskerA0_JNT" -24.879761 -0.000427 0.000259 0.050715 -0.259712 0.365504 0 0 0 0 0 0
// $definebone "RightWhiskerA2_JNT" "RightWhiskerA1_JNT" -25.444695 0.000031 0.000031 0.001508 -0.074567 0.168274 0 0 0 0 0 0
// $definebone "RightWhiskerA3_JNT" "RightWhiskerA2_JNT" -25.581814 -0.000351 0.000015 -0.000001 -0.000268 0.008362 0 0 0 0 0 0
// $definebone "RightWhiskerA4_JNT" "RightWhiskerA3_JNT" -25.590424 -0.000519 0.000198 0 0.000049 0.008579 0 0 0 0 0 0
// $definebone "LeftWhiskerA1_JNT" "LeftWhiskerA0_JNT" 24.879929 0 0.000015 0.050715 -0.259712 0.365504 0 0 0 0 0 0
// $definebone "LeftWhiskerA2_JNT" "LeftWhiskerA1_JNT" 25.444572 0 0 0.001508 -0.074567 0.168274 0 0 0 0 0 0
// $definebone "LeftWhiskerA3_JNT" "LeftWhiskerA2_JNT" 25.581772 -0.000031 -0.000015 -0.000001 -0.000268 0.008362 0 0 0 0 0 0
// $definebone "LeftWhiskerA4_JNT" "LeftWhiskerA3_JNT" 25.590118 0.000015 -0.000046 0 0.000049 0.008579 0 0 0 0 0 0

$sectionframes 30 125




$sequence "BindPose" "nian_creep_anims\BindPose.smd" {
	fps 30
}

$sequence "run" "nian_creep_anims\run.smd" {
	fps 30
	activity "ACT_DOTA_RUN" 1
	loop
	addlayer "turns"
	{ event AE_CL_PLAYSOUND 0 "Nian.Footstep" }
	{ event AE_CL_PLAYSOUND 12 "Nian.Footstep" }
	{ event AE_CL_PLAYSOUND 14 "Nian.Footstep" }
	{ event AE_CL_PLAYSOUND 4 "Nian.Footstep" }
}

$sequence "run_pregame" "nian_creep_anims\run_pregame.smd" {
	fps 30
	activity "ACT_DOTA_RUN" 1
	loop
	addlayer "turns_dupe1"
	{ event AE_CL_PLAYSOUND 1 "Nian.Footstep" }
	{ event AE_CL_PLAYSOUND 12 "Nian.Footstep" }
}

$sequence "swipe_right" "nian_creep_anims\swipe_right.smd" {
	fps 55
	activity "ACT_DOTA_ATTACK" 1
}

$sequence "swipe_left" "nian_creep_anims\swipe_left.smd" {
	fps 55
	activity "ACT_DOTA_ATTACK" 1
}

$sequence "three_stage_pounce" "nian_creep_anims\three_stage_pounce.smd" {
	fps 30
	activity "ACT_DOTA_CAST_ABILITY_4" 1
}

$sequence "nian_flinch_small" "nian_creep_anims\nian_flinch_small.smd" {
	fps 30
	activity "ACT_SMALL_FLINCH" 1
}

$sequence "nian_roar_end" "nian_creep_anims\nian_roar_end.smd" {
	fps 30
	activity "ACT_DOTA_RATTLETRAP_HOOKSHOT_END" 1
}

$sequence "nian_roar_loop" "nian_creep_anims\nian_roar_loop.smd" {
	fps 30
	activity "ACT_DOTA_TELEPORT" 1
	loop
}

$sequence "nian_roar_loop_victory" "nian_creep_anims\nian_roar_loop_victory.smd" {
	fps 30
	activity "ACT_DOTA_VICTORY" 1
	loop
}

$sequence "nian_roar_start" "nian_creep_anims\nian_roar_start.smd" {
	fps 30
	activity "ACT_DOTA_RATTLETRAP_HOOKSHOT_START" 1
}

$sequence "nian_tail360" "nian_creep_anims\nian_tail360.smd" {
	fps 30
	activity "ACT_DOTA_CAST_ABILITY_5" 1
	{ event AE_CL_PLAYSOUND 43 "Nian.Footstep" }
	{ event AE_CL_PLAYSOUND 52 "Nian.Footstep" }
	{ event AE_CL_PLAYSOUND 60 "Nian.Footstep" }
	{ event AE_CL_PLAYSOUND 72 "Nian.Footstep" }
}

$sequence "nian_knockdown_getup" "nian_creep_anims\nian_knockdown_getup.smd" {
	fps 30
	activity "ACT_DOTA_BELLYACHE_END" 1
}

$sequence "nian_knockdown_loop" "nian_creep_anims\nian_knockdown_loop.smd" {
	fps 30
	activity "ACT_DOTA_BELLYACHE_LOOP" 1
	loop
}

$sequence "nian_knockdown_start" "nian_creep_anims\nian_knockdown_start.smd" {
	fps 30
	activity "ACT_DOTA_DIE" 1
}

$sequence "nian_flinch_big" "nian_creep_anims\nian_flinch_big.smd" {
	fps 30
	activity "ACT_BIG_FLINCH" 1
}

$sequence "nian_disabled" "nian_creep_anims\nian_disabled.smd" {
	fps 30
	activity "ACT_DOTA_DISABLED" 1
	loop
}

$sequence "nian_disabled_end" "nian_creep_anims\nian_disabled_end.smd" {
	fps 30
	activity "ACT_DOTA_DISABLED_END" 1
}

$sequence "nian_flail" "nian_creep_anims\nian_flail.smd" {
	fps 30
	activity "ACT_DOTA_FLAIL" 1
	loop
}

$sequence "skewer_start" "nian_creep_anims\skewer_start.smd" {
	fps 30
	activity "ACT_DOTA_MAGNUS_SKEWER_START" 1
}

$sequence "skewer_run" "nian_creep_anims\skewer_run.smd" {
	fps 30
	activity "ACT_DOTA_MAGNUS_SKEWER_END" 1
	loop
	{ event AE_CL_PLAYSOUND 9 "Nian.Footstep.Loud" }
	{ event AE_CL_PLAYSOUND 18 "Nian.Footstep.Loud" }
}

$sequence "nian_tail_stomp" "nian_creep_anims\nian_tail_stomp.smd" {
	fps 30
	activity "ACT_DOTA_CAST_ABILITY_6" 1
}

$sequence "nian_idle" "nian_creep_anims\nian_idle.smd" {
	fps 30
	activity "ACT_DOTA_IDLE" 1
	loop
	{ event AE_CL_PLAYSOUND 1 "Nian.Breath_Idle" }
}

$sequence "pin_down_start" "nian_creep_anims\pin_down_start.smd" {
	fps 30
	activity "ACT_DOTA_NIAN_PIN_START" 1
}

$sequence "pin_down_loop" "nian_creep_anims\pin_down_loop.smd" {
	fps 30
	activity "ACT_DOTA_NIAN_PIN_LOOP" 1
	loop
	{ event AE_CL_PLAYSOUND 28 "Nian.GroundImpact" }
	{ event AE_CL_PLAYSOUND 47 "Nian.Roar.PreAttack" }
	{ event AE_CL_PLAYSOUND 96 "Nian.GroundImpact" }
	{ event AE_CL_PLAYSOUND 117 "Nian.GroundImpact" }
	{ event AE_CL_PLAYSOUND 131 "Nian.GroundImpact" }
	{ event AE_CL_PLAYSOUND 129 "Nian.GroundImpact" }
}

$sequence "pin_down_end" "nian_creep_anims\pin_down_end.smd" {
	fps 30
	activity "ACT_DOTA_NIAN_PIN_END" 1
}

$sequence "area_deny" "nian_creep_anims\area_deny.smd" {
	fps 30
	activity "ACT_DOTA_AREA_DENY" 1
}

$sequence "leap_stun" "nian_creep_anims\leap_stun.smd" {
	fps 30
	activity "ACT_DOTA_LEAP_STUN" 1
}

$sequence "leap_swipe_right" "nian_creep_anims\leap_swipe_right.smd" {
	fps 30
	activity "ACT_DOTA_LEAP_SWIPE" 1
}

$sequence "intro_leap" "nian_creep_anims\intro_leap.smd" {
	fps 30
	activity "ACT_DOTA_NIAN_INTRO_LEAP" 1
}

$sequence "game_end" "nian_creep_anims\game_end.smd" {
	fps 30
	activity "ACT_DOTA_NIAN_GAME_END" 1
}

$sequence "pinDown_to_stun" "nian_creep_anims\pinDown_to_stun.smd" {
	fps 30
	activity "ACT_DOTA_NIAN_PIN_TO_STUN" 1
}

$sequence "capture" "nian_creep_anims\capture.smd" {
	fps 30
	activity "ACT_DOTA_CAPTURE" 1
	loop
}

$sequence "turns_lookFrame_0" "nian_creep_anims\turns_lookFrame_0.smd" {
	fps 30
	delta
	hidden
}

$sequence "turns_lookFrame_1" "nian_creep_anims\turns_lookFrame_1.smd" {
	fps 30
	delta
	hidden
}

$sequence "turns_lookFrame_2" "nian_creep_anims\turns_lookFrame_2.smd" {
	fps 30
	delta
	hidden
}

$sequence "turns_dupe1_lookFrame_0" "nian_creep_anims\turns_dupe1_lookFrame_0.smd" {
	fps 30
	delta
	hidden
}

$sequence "turns_dupe1_lookFrame_1" "nian_creep_anims\turns_dupe1_lookFrame_1.smd" {
	fps 30
	delta
	hidden
}

$sequence "turns_dupe1_lookFrame_2" "nian_creep_anims\turns_dupe1_lookFrame_2.smd" {
	fps 30
	delta
	hidden
}

$sequence "turns" {
	"@turns_lookFrame_0"
	"@turns_lookFrame_1"
	"@turns_lookFrame_2"
	fps 30
	delta
	blendwidth 3
	blend "turn" -1 1
}

$sequence "turns_dupe1" {
	"@turns_dupe1_lookFrame_0"
	"@turns_dupe1_lookFrame_1"
	"@turns_dupe1_lookFrame_2"
	fps 30
	delta
	blendwidth 3
	blend "turn" -1 1
}

$bonemerge "Root0_JNT"
$bonemerge "Tail0_JNT"
$bonemerge "Spine0_JNT"
$bonemerge "Tail1_JNT"
$bonemerge "Tail2_JNT"
$bonemerge "Tail3_JNT"
$bonemerge "Tail4_JNT"
$bonemerge "Tail5_JNT"
$bonemerge "UpperTailEnd0_JNT"
$bonemerge "LowerTailEnd0_JNT"
$bonemerge "UpperTailEnd1_JNT"
$bonemerge "UpperTailEnd2_JNT"
$bonemerge "LowerTailEnd1_JNT"
$bonemerge "LowerTailEnd2_JNT"
$bonemerge "Spine1_JNT"
$bonemerge "Spine2_JNT"
$bonemerge "Spine3_JNT"
$bonemerge "LowerMane0_JNT"
$bonemerge "Neck0_JNT"
$bonemerge "LowerMane1_JNT"
$bonemerge "UpperMane0_JNT"
$bonemerge "Head0_JNT"
$bonemerge "Jaw0_JNT"
$bonemerge "Horn0_JNT"
$bonemerge "LeftWhiskerB0_JNT"
$bonemerge "RightWhiskerB0_JNT"


$keyvalues
{
}
