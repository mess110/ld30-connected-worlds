// Generated by CoffeeScript 1.4.0
var Level0;

Level0 = (function() {

  function Level0() {
    var door, ground;
    this.scene = new THREE.Scene();
    this.scene.fog = new THREE.FogExp2(0x000000, 0.1);
    ground = new Ground();
    this.scene.add(ground.mesh);
    door = new Door();
    door.mesh.position.set(-1, 1, -2);
    this.scene.add(door.mesh);
    door = new Door();
    door.mesh.position.set(1, 1, -2);
    this.scene.add(door.mesh);
    this.player = new Zombie();
    this.player.mesh.position.setZ(1);
    this.scene.add(this.player.mesh);
    this.zpotLight = new Spotlight(1, 2.5, 2);
    this.scene.add(this.zpotLight.spotLight);
    this.scene.add(this.zpotLight.volumetricSpotlight);
    this.zpotLight2 = new Spotlight(-1, 2.5, 2);
    this.scene.add(this.zpotLight2.spotLight);
    this.scene.add(this.zpotLight2.volumetricSpotlight);
  }

  Level0.prototype.tick = function(delta, now) {
    if (keyboard.pressed("w")) {
      this.player.directionZ = -1;
    }
    if (keyboard.pressed("s")) {
      this.player.directionZ = 1;
    }
    if (!keyboard.pressed("s") && !keyboard.pressed("w")) {
      this.player.directionZ = 0;
    }
    if (keyboard.pressed("a")) {
      this.player.directionX = -1;
    }
    if (keyboard.pressed("d")) {
      this.player.directionX = 1;
    }
    if (!keyboard.pressed("a") && !keyboard.pressed("d")) {
      this.player.directionX = 0;
    }
    this.player.move(delta);
    this.zpotLight.lookAt(this.player.mesh);
    return this.zpotLight2.lookAt(this.player.mesh);
  };

  return Level0;

})();
