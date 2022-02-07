extends Control

onready var _left := $HBoxContainer/ButtonLeft
onready var _right := $HBoxContainer/ButtonRight
onready var _attack := $HBoxContainer/ButtonAttack
onready var _walk := $HBoxContainer/ButtonWalk
onready var _mob := $Sprite

func _ready() -> void:
	assert(_left.connect("pressed", self, "_leftPressed") == OK)
	assert(_right.connect("pressed", self, "_rightPressed") == OK)
	assert(_attack.connect("pressed", self, "_attackPressed") == OK)
	assert(_walk.connect("pressed", self, "_walkPressed") == OK)

func _rightPressed() -> void:
	_mob.east()

func _leftPressed() -> void:
	_mob.west()

func _attackPressed() -> void:
	_mob.attack()

func _walkPressed() -> void:
	_mob.walk()
