extends Control

@export var show_position: float = -95
@export var hide_position: float = 121

var tween: Tween

@onready var button: Button = $Button
@onready var shine: TextureRect = $Button/Shine

func _ready() -> void:
	shine.position.x = button.size.x + shine.size.x

func show_colors() -> void:
	tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.parallel().tween_property(shine, "position:x", -shine.size.x, 0.5)
	await tween.finished
	tween.kill()

func hide_colors() -> void:
	tween.kill()
	shine.position.x = button.size.x + shine.size.x

func _on_button_mouse_entered() -> void:
	show_colors()

func _on_button_mouse_exited() -> void:
	hide_colors()

func _on_button_button_down():
	button.position.y += 16

func _on_button_button_up():
	button.position.y -= 16
