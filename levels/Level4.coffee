class Level4 extends BaseLevel
  constructor: ->
    super()

    @player.say ":D"

    @ground = new Ground()
    @scene.add @ground.mesh

    door = new Door("prize")
    door.mesh.position.set 0, 0.2, -1.5
    @scene.add door.mesh

    door = new Door("back")
    door.mesh.position.set 1.2, 0.2, 2.2
    @scene.add door.mesh

    @addSpotlight(0, 2.5, 2)
