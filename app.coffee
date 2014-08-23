renderer = new THREE.WebGLRenderer()
renderer.setSize window.innerWidth, window.innerHeight
document.body.appendChild renderer.domElement
renderer.setClearColor "black", 0
renderer.shadowMapEnabled = true
updateFcts = []
scene = new THREE.Scene()
scene.fog = new THREE.FogExp2(0x000000, 0.1)
camera = new THREE.PerspectiveCamera(45, window.innerWidth / window.innerHeight, 0.3, 10)
camera.position.set 0, 2, 5
camera.lookAt scene.position

keyboard = new THREEx.KeyboardState()

# add back wall
geometry = new THREE.CubeGeometry(20, 0.1, 20, 20, 1, 20)
material = new THREE.MeshPhongMaterial(color: new THREE.Color("gray"))
mesh = new THREE.Mesh(geometry, material)
mesh.receiveShadow = true
mesh.castShadow = true
mesh.rotateX Math.PI / 2
mesh.position.set 0, -geometry.height / 2, -1
scene.add mesh

material = new THREE.MeshBasicMaterial(
  wireframe: true
  wireframeLinewidth: 2
  color: new THREE.Color("black")
)
mesh = new THREE.Mesh(geometry.clone(), material)
mesh.receiveShadow = true
mesh.castShadow = true
mesh.scale.multiplyScalar 1.01
mesh.rotateX Math.PI / 2
mesh.position.set 0, -geometry.height / 2, -1
scene.add mesh

# add ground
geometry = new THREE.CubeGeometry(20, 0.1, 20, 20, 1, 20)
material = new THREE.MeshPhongMaterial(color: new THREE.Color("gray"))
mesh = new THREE.Mesh(geometry, material)
mesh.receiveShadow = true
mesh.castShadow = true
mesh.position.set 0, -geometry.height / 2, 0
scene.add mesh

# add ground - wireframe
material = new THREE.MeshBasicMaterial(
  wireframe: true
  wireframeLinewidth: 2
  color: new THREE.Color("black")
)
mesh = new THREE.Mesh(geometry.clone(), material)
mesh.receiveShadow = true
mesh.castShadow = true
mesh.scale.multiplyScalar 1.01
mesh.position.set 0, -geometry.height / 2, 0
scene.add mesh

# add a cube
geometry = new THREE.CubeGeometry(0.3, 0.3, 0.3)
material = new THREE.MeshPhongMaterial(color: new THREE.Color("gray"))
cube = new THREE.Mesh(geometry, material)
cube.position.set 0.2, geometry.height / 2, 0.5
cube.receiveShadow = true
cube.castShadow = true
cube.speed = 2
scene.add cube

updateFcts.push (delta, now) ->
  target =
    x: cube.position.x
    y: cube.position.y + 3
    z: cube.position.z + 4
  camera.position = target

updateFcts.push (delta, now) ->
  dist = zpotLight.distanceTo(cube)
  #if dist > 3
    #scene.remove spotLight
    #scene.remove volumetricSpotlight
  #else
    #scene.add spotLight
    #scene.add volumetricSpotlight

  if keyboard.pressed("w")
    cube.position.z -= cube.speed * delta
  if keyboard.pressed("s")
    cube.position.z += cube.speed * delta
  if keyboard.pressed("a")
    cube.position.x -= cube.speed * delta
  if keyboard.pressed("d")
    cube.position.x += cube.speed * delta

zpotLight = new Spotlight()
scene.add zpotLight.spotLight
scene.add zpotLight.volumetricSpotlight

updateFcts.push (delta, now) ->
  zpotLight.lookAt(cube)

updateFcts.push ->
  renderer.render scene, camera

lastTimeMsec = null
requestAnimationFrame animate = (nowMsec) ->
  requestAnimationFrame animate

  lastTimeMsec = lastTimeMsec or nowMsec - 1000 / 60
  deltaMsec = Math.min(200, nowMsec - lastTimeMsec)
  lastTimeMsec = nowMsec

  updateFcts.forEach (updateFn) ->
    updateFn deltaMsec / 1000, nowMsec / 1000
