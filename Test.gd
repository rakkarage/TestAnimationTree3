extends Control

onready var _random := $Random
onready var _up := $VBox/Direction/Up
onready var _down := $VBox/Direction/Down
onready var _left := $VBox/Direction/Left
onready var _right := $VBox/Direction/Right
onready var _attack := $VBox/HBox/Attack
onready var _walk := $VBox/HBox/Walk
onready var _mob := $Sprite

func _ready() -> void:
	assert(_random.connect("pressed", _randomPressed) == OK)
	assert(_up.connect("pressed", _upPressed) == OK)
	assert(_down.connect("pressed", _downPressed) == OK)
	assert(_left.connect("pressed", _leftPressed) == OK)
	assert(_right.connect("pressed", _rightPressed) == OK)
	assert(_attack.connect("pressed", _attackPressed) == OK)
	assert(_walk.connect("pressed", _walkPressed) == OK)

func _randomPressed() -> void:
	match Random.next(2):
		0: _mob.attack()
		1: _mob.walk()

func _upPressed() -> void:
	_mob.north()

func _rightPressed() -> void:
	_mob.east()

func _downPressed() -> void:
	_mob.south()

func _leftPressed() -> void:
	_mob.west()

func _attackPressed() -> void:
	_mob.attack()

func _walkPressed() -> void:
	_mob.walk()
