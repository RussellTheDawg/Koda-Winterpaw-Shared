Shader "Bino/Fast Skybox"
{
    Properties
    {
        [HDR]_ColorTop("Color Top Skybox", Color) = (1,1,1,1)
        [HDR]_ColorBottom("Color Bottom Skybox", Color) = (1,1,1,1)
    }
    SubShader
    {

        Tags { "RenderType"="Opaque" }

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            float2 hash2d(float2 p)
            {
                float3 p3 = frac(float3(p.xyx) * float3(.1031, .1030, .0973));
                p3 += dot(p3, p3.yzx+19.19);
                return frac((p3.xx+p3.yz) * p3.zy);
            }

            float4 _ColorTop;
            float4 _ColorBottom;

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                float4 gradientBack = _ColorBottom * saturate(1 - i.uv.y * 1.5);
                gradientBack += _ColorTop * saturate(i.uv.y * 5);
                float4 color = gradientBack;

                float stars = 0;

                color += stars;


                return color;
            }
            ENDCG
        }
    }
}
