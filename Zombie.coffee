class Zombie
  DYNAMIC_TEXTURE_SIZE = 128

  constructor: ->
    @dynamicTexture = new THREEx.DynamicTexture(DYNAMIC_TEXTURE_SIZE, DYNAMIC_TEXTURE_SIZE)
    @dynamicTexture.context.font = "30px Verdana"

    geometry = new THREE.CubeGeometry(0.3, 0.3, 0.3)
    material = new THREE.MeshPhongMaterial(
      map: @dynamicTexture.texture
    )
    @mesh = new THREE.Mesh(geometry, material)
    @mesh.position.set 0, geometry.height / 2, 0
    @mesh.receiveShadow = true
    @mesh.castShadow = true

    @speed = 2
    @directionX = 0
    @directionZ = 0

    @position = @mesh.position

    @say ':D'

  move: (delta) ->
    @mesh.position.x += @speed * delta * @directionX
    @mesh.position.z += @speed * delta * @directionZ

    @mesh.rotation.y += @speed * delta * 8 if @directionX != 0 or @directionZ != 0

  say: (s) ->
    @dynamicTexture.clear()
    half = DYNAMIC_TEXTURE_SIZE / 2
    @dynamicTexture.drawText(s, half - s.length * 8, half, 'white')
