extends Sprite
class_name Mob

onready var _tree: AnimationTree = $Tree
onready var _machine: AnimationNodeStateMachinePlayback = _tree.get("parameters/playback")

const _keyAttackDirection := "parameters/Attack/blend_position"
const _keyAttackNorth := "parameters/Attack/0/blend_position"
const _keyAttackEast := "parameters/Attack/1/blend_position"
const _keyAttackSouth := "parameters/Attack/2/blend_position"
const _keyAttackWest := "parameters/Attack/3/blend_position"

const _keyIdleDirection := "parameters/Idle/blend_position"
const _keyIdleNorth := "parameters/Idle/0/blend_position"
const _keyIdleEast := "parameters/Idle/1/blend_position"
const _keyIdleSouth := "parameters/Idle/2/blend_position"
const _keyIdleWest := "parameters/Idle/3/blend_position"

const _keyWalkDirection := "parameters/Walk/blend_position"

const _key := "parameters/Idle/BlendSpace1D/blend_position"

var _idleAnimationPriority := {
	-1: 100,
	0: 20,
	1: 1
}

func _init() -> void:
	_idleAnimationPriority = {
		0: 5,
		1: 4,
		2: 3,
		3: 2,
		4: 1,
	}

func _ready():
	_machine.start("Idle")

func randomIdle() -> void:
	_tree[_key] = Random.priority(_idleAnimationPriority)

func idle():
	_machine.travel("Idle")

func walk():
	_machine.travel("Walk")

func attack():
	_machine.travel("Attack")

func randomIdle() -> void:
	var random = Random.priority(_idleAnimationPriority)
	_tree[_keyIdleNorth] = random
	_tree[_keyIdleEast] = random
	_tree[_keyIdleSouth] = random
	_tree[_keyIdleWest] = random

func randomAttack() -> void:
	var random = Random.next(2)
	_tree[_keyAttackNorth] = random
	_tree[_keyAttackEast] = random
	_tree[_keyAttackSouth] = random
	_tree[_keyAttackWest] = random

func east() -> void:
	_tree[_keyAttackDirection] = 1
	_tree[_keyIdleDirection] = 1
	_tree[_keyWalkDirection] = 1
	_machine.start("Idle")

func west() -> void:
	_tree[_keyAttackDirection] = 3
	_tree[_keyIdleDirection] = 3
	_tree[_keyWalkDirection] = 3
	_machine.start("Idle")
