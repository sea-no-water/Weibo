precision mediump float;

uniform sampler2D tex1;

uniform float texelWidthOffset;
uniform float texelHeightOffset;

varying vec2 blurCoordinates[15];
uniform int blurRadius;

uniform float t;
uniform float s;
uniform float e;

void applyRadius10() {
    lowp vec4 sum = vec4(0.0);
    sum += texture2D(tex1, blurCoordinates[0]) * 0.040892;
    sum += texture2D(tex1, blurCoordinates[1]) * 0.080769;
    sum += texture2D(tex1, blurCoordinates[2]) * 0.080769;
    sum += texture2D(tex1, blurCoordinates[3]) * 0.076840;
    sum += texture2D(tex1, blurCoordinates[4]) * 0.076840;
    sum += texture2D(tex1, blurCoordinates[5]) * 0.070242;
    sum += texture2D(tex1, blurCoordinates[6]) * 0.070242;
    sum += texture2D(tex1, blurCoordinates[7]) * 0.061699;
    sum += texture2D(tex1, blurCoordinates[8]) * 0.061699;
    sum += texture2D(tex1, blurCoordinates[9]) * 0.052076;
    sum += texture2D(tex1, blurCoordinates[10]) * 0.052076;
    sum += texture2D(tex1, blurCoordinates[11]) * 0.042234;
    sum += texture2D(tex1, blurCoordinates[12]) * 0.042234;
    sum += texture2D(tex1, blurCoordinates[13]) * 0.032912;
    sum += texture2D(tex1, blurCoordinates[14]) * 0.032912;
     vec2 singleStepOffset = vec2(texelWidthOffset, texelHeightOffset);
    sum += texture2D(tex1, blurCoordinates[0] + singleStepOffset * 15.461327) * 0.024645;
    sum += texture2D(tex1, blurCoordinates[0] - singleStepOffset * 15.461327) * 0.024645;
    sum += texture2D(tex1, blurCoordinates[0] + singleStepOffset * 17.456362) * 0.017732;
    sum += texture2D(tex1, blurCoordinates[0] - singleStepOffset * 17.456362) * 0.017732;
    sum += texture2D(tex1, blurCoordinates[0] + singleStepOffset * 19.451405) * 0.012260;
    sum += texture2D(tex1, blurCoordinates[0] - singleStepOffset * 19.451405) * 0.012260;
    sum += texture2D(tex1, blurCoordinates[0] + singleStepOffset * 21.446457) * 0.008144;
    sum += texture2D(tex1, blurCoordinates[0] - singleStepOffset * 21.446457) * 0.008144;
    gl_FragColor = sum;
}

void applyRadius9() {
    lowp vec4 sum = vec4(0.0);
    sum += texture2D(tex1, blurCoordinates[0]) * 0.045355;
    sum += texture2D(tex1, blurCoordinates[1]) * 0.089325;
    sum += texture2D(tex1, blurCoordinates[2]) * 0.089325;
    sum += texture2D(tex1, blurCoordinates[3]) * 0.083994;
    sum += texture2D(tex1, blurCoordinates[4]) * 0.083994;
    sum += texture2D(tex1, blurCoordinates[5]) * 0.075187;
    sum += texture2D(tex1, blurCoordinates[6]) * 0.075187;
    sum += texture2D(tex1, blurCoordinates[7]) * 0.064070;
    sum += texture2D(tex1, blurCoordinates[8]) * 0.064070;
    sum += texture2D(tex1, blurCoordinates[9]) * 0.051974;
    sum += texture2D(tex1, blurCoordinates[10]) * 0.051974;
    sum += texture2D(tex1, blurCoordinates[11]) * 0.040137;
    sum += texture2D(tex1, blurCoordinates[12]) * 0.040137;
    sum += texture2D(tex1, blurCoordinates[13]) * 0.029506;
    sum += texture2D(tex1, blurCoordinates[14]) * 0.029506;
     vec2 singleStepOffset = vec2(texelWidthOffset, texelHeightOffset);
    sum += texture2D(tex1, blurCoordinates[0] + singleStepOffset * 15.452305) * 0.020649;
    sum += texture2D(tex1, blurCoordinates[0] - singleStepOffset * 15.452305) * 0.020649;
    sum += texture2D(tex1, blurCoordinates[0] + singleStepOffset * 17.446198) * 0.013757;
    sum += texture2D(tex1, blurCoordinates[0] - singleStepOffset * 17.446198) * 0.013757;
    sum += texture2D(tex1, blurCoordinates[0] + singleStepOffset * 19.440104) * 0.008724;
    sum += texture2D(tex1, blurCoordinates[0] - singleStepOffset * 19.440104) * 0.008724;
    gl_FragColor = sum;
}

