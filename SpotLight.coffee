class Spotlight
  constructor: ->
    geometry = new THREE.CylinderGeometry(0.1, 1.5, 5, 32 * 2, 20, true)

    geometry.applyMatrix new THREE.Matrix4().makeTranslation(0, -geometry.height / 2, 0)
    geometry.applyMatrix new THREE.Matrix4().makeRotationX(-Math.PI / 2)

    material = new THREEx.VolumetricSpotLightMaterial()
    @volumetricSpotlight  = new THREE.Mesh(geometry, material)
    @volumetricSpotlight.position.set 1.5, 2, 0
    @volumetricSpotlight.lookAt new THREE.Vector3(0, 0, 0)
    material.uniforms.lightColor.value.set "red"
    material.uniforms.spotPosition.value = mesh.position

    @spotLight = new THREE.SpotLight()
    @spotLight.position = @volumetricSpotlight.position
    @spotLight.color = @volumetricSpotlight.material.uniforms.lightColor.value
    @spotLight.exponent = 30
    @spotLight.angle = Math.PI / 3
    @spotLight.intensity = 5

    light = @spotLight
    light.castShadow = true
    light.shadowCameraNear = 0.01
    light.shadowCameraFar = 15
    light.shadowCameraFov = 45
    light.shadowCameraLeft = -8
    light.shadowCameraRight = 8
    light.shadowCameraTop = 8
    light.shadowCameraBottom = -8

    # light.shadowCameraVisible = true
    light.shadowBias = 0.0
    light.shadowDarkness = 0.5
    light.shadowMapWidth = 1024
    light.shadowMapHeight = 1024

  distanceTo: (node) ->
    @spotLight.position.distanceTo(node.position)

  lookAt: (node) ->
    target = node.position
    @volumetricSpotlight.lookAt target
    @spotLight.target.position.copy target

