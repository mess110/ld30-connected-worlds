class Level0
  constructor: ->
    @scene = new THREE.Scene()
    @scene.fog = new THREE.FogExp2(0x000000, 0.1)

    ground = new Ground()
    @scene.add ground.mesh

    door = new Door()
    door.mesh.position.set -1, 1, -2
    @scene.add door.mesh

    door = new Door()
    door.mesh.position.set 1, 1, -2
    @scene.add door.mesh

    @player = new Zombie()
    @player.mesh.position.setZ 1

    @scene.add @player.mesh


    #player = new Zombie()
    #player.mesh.position.setZ 1
    #@scene.add player.mesh

    #door = new Door()
    #door.mesh.position.set -1, 1, -2
    #@scene.add door.mesh

    #door = new Door()
    #door.mesh.position.set 1, 1, -2
    #@scene.add door.mesh

    #zpotLight = new Spotlight(1, 2.5, 2)
    #@scene.add zpotLight.spotLight
    #@scene.add zpotLight.volumetricSpotlight

    #zpotLight2 = new Spotlight(-1, 2.5, 2)
    #@scene.add zpotLight2.spotLight
    #@scene.add zpotLight2.volumetricSpotlight

    #ground = new Ground()
    #@scene.add ground.mesh

    @zpotLight = new Spotlight(1, 2.5, 2)
    @scene.add @zpotLight.spotLight
    @scene.add @zpotLight.volumetricSpotlight

    @zpotLight2 = new Spotlight(-1, 2.5, 2)
    @scene.add @zpotLight2.spotLight
    @scene.add @zpotLight2.volumetricSpotlight


  tick: (delta, now) ->
    @player.directionZ = -1 if keyboard.pressed("w")
    @player.directionZ = 1 if keyboard.pressed("s")
    @player.directionZ = 0 if !keyboard.pressed("s") and !keyboard.pressed("w")
    @player.directionX = -1 if keyboard.pressed("a")
    @player.directionX = 1 if keyboard.pressed("d")
    @player.directionX = 0 if !keyboard.pressed("a") and !keyboard.pressed("d")

    @player.move(delta)

    @zpotLight.lookAt(@player.mesh)
    @zpotLight2.lookAt(@player.mesh)
