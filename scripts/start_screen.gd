extends Control

func _ready():
	var copyright_text = ""
	
	copyright_text += "Created by team Return To Start for GMTK Game Jam 2024\n"
	copyright_text += "Return To Start Members:\n"
	copyright_text += "[url=https://github.com/Wired-Weasel]Wired-Weasel[/url]\n"
	copyright_text += "[url=https://github.com/error-27]error_27[/url]\n"
	copyright_text += "[url=https://github.com/LuigiFanCoding]C!LuigiFan[/url]\n\n"
	
	copyright_text += "Made using the [url=https://godotengine.org/license]Godot Game Engine[/url]\n"
	
	copyright_text += "Using [url=https://kenney.nl/assets/1-bit-pack]1-bit Pack[/url] by Kenney (CC0)\n"
	
	var copyright_info = Engine.get_copyright_info()
	copyright_text += "\n-----THIRD-PARTY COMPONENTS-----\n"
	for part in copyright_info:
		copyright_text += part["name"] + " - " + part["parts"][0]["license"] + "\n"
	
	copyright_text += "\n-----LICENSE TEXTS-----\n"
	var licenses = Engine.get_license_info()
	for license in licenses:
		copyright_text += "-----" + license + "-----\n" + licenses[license] + "\n\n"
	
	$CreditsPanel/CreditsLabel.text = copyright_text
	
	get_window().size = get_window().size * 3
	
	#play Background Music (AudioStream)
	#current song: none
	#$BackgroundMusic.play()


func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/level_world.tscn")

func _on_credits_pressed():
	$CreditsPanel.show()


func _on_credits_label_meta_clicked(meta):
	OS.shell_open(meta)


func _on_credits_close_pressed():
	$CreditsPanel.hide()


# settings panel, maybe this time the volume won't destroy eardrums
func _on_settings_pressed():
	#print("Settings Pressed")  #testing button
	$SettingsPanel.show()
	
#AudioServer.set_bus_volume_db(0,value/5)   # sets audio volume from 0 to 100 (or whatever the slider is set to)
#AudioServer.set_bus_mute(0,toggled_on)    #mute if toggled

func _on_settingsclose_pressed():
	$SettingsPanel.hide()

func _unhandled_key_input(event_press):   # Esc exits settings and credits, maybe not the best function
	if event_press is InputEventKey and event_press.pressed:  #if pressed
		if event_press.keycode == KEY_ESCAPE: 
			$SettingsPanel.hide()
			$CreditsPanel.hide()
			#print("esc pressed")
