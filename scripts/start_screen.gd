extends Control

func _ready():
	var copyright_text = ""
	
	copyright_text += "Created by team Return To Start for GMTK Game Jam 2024\n"
	copyright_text += "Return To Start Members:\n"
	copyright_text += "[url=https://github.com/Wired-Weasel]Wired-Weasel[/url]\n"
	copyright_text += "[url=https://github.com/error-27]error_27[/url]\n"
	copyright_text += "[url=https://github.com/LuigiFanCoding]C!LuigiFan[/url]\n\n"
	
	copyright_text += "Made using the [url=https://godotengine.org/license]Godot Game Engine[/url]\n"
	
	var copyright_info = Engine.get_copyright_info()
	copyright_text += "\n-----THIRD-PARTY COMPONENTS-----\n"
	for part in copyright_info:
		copyright_text += part["name"] + " - " + part["parts"][0]["license"] + "\n"
	
	copyright_text += "\n-----LICENSE TEXTS-----\n"
	var licenses = Engine.get_license_info()
	for license in licenses:
		copyright_text += "-----" + license + "-----\n" + licenses[license] + "\n\n"
	
	$CreditsPanel/CreditsLabel.text = copyright_text

func _on_start_pressed():
	pass # Replace with function body.

func _on_credits_pressed():
	$CreditsPanel.show()


func _on_credits_label_meta_clicked(meta):
	OS.shell_open(meta)


func _on_credits_close_pressed():
	$CreditsPanel.hide()
