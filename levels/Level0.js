// Generated by CoffeeScript 1.4.0
var Level0,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Level0 = (function(_super) {

  __extends(Level0, _super);

  function Level0() {
    var door, ground;
    Level0.__super__.constructor.call(this);
    ground = new Ground();
    this.scene.add(ground.mesh);
    door = new Door();
    door.mesh.position.set(-1, 1, -2);
    this.scene.add(door.mesh);
    door = new Door();
    door.mesh.position.set(1, 1, -2);
    this.scene.add(door.mesh);
    this.addSpotlight(1, 2.5, 2);
    this.addSpotlight(-1, 2.5, 2);
  }

  return Level0;

})(BaseLevel);
