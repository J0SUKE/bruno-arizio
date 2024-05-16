uniform sampler2D image;
uniform sampler2D stroke;

uniform float transition;

varying float opacity;

varying vec2 vUv;

void main() {
  vec4 tex = texture2D(image, vUv);

  vec4 strokeTexture = texture2D(stroke, vUv);

  vec3 mixture  = mix(strokeTexture.rgb, tex.rgb, transition);

  gl_FragColor = vec4(mixture.rgb, mix(strokeTexture.a, tex.a, transition) * opacity);
}
