/datum/ghostspawner/human/exclusionist
	short_name = "exclusionist"
	name = "Exclusionist Crew"
	desc = "Crew the Exclusionist ship."
	tags = list("External")

	spawnpoints = list("exclusionist")
	max_count = 8

	outfit = /datum/outfit/admin/exclusionist
	possible_species = list(SPECIES_IPC, SPECIES_IPC_BISHOP, SPECIES_IPC_SHELL, SPECIES_IPC_G1, SPECIES_IPC_G2, SPECIES_IPC_XION, SPECIES_IPC_ZENGHU)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY

	assigned_role = "Exclusionist"
	special_role = "Exclusionist"
	respawn_flag = null
	enabled = FALSE
	password = "nightmares"

/datum/ghostspawner/human/exclusionist/post_spawn(mob/user)
	. = ..()
	if(user.mind)
		renegades.add_antagonist(user.mind, do_not_equip = TRUE)

/datum/ghostspawner/human/exclusionist/warrior
	short_name = "exclusionist_warrior"
	name = "Exclusionist Warrior"
	desc = "Defend the Exclusionist ship."
	tags = list("External")
	max_count = 3
	outfit = /datum/outfit/admin/exclusionist/warrior

/datum/ghostspawner/human/exclusionist/leader
	short_name = "exclusionist_leader"
	name = "Exclusionist War-Priest"
	desc = "Command the Exclusionist ship"
	max_count = 1
	outfit = /datum/outfit/admin/exclusionist/leader
	spawnpoints = list("exclusionist_priest")
	assigned_role = "Exclusionist War-Priest"
	special_role = "Exclusionist War-Priest"

/datum/outfit/admin/exclusionist
	name = "Exclusionist"
	uniform = /obj/item/clothing/under/gearharness
	suit = /obj/item/clothing/suit/storage/hooded/exclusionist_robe
	l_ear = /obj/item/device/radio/headset/ship
	mask = /obj/item/clothing/mask/exclusionists
	id = /obj/item/card/id
	back = /obj/item/storage/backpack/satchel

/datum/outfit/admin/exclusionist/warrior
	suit = /obj/item/clothing/suit/exclusionist_armor
	belt = /obj/item/melee/chainsword
	r_ear = /obj/item/clothing/ears/antenna/trinary_halo/exclusionist

/datum/outfit/admin/exclusionist/leader
	name = "Exclusionist War-Priest"
	suit = /obj/item/clothing/suit/storage/hooded/exclusionist_robe/warpriest
	belt = /obj/item/melee/chainsword
	r_ear = /obj/item/clothing/ears/antenna/trinary_halo/exclusionist

/datum/outfit/admin/exclusionist/get_id_access()
	return list(ACCESS_SYNDICATE, ACCESS_EXTERNAL_AIRLOCKS)
