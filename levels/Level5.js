// Generated by CoffeeScript 1.4.0
var Level5,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Level5 = (function(_super) {

  __extends(Level5, _super);

  function Level5() {
    Level5.__super__.constructor.call(this);
    this.player.say(":D");
    this.ground = new Ground();
    this.scene.add(this.ground.mesh);
    this.counter = new Door("0");
    this.counter.mesh.position.set(1, 0.2, 0);
    this.scene.add(this.counter.mesh);
    this.addSpotlight(0, 2.5, 2);
  }

  Level5.prototype.tick = function(delta, amount) {
    Level5.__super__.tick.call(this, delta, amount);
    return this.counter.say(this.player.jumpCount.toString());
  };

  return Level5;

})(BaseLevel);