void applyRadius8() {
    lowp vec4 sum = vec4(0.0);
    sum += texture2D(tex1, blurCoordinates[0]) * 0.050920;
    sum += texture2D(tex1, blurCoordinates[1]) * 0.099877;
    sum += texture2D(tex1, blurCoordinates[2]) * 0.099877;
    sum += texture2D(tex1, blurCoordinates[3]) * 0.092400;
    sum += texture2D(tex1, blurCoordinates[4]) * 0.092400;
    sum += texture2D(tex1, blurCoordinates[5]) * 0.080322;
    sum += texture2D(tex1, blurCoordinates[6]) * 0.080322;
    sum += texture2D(tex1, blurCoordinates[7]) * 0.065609;
    sum += texture2D(tex1, blurCoordinates[8]) * 0.065609;
    sum += texture2D(tex1, blurCoordinates[9]) * 0.050356;
    sum += texture2D(tex1, blurCoordinates[10]) * 0.050356;
    sum += texture2D(tex1, blurCoordinates[11]) * 0.036317;
    sum += texture2D(tex1, blurCoordinates[12]) * 0.036317;
    sum += texture2D(tex1, blurCoordinates[13]) * 0.024611;
    sum += texture2D(tex1, blurCoordinates[14]) * 0.024611;
    vec2 singleStepOffset = vec2(texelWidthOffset, texelHeightOffset);
    sum += texture2D(tex1, blurCoordinates[0] + singleStepOffset * 15.439748) * 0.015671;
    sum += texture2D(tex1, blurCoordinates[0] - singleStepOffset * 15.439748) * 0.015671;
    sum += texture2D(tex1, blurCoordinates[0] + singleStepOffset * 17.432064) * 0.009376;
    sum += texture2D(tex1, blurCoordinates[0] - singleStepOffset * 17.432064) * 0.009376;
    gl_FragColor = sum;
}

void applyRadius7() {
    lowp vec4 sum = vec4(0.0);
    sum += texture2D(tex1, blurCoordinates[0]) * 0.058055;
    sum += texture2D(tex1, blurCoordinates[1]) * 0.113199;
    sum += texture2D(tex1, blurCoordinates[2]) * 0.113199;
    sum += texture2D(tex1, blurCoordinates[3]) * 0.102271;
    sum += texture2D(tex1, blurCoordinates[4]) * 0.102271;
    sum += texture2D(tex1, blurCoordinates[5]) * 0.085191;
    sum += texture2D(tex1, blurCoordinates[6]) * 0.085191;
    sum += texture2D(tex1, blurCoordinates[7]) * 0.065427;
    sum += texture2D(tex1, blurCoordinates[8]) * 0.065427;
    sum += texture2D(tex1, blurCoordinates[9]) * 0.046329;
    sum += texture2D(tex1, blurCoordinates[10]) * 0.046329;
    sum += texture2D(tex1, blurCoordinates[11]) * 0.030246;
    sum += texture2D(tex1, blurCoordinates[12]) * 0.030246;
    sum += texture2D(tex1, blurCoordinates[13]) * 0.018206;
    sum += texture2D(tex1, blurCoordinates[14]) * 0.018206;
     vec2 singleStepOffset = vec2(texelWidthOffset, texelHeightOffset);
    sum += texture2D(tex1, blurCoordinates[0] + singleStepOffset * 15.421572) * 0.010104;
    sum += texture2D(tex1, blurCoordinates[0] - singleStepOffset * 15.421572) * 0.010104;
    gl_FragColor = sum;
}

