extends Light2D

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	self.energy = rng.randf_range(0.5, 2)
