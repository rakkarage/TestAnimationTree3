extends Sprite
class_name Mob

onready var _tree: AnimationTree = $AnimationTree
onready var _machine: AnimationNodeStateMachinePlayback = _tree["parameters/playback"]

const _keyAttackDirection := "parameters/Attack/blend_position"

const _keyIdleDirection := "parameters/Idle/blend_position"
const _keyIdleEast := "parameters/Idle/0/blend_position"
const _keyIdleWest := "parameters/Idle/1/blend_position"

const _keyWalkDirection := "parameters/Walk/blend_position"

var _idleAnimationPriority := {
	0: 100,
	1: 20,
	2: 1
}

func _ready():
	_machine.start("Idle")

func idle():
	_machine.travel("Idle")

func walk():
	_machine.travel("Walk")

func attack():
	_machine.travel("Attack")

func randomIdle() -> void:
	var random = Random.priority(_idleAnimationPriority)
	_tree[_keyIdleEast] = random
	_tree[_keyIdleWest] = random

func east() -> void:
	_tree[_keyAttackDirection] = 1
	_tree[_keyIdleDirection] = 1
	_tree[_keyWalkDirection] = 1
	# _machine.start("Idle")

func west() -> void:
	_tree[_keyAttackDirection] = 3
	_tree[_keyIdleDirection] = 3
	_tree[_keyWalkDirection] = 3
	# _machine.start("Idle")
