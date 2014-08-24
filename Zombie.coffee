class Zombie
  constructor: ->
    geometry = new THREE.CubeGeometry(0.3, 0.3, 0.3)
    material = new THREE.MeshPhongMaterial(color: new THREE.Color("gray"))
    @mesh = new THREE.Mesh(geometry, material)
    @mesh.position.set 0, geometry.height / 2, 0
    @mesh.receiveShadow = true
    @mesh.castShadow = true

    @speed = 2
    @directionX = 0
    @directionZ = 0

    @position = @mesh.position

  move: (delta) ->
    @mesh.position.x += @speed * delta * @directionX
    @mesh.position.z += @speed * delta * @directionZ
