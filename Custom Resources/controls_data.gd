extends Resource

class_name ControlsData

const AVAILABLE_CONTROLS := {
	"movement": {
		"variable": "<movement>", 
		"text": "WASD",
		},
	"select": {
		"variable": "<select>", 
		"text": "Left-Click",
		},
	"act": {
		"variable": "<act>", 
		"text": "Right-Click",
		},
}

@export var keyboard_and_mouse := AVAILABLE_CONTROLS
@export var keyboard_only := AVAILABLE_CONTROLS
@export var controller := AVAILABLE_CONTROLS
@export var mobile := AVAILABLE_CONTROLS
