/obj/item/clothing/accessory/badge/militaryid
	name = "Military identification token "
	desc = "That's the special token used for identification soldiers of Soviet army. Has a number on it."
	icon_state = "sovtoken"
	slot_flags = SLOT_BELT | SLOT_ID
	badge_string = "Soldat"
	var/number = null

/obj/item/clothing/accessory/badge/militaryid/New()
	number = rand(1111111,9999999)
	desc += "[number]"


/obj/item/clothing/accessory/badge/militaryid/officer
	badge_string = "Ofitser"

/obj/item/clothing/accessory/badge/dogtag
	name = "dog tag"
	desc = "That's the special token used for identification soldiers of USMC. Has a some words on it."
	icon_state = "tags"
	slot_flags = SLOT_BELT | SLOT_ID
	badge_string = "Enlisted"

/obj/item/clothing/accessory/badge/dogtag/officer
	badge_string = "Officer"

/obj/item/clothing/accessory/insignia
	name = "Insignia"
	desc = "That's should not be here"
	slot = "insignia"

/obj/item/clothing/accessory/insignia/soviet/pvt
	name = "'Ryadovoi' insignia"
	icon_state = "sa_pvt_insignia"

/obj/item/clothing/accessory/insignia/soviet/gefr
	name = "'Efreitor' insignia"
	icon_state = "sa_efr_insignia"

/obj/item/clothing/accessory/insignia/soviet/jsgt
	name = "'Mladshiy sergant' insignia"
	icon_state = "sa_jsgt_insignia"

/obj/item/clothing/accessory/insignia/soviet/sgt
	name = "'Sergant' insignia"
	icon_state = "sa_sgt_insignia"

/obj/item/clothing/accessory/insignia/soviet/ssgt
	name = "'Starshiy Sergant' insignia"
	icon_state = "sa_ssgt_insignia"

/obj/item/clothing/accessory/insignia/soviet/star
	name = "'Starshina' insignia"
	icon_state = "sa_star_insignia"

/obj/item/clothing/accessory/insignia/soviet/prap
	name = "'Praporshik' insignia"
	icon_state = "sa_pr_insignia"

/obj/item/clothing/accessory/insignia/soviet/stpr
	name = "'Starshiy Praporshik' insignia"
	icon_state = "sa_stpr_insignia"

/obj/item/clothing/accessory/insignia/soviet/mllt
	name = "'Mladshiy Leitenant' insignia"
	icon_state = "sa_mllt_insignia"

/obj/item/clothing/accessory/insignia/soviet/lt
	name = "'Leitenant' insignia"
	icon_state = "sa_lt_insignia"

/obj/item/clothing/accessory/insignia/usmc/pfc
	name = "Private First Class insignia"
	icon_state = "usmc_pfc_insignia"

/obj/item/clothing/accessory/insignia/usmc/lcpl
	name = "Lance Corporal insignia"
	icon_state = "usmc_lcpl_insignia"

/obj/item/clothing/accessory/insignia/usmc/cpl
	name = "Corporal insignia"
	icon_state = "usmc_cpl_insignia"

/obj/item/clothing/accessory/insignia/usmc/sgt
	name = "Sergeant insignia"
	icon_state = "usmc_sgt_insignia"

/obj/item/clothing/accessory/insignia/usmc/ssgt
	name = "Staff Sergeant insignia"
	icon_state = "usmc_ssgt_insignia"

/obj/item/clothing/accessory/insignia/usmc/msgt
	name = "Master Sergeant insignia"
	icon_state = "usmc_msgt_insignia"

/obj/item/clothing/accessory/insignia/usmc/frstsgt
	name = "First Sergeant insignia"
	icon_state = "usmc_1stsgt_insignia"

/obj/item/clothing/accessory/insignia/usmc/scndlt
	name = "Second Lieutenant insignia"
	icon_state = "usmc_2ndlt_insignia"

/obj/item/clothing/accessory/insignia/usmc/frstlt
	name = "First Lieutenant insignia"
	icon_state = "usmc_1stlt_insignia"