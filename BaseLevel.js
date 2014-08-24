// Generated by CoffeeScript 1.4.0
var BaseLevel;

BaseLevel = (function() {

  function BaseLevel() {
    this.scene = new THREE.Scene();
    this.scene.fog = new THREE.FogExp2(0x000000, 0.1);
    this.spotlights = [];
    this.player = new Zombie();
    this.player.mesh.position.setZ(1);
    this.scene.add(this.player.mesh);
  }

  BaseLevel.prototype.addSpotlight = function(x, y, z) {
    var spotLight;
    spotLight = new Spotlight(x, y, z);
    this.scene.add(spotLight.spotLight);
    this.scene.add(spotLight.volumetricSpotlight);
    return this.spotlights.push(spotLight);
  };

  BaseLevel.prototype.tick = function(delta, now) {
    var spotLight, _i, _len, _ref, _results;
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
    _ref = this.spotlights;
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      spotLight = _ref[_i];
      _results.push(spotLight.lookAt(this.player));
    }
    return _results;
  };

  return BaseLevel;

})();
