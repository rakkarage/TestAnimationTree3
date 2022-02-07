extends Mob

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

func _init() -> void:
	_idleAnimationPriority = {
		0: 5,
		1: 4,
		2: 3,
		3: 2,
		4: 1,
	}

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

func north() -> void:
	_tree[_keyAttackDirection] = 0
	_tree[_keyIdleDirection] = 0
	_tree[_keyWalkDirection] = 0
	_machine.start("Idle")

func east() -> void:
	_tree[_keyAttackDirection] = 1
	_tree[_keyIdleDirection] = 1
	_tree[_keyWalkDirection] = 1
	_machine.start("Idle")

func south() -> void:
	_tree[_keyAttackDirection] = 2
	_tree[_keyIdleDirection] = 2
	_tree[_keyWalkDirection] = 2
	_machine.start("Idle")

func west() -> void:
	_tree[_keyAttackDirection] = 3
	_tree[_keyIdleDirection] = 3
	_tree[_keyWalkDirection] = 3
	_machine.start("Idle")