void applyRadius6() {
    lowp vec4 sum = vec4(0.0);
    sum += texture2D(tex1, blurCoordinates[0]) * 0.067540;
    sum += texture2D(tex1, blurCoordinates[1]) * 0.130499;
    sum += texture2D(tex1, blurCoordinates[2]) * 0.130499;
    sum += texture2D(tex1, blurCoordinates[3]) * 0.113686;
    sum += texture2D(tex1, blurCoordinates[4]) * 0.113686;
    sum += texture2D(tex1, blurCoordinates[5]) * 0.088692;
    sum += texture2D(tex1, blurCoordinates[6]) * 0.088692;
    sum += texture2D(tex1, blurCoordinates[7]) * 0.061965;
    sum += texture2D(tex1, blurCoordinates[8]) * 0.061965;
    sum += texture2D(tex1, blurCoordinates[9]) * 0.038768;
    sum += texture2D(tex1, blurCoordinates[10]) * 0.038768;
    sum += texture2D(tex1, blurCoordinates[11]) * 0.021721;
    sum += texture2D(tex1, blurCoordinates[12]) * 0.021721;
    sum += texture2D(tex1, blurCoordinates[13]) * 0.010898;
    sum += texture2D(tex1, blurCoordinates[14]) * 0.010898;
    gl_FragColor = sum;
}

void applyRadius5() {
    lowp vec4 sum = vec4(0.0);
    sum += texture2D(tex1, blurCoordinates[0]) * 0.080780;
    sum += texture2D(tex1, blurCoordinates[1]) * 0.153750;
    sum += texture2D(tex1, blurCoordinates[2]) * 0.153750;
    sum += texture2D(tex1, blurCoordinates[3]) * 0.126131;
    sum += texture2D(tex1, blurCoordinates[4]) * 0.126131;
    sum += texture2D(tex1, blurCoordinates[5]) * 0.088315;
    sum += texture2D(tex1, blurCoordinates[6]) * 0.088315;
    sum += texture2D(tex1, blurCoordinates[7]) * 0.052777;
    sum += texture2D(tex1, blurCoordinates[8]) * 0.052777;
    sum += texture2D(tex1, blurCoordinates[9]) * 0.026919;
    sum += texture2D(tex1, blurCoordinates[10]) * 0.026919;
    sum += texture2D(tex1, blurCoordinates[11]) * 0.011718;
    sum += texture2D(tex1, blurCoordinates[12]) * 0.011718;
    gl_FragColor = sum;
}

void applyRadius4() {
    lowp vec4 sum = vec4(0.0);
    sum += texture2D(tex1, blurCoordinates[0]) * 0.100590;
    sum += texture2D(tex1, blurCoordinates[1]) * 0.186265;
    sum += texture2D(tex1, blurCoordinates[2]) * 0.186265;
    sum += texture2D(tex1, blurCoordinates[3]) * 0.136940;
    sum += texture2D(tex1, blurCoordinates[4]) * 0.136940;
    sum += texture2D(tex1, blurCoordinates[5]) * 0.078710;
    sum += texture2D(tex1, blurCoordinates[6]) * 0.078710;
    sum += texture2D(tex1, blurCoordinates[7]) * 0.035367;
    sum += texture2D(tex1, blurCoordinates[8]) * 0.035367;
    sum += texture2D(tex1, blurCoordinates[9]) * 0.012422;
    sum += texture2D(tex1, blurCoordinates[10]) * 0.012422;
    gl_FragColor = sum;
}

