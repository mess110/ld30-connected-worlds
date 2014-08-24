class Level0 extends BaseLevel
  constructor: ->
    super()

    @player.say ":)"

    @ground = new Ground()
    @scene.add @ground.mesh

    door = new Door("door")
    door.mesh.position.set -1, 0.2, -2
    @scene.add door.mesh

    door = new Door("door")
    door.mesh.position.set 1, 0.2, -2
    @scene.add door.mesh

    @addSpotlight(1, 2.5, 2)
    @addSpotlight(-1, 2.5, 2)

  tick: (delta, amount) ->
    super(delta, amount)

    above = @ground.isAboveGround(@player)
    #unless above
      #@player.dead = true
