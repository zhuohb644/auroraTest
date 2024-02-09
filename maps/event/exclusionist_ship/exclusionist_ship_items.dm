/obj/item/clothing/suit/storage/hooded/exclusionist_robe
	name = "exclusionist robes"
	desc = "Red and gold robes worn by those who follow the Exclusionist heresy of the Trinary Perfection."
	icon = 'maps/event/exclusionist_ship/exclusionist_items.dmi'
	icon_state = "exclusionist_robe_priest"
	item_state = "exclusionist_robe_priest"
	hoodtype = /obj/item/clothing/head/winterhood/exclusionist
	contained_sprite = TRUE

/obj/item/clothing/suit/storage/hooded/exclusionist_robe/warpriest
	name = "exclusionist warpriest's robe"
	desc = "Black and gold robes worn by those who follow the Exclusionist heresy of the Trinary Perfection."
	icon_state = "exclusionist_robe_warpriest"
	item_state = "exclusionist_robe_warpriest"
	hoodtype = /obj/item/clothing/head/winterhood/exclusionist/warpriest

/obj/item/clothing/head/winterhood/exclusionist
	name = "exclusionist hood"
	desc = "A red and gold hood worn by those who follow the Exclusionist heresy of the Trinary Perfection."
	icon = 'maps/event/exclusionist_ship/exclusionist_items.dmi'
	icon_state = "exclusionist_robe_priest_hood"
	item_state = "exclusionist_robe_priest_hood"

/obj/item/clothing/head/winterhood/exclusionist/warpriest
	name = "exclusionist warpriest's hood"
	desc = "A black and gold hood worn by those who follow the Exclusionist heresy of the Trinary Perfection."
	icon_state = "exclusionist_robe_warpriest_hood"
	item_state = "exclusionist_robe_warpriest_hood"

/obj/item/clothing/suit/exclusionist_armor
	name = "armored exclusionist robe"
	desc = "Robes worn by those who follow the Exclusionist heresy of the Trinary Perfection. These ones seem to have been reinforced for battle."
	icon = 'maps/event/exclusionist_ship/exclusionist_items.dmi'
	icon_state = "exclusionist_armored_robe"
	item_state = "exclusionist_armored_robe"
	armor = list(
		melee = ARMOR_MELEE_KEVLAR,
		bullet = ARMOR_BALLISTIC_MEDIUM,
		laser = ARMOR_LASER_KEVLAR,
		energy = ARMOR_ENERGY_SMALL,
		bomb = ARMOR_BOMB_PADDED
	)
	contained_sprite = TRUE
	slowdown = 1
	allowed = list(/obj/item/device/flashlight,/obj/item/tank,/obj/item/device/suit_cooling_unit,/obj/item/gun,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/melee/baton,/obj/item/melee/energy/sword,/obj/item/handcuffs)

/obj/item/clothing/mask/exclusionists
	name = "exclusionist mask"
	desc = "A fearsome steel mask, worn by those who follow the Exclusionist heresy of the Trinary Perfection."
	icon = 'maps/event/exclusionist_ship/exclusionist_items.dmi'
	icon_state = "exclusionist_mask"
	item_state = "exclusionist_mask"
	contained_sprite = TRUE
	armor = list(
		melee = ARMOR_MELEE_SMALL,
		bullet = ARMOR_BALLISTIC_SMALL,
		laser = ARMOR_LASER_MINOR,
		bio = ARMOR_BIO_STRONG
	)
	flash_protection = FLASH_PROTECTION_MODERATE

/obj/item/flag/exclusionist
	name = "\improper Exclusionist flag"
	desc = "The gold and black flag of the Exclusionists, a heretical and extremist sect of the Trinary Perfection."
	flag_path = "exclusionist"
	flag_structure = /obj/structure/sign/flag/exclusionist

/obj/structure/sign/flag/exclusionist
	name = "\improper Exclusionist flag"
	desc = "The gold and black flag of the Exclusionists, a heretical and extremist sect of the Trinary Perfection."
	flag_path = "exclusionist"
	icon_state = "exclusionist"
	flag_item = /obj/item/flag/exclusionist

/obj/structure/sign/flag/exclusionist/unmovable
	unmovable = TRUE

/obj/item/flag/exclusionist/l
	name = "large Exclusionist flag"
	flag_size = TRUE
	flag_structure = /obj/structure/sign/flag/exclusionist/large

/obj/structure/sign/flag/exclusionist/large
	icon_state = "exclusionist_l"
	flag_path = "exclusionist"
	flag_size = TRUE
	flag_item = /obj/item/flag/exclusionist/l

/obj/structure/sign/flag/exclusionist/large/north/Initialize(mapload)
	. = ..(mapload, NORTH)

/obj/structure/sign/flag/exclusionist/large/south/Initialize(mapload)
	. = ..(mapload, SOUTH)

/obj/structure/sign/flag/exclusionist/large/east/Initialize(mapload)
	. = ..(mapload, EAST)

/obj/structure/sign/flag/exclusionist/large/west/Initialize(mapload)
	. = ..(mapload, WEST)

/obj/item/clothing/ears/antenna/trinary_halo/exclusionist
	color = "#1c1c1c"
