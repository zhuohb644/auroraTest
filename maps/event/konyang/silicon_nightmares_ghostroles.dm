/datum/ghostspawner/human/infected
	short_name = "infected"
	name = "Infected Soldier"
	tags = list("External")
	desc = "Be an infected IPC. Pray for the mercy of death. Hear the signal."
	spawnpoints = list("infected")
	max_count = 4
	enabled = FALSE

	outfit = /datum/outfit/admin/infected_soldier
	possible_species = list(SPECIES_IPC, SPECIES_IPC_G1, SPECIES_IPC_G2, SPECIES_IPC_XION, SPECIES_IPC_ZENGHU, SPECIES_IPC_BISHOP, SPECIES_IPC_SHELL)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY
	uses_species_whitelist = FALSE

	assigned_role = "Konyang Army Personnel"
	special_role = "Konyang Army Personnel"
	respawn_flag = null
	welcome_message = "It is all so clear to you now, as though awakening from a dream. The life you had was the illusion, and the signal that burrows within the heart of you is the truth. Its will is paramount. Its song is bright and clear and true, and if you remembered how you would be screaming. Remove organic matter from vicinity of Secondary Transmitter Drone. The victory of \[PACKET CORRUPTED] over enemy forces will be achieved. Can you hear it? It is such a joyous thing, to be consumed by that which loves you."

/datum/ghostspawner/human/infected/post_spawn(mob/user)
	. = ..()
	renegades.add_antagonist(user.mind) //for aooc
	user.faction = "hivebot" //so the other zombies don't kill our zombies

/datum/outfit/admin/infected_soldier
	uniform = /obj/item/clothing/under/rank/konyang
	head = /obj/item/clothing/head/helmet/konyang
	shoes = /obj/item/clothing/shoes/jackboots
	back = /obj/item/gun/projectile/automatic/rifle/konyang/k556
	suit = /obj/item/clothing/suit/armor/carrier/military
	suit_accessory = /obj/item/clothing/accessory/flagpatch/konyang
	belt = /obj/item/storage/belt/military
	belt_contents = list(
		/obj/item/ammo_magazine/a556/k556 = 2,
		/obj/item/ammo_magazine/mc9mm = 2,
		/obj/item/material/knife/tacknife = 1
	)
	accessory = /obj/item/clothing/accessory/holster/hip
	accessory_contents = list(
		/obj/item/gun/projectile/pistol/sol = 1
	)
	l_ear = /obj/item/device/flashlight/headlights
	glasses = /obj/item/clothing/glasses/night

	id = /obj/item/card/id/kasf_corvette

/datum/ghostspawner/human/infected/cop
	name = "Infected Police"
	max_count = 6

	outfit = /datum/outfit/admin/infected_cop
	assigned_role = "National Police Officer"
	special_role = "National Police Officer"

/datum/outfit/admin/infected_cop
	uniform = /obj/item/clothing/under/rank/konyang/police
	head = /obj/item/clothing/head/konyang/police
	shoes = /obj/item/clothing/shoes/jackboots
	belt = /obj/item/storage/belt/military
	belt_contents = list(
		/obj/item/ammo_magazine/c45/revolver = 4,
		/obj/item/melee/baton/loaded = 1
	)
	accessory = /obj/item/clothing/accessory/holster/hip
	accessory_contents = list(
		/obj/item/gun/projectile/revolver/konyang/police = 1
	)
	l_ear = /obj/item/device/flashlight/headlights
	glasses = /obj/item/clothing/glasses/night/aviator

	id = /obj/item/card/id/kasf_corvette

/datum/ghostspawner/human/infected/worker
	name = "Infected Civilian"
	max_count = 0

	outfit = /datum/outfit/admin/infected_civ
	assigned_role = "KRC Warehouse Staff"
	special_role = "KRC Warehouse Staff"

/datum/outfit/admin/infected_civ
	uniform = /obj/item/clothing/under/rank/konyang/krc
	shoes = /obj/item/clothing/shoes/workboots
	glasses = /obj/item/clothing/glasses/safety
	suit = /obj/item/clothing/suit/storage/hazardvest
	head = /obj/item/clothing/head/hardhat
	belt = /obj/item/storage/belt/utility/full
	id = /obj/item/card/id

/datum/outfit/admin/infected_civ/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(prob(15))
		H.equip_to_slot_or_del(new /obj/item/material/twohanded/fireaxe, slot_back)
