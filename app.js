// Generated by CoffeeScript 1.4.0
var animate, camera, ground, keyboard, lastTimeMsec, player, renderer, scene, updateFcts, zpotLight;

renderer = new THREE.WebGLRenderer();

renderer.setSize(window.innerWidth, window.innerHeight);

document.body.appendChild(renderer.domElement);

renderer.setClearColor("black", 0);

renderer.shadowMapEnabled = true;

updateFcts = [];

scene = new THREE.Scene();

scene.fog = new THREE.FogExp2(0x000000, 0.1);

camera = new THREE.PerspectiveCamera(45, window.innerWidth / window.innerHeight, 0.3, 10);

camera.position.set(0, 2, 5);

camera.lookAt(scene.position);

keyboard = new THREEx.KeyboardState();

ground = new Ground();

scene.add(ground.mesh);

player = new Zombie();

scene.add(player.mesh);

updateFcts.push(function(delta, now) {
  player.mesh.rotation.y += delta * 1;
  if (keyboard.pressed("w")) {
    player.directionZ = -1;
  }
  if (keyboard.pressed("s")) {
    player.directionZ = 1;
  }
  if (!keyboard.pressed("s") && !keyboard.pressed("w")) {
    player.directionZ = 0;
  }
  if (keyboard.pressed("a")) {
    player.directionX = -1;
  }
  if (keyboard.pressed("d")) {
    player.directionX = 1;
  }
  if (!keyboard.pressed("a") && !keyboard.pressed("d")) {
    player.directionX = 0;
  }
  return player.move(delta);
});

zpotLight = new Spotlight(0, 2.5, 2);

scene.add(zpotLight.spotLight);

scene.add(zpotLight.volumetricSpotlight);

updateFcts.push(function(delta, now) {
  return zpotLight.lookAt(player.mesh);
});

lastTimeMsec = null;

requestAnimationFrame(animate = function(nowMsec) {
  var deltaMsec;
  requestAnimationFrame(animate);
  lastTimeMsec = lastTimeMsec || nowMsec - 1000 / 60;
  deltaMsec = Math.min(200, nowMsec - lastTimeMsec);
  lastTimeMsec = nowMsec;
  updateFcts.forEach(function(updateFn) {
    return updateFn(deltaMsec / 1000, nowMsec / 1000);
  });
  return renderer.render(scene, camera);
});
