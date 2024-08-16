#extends "res://scripts/start_screen.gd"
extends Panel
 


func _on_volume_value_changed(value: float):
	AudioServer.set_bus_volume_db(0,value/5)   # sets audio volume from 0 to 100 (or whatever the slider is set to)

func _on_mute_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0,toggled_on)    #mute if toggled
	
