class Level0 extends BaseLevel
  constructor: ->
    super()

    ground = new Ground()
    @scene.add ground.mesh

    door = new Door()
    door.mesh.position.set -1, 1, -2
    @scene.add door.mesh

    door = new Door()
    door.mesh.position.set 1, 1, -2
    @scene.add door.mesh

    @addSpotlight(1, 2.5, 2)
    @addSpotlight(-1, 2.5, 2)
