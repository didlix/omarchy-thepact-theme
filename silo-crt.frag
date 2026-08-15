#version 300 es
// Silo CRT: static scanlines + phosphor mask + vignette + slight teal tint.
// Deliberately time-free so Hyprland's damage tracking can stay enabled —
// animated shaders (like astroland's vhs.frag) need damage_tracking=false,
// which forces constant full-screen redraws; too costly at 5120x2880.
// Toggle at runtime with `silo-crt on|off`.
precision highp float;

in vec2 v_texcoord;
uniform sampler2D tex;
layout(location = 0) out vec4 fragColor;

// Tuned for the Studio Display's 5120x2880 panel.
const vec2 RESOLUTION = vec2(5120.0, 2880.0);
const float SCANLINE_PERIOD = 4.0;     // physical px per scanline
const float SCANLINE_STRENGTH = 0.10;  // 0 = off
const float MASK_PERIOD = 3.0;         // vertical phosphor triad width, px
const float MASK_STRENGTH = 0.04;      // 0 = off
const float VIGNETTE = 0.22;           // corner darkening
const vec3 PHOSPHOR_TINT = vec3(0.96, 1.02, 1.00); // faint teal-green push

void main() {
  vec2 uv = v_texcoord;
  vec3 col = texture(tex, uv).rgb;

  vec2 px = uv * RESOLUTION;
  float TAU = 6.28318530;

  float scan = 0.5 + 0.5 * sin(px.y * TAU / SCANLINE_PERIOD);
  col *= 1.0 - SCANLINE_STRENGTH * scan;

  float mask = 0.5 + 0.5 * sin(px.x * TAU / MASK_PERIOD);
  col *= 1.0 - MASK_STRENGTH * mask;

  vec2 c = uv - 0.5;
  col *= 1.0 - VIGNETTE * dot(c, c) * 2.0;

  col *= PHOSPHOR_TINT;

  fragColor = vec4(clamp(col, 0.0, 1.0), 1.0);
}
