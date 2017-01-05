/obj/item/device/radio/intercom
	name = "station intercom (General)"
	desc = "Talk through this."
	icon_state = "intercom"
	randpixel = 0
	anchored = 1
	w_class = 5
	canhear_range = 2
	flags = CONDUCT | NOBLOODY
	var/number = 0
	var/last_tick //used to delay the powercheck

/obj/item/device/radio/intercom/get_storage_cost()
	return DO_NOT_STORE

/obj/item/device/radio/intercom/custom
	name = "station intercom (Custom)"
	broadcasting = 0
	listening = 0

/obj/item/device/radio/intercom/interrogation
	name = "station intercom (Interrogation)"
	frequency  = 1449

/obj/item/device/radio/intercom/private
	name = "station intercom (Private)"
	frequency = AI_FREQ

/obj/item/device/radio/intercom/specops
	name = "\improper Spec Ops intercom"
	frequency = ERT_FREQ

/obj/item/device/radio/intercom/department
	canhear_range = 5
	broadcasting = 0
	listening = 1

/obj/item/device/radio/intercom/department/medbay
	name = "station intercom (Medbay)"
	frequency = MED_I_FREQ

/obj/item/device/radio/intercom/department/security
	name = "station intercom (Security)"
	frequency = SEC_I_FREQ

/obj/item/device/radio/intercom/entertainment
	name = "entertainment intercom"
	frequency = ENT_FREQ
	canhear_range = 4

/obj/item/device/radio/intercom/New()
	..()
	processing_objects += src

/obj/item/device/radio/intercom/department/medbay/New()
	..()
	internal_channels = default_medbay_channels.Copy()

/obj/item/device/radio/intercom/department/security/New()
	..()
	internal_channels = list(
		num2text(PUB_FREQ) = list(),
		num2text(SEC_I_FREQ) = list(access_security)
	)

/obj/item/device/radio/intercom/entertainment/New()
	..()
	internal_channels = list(
		num2text(PUB_FREQ) = list(),
		num2text(ENT_FREQ) = list()
	)

/obj/item/device/radio/intercom/syndicate
	name = "illicit intercom"
	desc = "Talk through this. Evilly."
	frequency = SYND_FREQ
	subspace_transmission = 1
	syndie = 1

/obj/item/device/radio/intercom/syndicate/New()
	..()
	internal_channels[num2text(SYND_FREQ)] = list(access_syndicate)

/obj/item/device/radio/intercom/Destroy()
	processing_objects -= src
	..()

/obj/item/device/radio/intercom/attack_ai(mob/user as mob)
	src.add_fingerprint(user)
	spawn (0)
		attack_self(user)

/obj/item/device/radio/intercom/attack_hand(mob/user as mob)
	src.add_fingerprint(user)
	spawn (0)
		attack_self(user)

/obj/item/device/radio/intercom/receive_range(freq, level)
	if (!on)
		return -1
	if(!(0 in level))
		var/turf/position = get_turf(src)
		if(isnull(position) || !(position.z in level))
			return -1
	if (!src.listening)
		return -1
	if(freq in ANTAG_FREQS)
		if(!(src.syndie))
			return -1//Prevents broadcast of messages over devices lacking the encryption

	return canhear_range

/obj/item/device/radio/intercom/process()
	if(((world.timeofday - last_tick) > 30) || ((world.timeofday - last_tick) < 0))
		last_tick = world.timeofday

		if(!src.loc)
			on = 0
		else
			var/area/A = get_area(src)
			if(!A)
				on = 0
			else
				on = A.powered(EQUIP) // set "on" to the power status

		if(!on)
			icon_state = "[icon_state]-p"
		else
			icon_state = "[icon_state]"

/obj/item/device/radio/intercom/broadcasting
	broadcasting = 1

/obj/item/device/radio/intercom/locked
    var/locked_frequency

/obj/item/device/radio/intercom/locked/set_frequency(var/frequency)
	if(frequency == locked_frequency)
		..(locked_frequency)

/obj/item/device/radio/intercom/locked/list_channels()
	return ""

/obj/item/device/radio/intercom/locked/ai_private
	name = "\improper AI intercom"
	frequency = AI_FREQ
	broadcasting = 1
	listening = 1

/obj/item/device/radio/intercom/locked/confessional
	name = "confessional intercom"
	frequency = 1480

/obj/item/device/radio/intercom/soviet
	name = "radio set"
	icon_state = "sovintercomm"
	frequency = 1311

/obj/item/device/radio/intercom/usa
	name = "radio set"
	icon_state = "usintercomm"
	frequency = 1332

/obj/item/device/radio/intercom/locked/soviet/transmitter
	name = "\improper transmitter"
	icon_state = "transmitter"
	desc = "Used to send messages on the all loudspeakers."
	frequency = 1309
	broadcasting = 1
	listening = 1

/obj/item/device/radio/intercom/locked/soviet/receiver
	name = "\improper loudspeaker"
	desc = "Listen through this."
	icon_state = "loudspeaker"
	frequency = 1309
	broadcasting = 0
	listening = 1
	canhear_range = 8

/obj/item/device/radio/intercom/locked/soviet/receiver/attack_self(mob/user)
	return

/obj/item/device/radio/intercom/locked/usmc/transmitter
	name = "\improper transmitter"
	desc = "Used to send messages on the all loudspeakers."
	frequency = 1329
	icon_state = "transmitter"
	broadcasting = 1
	listening = 1

/obj/item/device/radio/intercom/locked/usmc/receiver
	name = "\improper loudspeaker"
	desc = "Listen through this."
	icon_state = "loudspeaker"
	frequency = 1329
	broadcasting = 0
	listening = 1
	canhear_range = 8

/obj/item/device/radio/intercom/locked/usmc/receiver/attack_self(mob/user)
	return
