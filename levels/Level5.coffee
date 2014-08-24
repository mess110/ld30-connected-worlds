class Level5 extends BaseLevel
  constructor: ->
    super()

    @player.say ":D"

    @ground = new Ground()
    @scene.add @ground.mesh

    @counter = new Door("0")
    @counter.mesh.position.set 1, 0.2, 0
    @scene.add @counter.mesh


    @addSpotlight(0, 2.5, 2)

  tick: (delta, amount) ->
    super(delta, amount)

    @counter.say @player.jumpCount.toString()
