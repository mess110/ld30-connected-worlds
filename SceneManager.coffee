class SceneManager

  instance = null

  class PrivateClass
    constructor: () ->
      @scenes = []
      @index = 0

    addScene: (scene) ->
      @scenes.push scene

    setScene: (i) ->
      @index = i

    isEmpty: ->
      @scenes.length == 0

    scene: ->
      @scenes[@index]

    tick: (delta, now) ->
      @scene().tick(delta, now)

  @get: () ->
    instance ?= new PrivateClass()
