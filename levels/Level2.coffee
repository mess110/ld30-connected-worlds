class Level2 extends BaseLevel
  constructor: ->
    super()

    @player.say ":|"

    @ground = new Ground()
    @scene.add @ground.mesh

    door = new Door("xD")
    door.mesh.position.set -1, 0, -2
    door.mesh.rotation.set 0, 1, -Math.PI / 2 - 0.2
    @scene.add door.mesh

    door = new Door("xD")
    door.mesh.position.set -0.8, 0, -1.7
    door.mesh.rotation.set -1, 0.5, -Math.PI / 2
    @scene.add door.mesh

    door = new Door("xD")
    door.mesh.position.set 1, 0, -2
    door.mesh.rotation.set -0.7, 0, -Math.PI / 2 - 0.5
    @scene.add door.mesh

    door = new Door("door")
    door.mesh.position.set 0, 0.2, -2
    @scene.add door.mesh

    door = new Door("back")
    door.mesh.position.set -1.2, 0.2, 2.2
    @scene.add door.mesh

    @addSpotlight(0, 2.5, 2)
