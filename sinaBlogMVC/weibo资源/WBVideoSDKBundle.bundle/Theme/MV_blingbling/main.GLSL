precision mediump float;

uniform sampler2D tex1;
uniform sampler2D tex2;
uniform sampler2D tex3;
uniform sampler2D tex4;
uniform sampler2D tex5;

varying vec2 texCoord;

uniform float t;

vec4 w = vec4(1.0);

vec4 lut(vec4 base, sampler2D tex) {
    vec4 ret = base;
    ret.r = texture2D(tex, vec2(base.r, 0.0)).r;
    ret.g = texture2D(tex, vec2(base.g, 0.0)).g;
    ret.b = texture2D(tex, vec2(base.b, 0.0)).b;
    return ret;
}

void main()
{
    vec4 base = texture2D(tex1, texCoord);
    vec4 over = texture2D(tex2, texCoord);
    
    if (t > 3.0 && t < 4.0) {
        float rel = t - 3.0;
        vec4 dis = texture2D(tex5, texCoord);
        base.rgb = mix(base.rgb, dis.rgb, 4.0 * rel * (1.0 - rel));
    }
    
    base = lut(base, tex3);
    base = lut(base, tex4);
    
    gl_FragColor = w - (w - base) * (w - over);
}