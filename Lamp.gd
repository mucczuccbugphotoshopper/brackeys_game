extends Light2D

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
func _physics_process(delta):
	self.energy = rng.randf_range(0.5, 1)
