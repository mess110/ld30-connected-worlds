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

ground = new Ground()
scene.add ground.mesh

player = new Zombie()
player.mesh.position.setZ 1
scene.add player.mesh

door = new Door()
door.mesh.position.set -1, 1, -2
scene.add door.mesh

door = new Door()
door.mesh.position.set 1, 1, -2
scene.add door.mesh

updateFcts.push (delta, now) ->
  player.directionZ = -1 if keyboard.pressed("w")
  player.directionZ = 1 if keyboard.pressed("s")
  player.directionZ = 0 if !keyboard.pressed("s") and !keyboard.pressed("w")
  player.directionX = -1 if keyboard.pressed("a")
  player.directionX = 1 if keyboard.pressed("d")
  player.directionX = 0 if !keyboard.pressed("a") and !keyboard.pressed("d")

  player.move(delta)

zpotLight = new Spotlight(1, 2.5, 2)
scene.add zpotLight.spotLight
scene.add zpotLight.volumetricSpotlight

zpotLight2 = new Spotlight(-1, 2.5, 2)
scene.add zpotLight2.spotLight
scene.add zpotLight2.volumetricSpotlight

updateFcts.push (delta, now) ->
  zpotLight.lookAt(player.mesh)
  zpotLight2.lookAt(player.mesh)

lastTimeMsec = null
requestAnimationFrame animate = (nowMsec) ->
  requestAnimationFrame animate

  lastTimeMsec = lastTimeMsec or nowMsec - 1000 / 60
  deltaMsec = Math.min(200, nowMsec - lastTimeMsec)
  lastTimeMsec = nowMsec

  updateFcts.forEach (updateFn) ->
    updateFn deltaMsec / 1000, nowMsec / 1000

  renderer.render scene, camera
