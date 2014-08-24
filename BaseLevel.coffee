class BaseLevel
  constructor: ->
    @scene = new THREE.Scene()
    @scene.fog = new THREE.FogExp2(0x000000, 0.1)

    @spotlights = []

    @player = new Zombie()
    @player.mesh.position.setZ 1
    @scene.add @player.mesh

  addSpotlight: (x, y, z) ->
    spotLight = new Spotlight(x, y, z)

    @scene.add spotLight.spotLight
    @scene.add spotLight.volumetricSpotlight

    @spotlights.push spotLight


  tick: (delta, now) ->
    @player.directionZ = -1 if keyboard.pressed("w")
    @player.directionZ = 1 if keyboard.pressed("s")
    @player.directionZ = 0 if !keyboard.pressed("s") and !keyboard.pressed("w")
    @player.directionX = -1 if keyboard.pressed("a")
    @player.directionX = 1 if keyboard.pressed("d")
    @player.directionX = 0 if !keyboard.pressed("a") and !keyboard.pressed("d")

    @player.move(delta)

    for spotLight in @spotlights
      spotLight.lookAt @player