void applyRadius3() {
    lowp vec4 sum = vec4(0.0);
    sum += texture2D(tex1, blurCoordinates[0]) * 0.133571;
    sum += texture2D(tex1, blurCoordinates[1]) * 0.233308;
    sum += texture2D(tex1, blurCoordinates[2]) * 0.233308;
    sum += texture2D(tex1, blurCoordinates[3]) * 0.135928;
    sum += texture2D(tex1, blurCoordinates[4]) * 0.135928;
    sum += texture2D(tex1, blurCoordinates[5]) * 0.051383;
    sum += texture2D(tex1, blurCoordinates[6]) * 0.051383;
    sum += texture2D(tex1, blurCoordinates[7]) * 0.012595;
    sum += texture2D(tex1, blurCoordinates[8]) * 0.012595;
    gl_FragColor = sum;
}

void applyRadius2() {
    lowp vec4 sum = vec4(0.0);
    sum += texture2D(tex1, blurCoordinates[0]) * 0.199676;
    sum += texture2D(tex1, blurCoordinates[1]) * 0.297323;
    sum += texture2D(tex1, blurCoordinates[2]) * 0.297323;
    sum += texture2D(tex1, blurCoordinates[3]) * 0.091848;
    sum += texture2D(tex1, blurCoordinates[4]) * 0.091848;
    sum += texture2D(tex1, blurCoordinates[5]) * 0.010991;
    sum += texture2D(tex1, blurCoordinates[6]) * 0.010991;
    gl_FragColor = sum;
}

void applyRadius1() {
    lowp vec4 sum = vec4(0.0);
    sum += texture2D(tex1, blurCoordinates[0]) * 0.398943;
    sum += texture2D(tex1, blurCoordinates[1]) * 0.295963;
    sum += texture2D(tex1, blurCoordinates[2]) * 0.295963;
    sum += texture2D(tex1, blurCoordinates[3]) * 0.004566;
    sum += texture2D(tex1, blurCoordinates[4]) * 0.004566;
    gl_FragColor = sum;
}

void main()
{
    
    float rel = t - s;
    float abl = e - s;
    
    if (abl < 0.1) {
        
        if (s == 0.0) {
            if (rel < 0.05) {
                applyRadius7();
            } else if (rel < 0.1) {
                applyRadius6();
            } else if (rel < 0.15) {
                applyRadius5();
            } else if (rel < 0.2) {
                applyRadius4();
            } else if (rel < 0.25) {
                applyRadius3();
            } else if (rel < 0.3) {
                applyRadius2();
            } else {
                applyRadius1();
            }
            
        } else {
            if (rel < 0.05) {
                applyRadius2();
            } else if (rel < 0.1) {
                applyRadius3();
            } else if (rel < 0.15) {
                applyRadius4();
            } else if(rel < 0.2) {
                applyRadius5();
            } else if(rel < 0.25) {
                applyRadius6();
            } else if(rel < 0.3) {
                applyRadius6();
            } else if(rel < 0.35) {
                applyRadius5();
            } else if(rel < 0.4) {
                applyRadius4();
            } else if(rel < 0.45) {
                applyRadius3();
            } else {
                applyRadius2();
            }
        }
    } else if (abl >= 0.1) {
        
        if (rel < 0.1) {
            applyRadius2();
        } else if (rel < 0.2) {
            applyRadius3();
        } else if (rel < 0.3) {
            applyRadius4();
        } else if (rel < 0.4) {
            applyRadius5();
        } else if (rel < 0.5) {
            applyRadius6();
        } else if (rel < 0.6) {
            applyRadius5();
        } else if (rel < 0.7) {
            applyRadius4();
        } else if (rel < 0.8) {
            applyRadius3();
        } else if (rel < 0.9) {
            applyRadius2();
        } else {
            applyRadius1();
        }

    }
    
}
