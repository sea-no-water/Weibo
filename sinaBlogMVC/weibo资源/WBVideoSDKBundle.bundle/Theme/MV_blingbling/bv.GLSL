precision mediump float;

attribute vec4 position;
attribute vec4 inputTextureCoordinate;

uniform float texelWidthOffset;
uniform float texelHeightOffset;

varying vec2 blurCoordinates[15];

void main()
{
    gl_Position = position;
    
    vec2 singleStepOffset = vec2(texelWidthOffset, texelHeightOffset);
    blurCoordinates[0] = inputTextureCoordinate.xy;
    blurCoordinates[1] = inputTextureCoordinate.xy + singleStepOffset * 1.496250;
    blurCoordinates[2] = inputTextureCoordinate.xy - singleStepOffset * 1.496250;
    blurCoordinates[3] = inputTextureCoordinate.xy + singleStepOffset * 3.491251;
    blurCoordinates[4] = inputTextureCoordinate.xy - singleStepOffset * 3.491251;
    blurCoordinates[5] = inputTextureCoordinate.xy + singleStepOffset * 5.486253;
    blurCoordinates[6] = inputTextureCoordinate.xy - singleStepOffset * 5.486253;
    blurCoordinates[7] = inputTextureCoordinate.xy + singleStepOffset * 7.481259;
    blurCoordinates[8] = inputTextureCoordinate.xy - singleStepOffset * 7.481259;
    blurCoordinates[9] = inputTextureCoordinate.xy + singleStepOffset * 9.476268;
    blurCoordinates[10] = inputTextureCoordinate.xy - singleStepOffset * 9.476268;
    blurCoordinates[11] = inputTextureCoordinate.xy + singleStepOffset * 11.471281;
    blurCoordinates[12] = inputTextureCoordinate.xy - singleStepOffset * 11.471281;
    blurCoordinates[13] = inputTextureCoordinate.xy + singleStepOffset * 13.466302;
    blurCoordinates[14] = inputTextureCoordinate.xy - singleStepOffset * 13.466302;
}
