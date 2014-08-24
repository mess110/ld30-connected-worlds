// Generated by CoffeeScript 1.4.0
var Level0,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Level0 = (function(_super) {

  __extends(Level0, _super);

  function Level0() {
    Level0.__super__.constructor.call(this);
    this.player.say(":)");
    this.ground = new Ground();
    this.scene.add(this.ground.mesh);
    this.door1 = new Door("door");
    this.door1.mesh.position.set(-1, 0.2, -2);
    this.scene.add(this.door1.mesh);
    this.door2 = new Door("door");
    this.door2.mesh.position.set(1, 0.2, -2);
    this.scene.add(this.door2.mesh);
    this.addSpotlight(1, 2.5, 2);
    this.addSpotlight(-1, 2.5, 2);
  }

  Level0.prototype.tick = function(delta, amount) {
    Level0.__super__.tick.call(this, delta, amount);
    if (keyboard.pressed("space")) {
      if (this.player.mesh.position.distanceTo(this.door1.mesh.position) < 0.3) {
        SceneManager.get().setScene(1);
      }
      if (this.player.mesh.position.distanceTo(this.door2.mesh.position) < 0.3) {
        return SceneManager.get().setScene(4);
      }
    }
  };

  return Level0;

})(BaseLevel);
