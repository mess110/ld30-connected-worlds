// Generated by CoffeeScript 1.4.0
var Door,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Door = (function(_super) {

  __extends(Door, _super);

  function Door() {
    Door.__super__.constructor.call(this);
    this.say("door");
  }

  return Door;

})(Zombie);