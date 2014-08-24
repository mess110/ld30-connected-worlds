// Generated by CoffeeScript 1.4.0
var Ground;

Ground = (function() {

  function Ground() {
    var geometry, material, mesh2;
    geometry = new THREE.CubeGeometry(3, 0.1, 3, 3, 1, 3);
    material = new THREE.MeshPhongMaterial({
      color: new THREE.Color("gray")
    });
    this.mesh = new THREE.Mesh(geometry, material);
    this.mesh.receiveShadow = true;
    this.mesh.castShadow = true;
    this.mesh.position.set(0, -geometry.height / 2, 0);
    material = new THREE.MeshBasicMaterial({
      wireframe: true,
      wireframeLinewidth: 2,
      color: new THREE.Color("black")
    });
    mesh2 = new THREE.Mesh(geometry.clone(), material);
    mesh2.receiveShadow = true;
    mesh2.castShadow = true;
    mesh2.scale.multiplyScalar(1.01);
    this.mesh.add(mesh2);
  }

  return Ground;

})();
