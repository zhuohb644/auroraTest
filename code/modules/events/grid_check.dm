/datum/event/grid_check	//NOTE: Times are measured in master controller ticks!
	announceWhen		= 5
	no_fake = 1

/datum/event/grid_check/start()
	..()

	power_failure(0, severity)

/datum/event/grid_check/announce()
	command_announcement.Announce("Abnormal activity detected in [station_name()]'s powernet. As a precautionary measure, the power will be shut off for an indeterminate duration.", "Automated Grid Check", new_sound = 'sound/AI/poweroff.ogg', zlevels = affecting_z)
