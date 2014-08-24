// Generated by CoffeeScript 1.4.0
var Level3,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Level3 = (function(_super) {

  __extends(Level3, _super);

  function Level3() {
    Level3.__super__.constructor.call(this);
    this.player.say(":(");
    this.ground = new Ground();
    this.scene.add(this.ground.mesh);
    this.van = new Van("van");
    this.van.mesh.position.z = -20;
    this.scene.add(this.van.mesh);
    this.addSpotlight(0, 2.5, 2);
    this.spotlights[0].spotLight.position.z = 5;
    this.spotlights[0].setColor("#FF0000");
  }

  Level3.prototype.tick = function(delta, amount) {
    Level3.__super__.tick.call(this, delta, amount);
    if (this.van.mesh.position.z < 2) {
      this.van.mesh.position.z += 8 * delta;
    }
    if (this.van.mesh.position.z > this.player.mesh.position.z) {
      return this.player.canMove = false;
    }
  };

  return Level3;

})(BaseLevel);
