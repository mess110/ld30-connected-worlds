class Ground
  constructor: ->
    geometry = new THREE.CubeGeometry(3, 0.1, 5, 3, 1, 5)
    material = new THREE.MeshPhongMaterial(color: new THREE.Color("gray"))
    @mesh = new THREE.Mesh(geometry, material)
    @mesh.receiveShadow = true
    @mesh.castShadow = true
    @mesh.position.set 0, -geometry.height / 2, 0

    material = new THREE.MeshBasicMaterial(
      wireframe: true
      wireframeLinewidth: 2
      color: new THREE.Color("black")
    )
    mesh2 = new THREE.Mesh(geometry.clone(), material)
    mesh2.receiveShadow = true
    mesh2.castShadow = true
    mesh2.scale.multiplyScalar 1.01
    @mesh.add mesh2
