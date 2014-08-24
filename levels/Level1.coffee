class Level1 extends BaseLevel
  constructor: ->
    super()

    @player.say ":)"

    @ground = new Ground()
    @scene.add @ground.mesh

    door = new Door("door")
    door.mesh.position.set 0, 0.2, -2
    @scene.add door.mesh

    door = new Door("back")
    door.mesh.position.set -1.2, 0.2, 2.2
    @scene.add door.mesh

    @addSpotlight(1, 2.5, 2)
    @addSpotlight(-1, 2.5, 2)
