Shader "Custom/ScreenShader"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo", 2D) = "black" {}
        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0
        [HDR]_EmissionColor ("Emission Color", Color) = (1,1,1,1)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows

        #pragma target 4.5

        sampler2D _MainTex;
        uniform sampler2D _Udon_VideoTex;
        uniform float4 _Udon_VideoTex_TexelSize;
        uniform float4 _EmissionColor;

        struct Input
        {
            float2 uv_MainTex;
        };

        half _Glossiness;
        half _Metallic;
        fixed4 _Color;

        UNITY_INSTANCING_BUFFER_START(Props)
        UNITY_INSTANCING_BUFFER_END(Props)

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
            fixed4 emission = tex2D (_EmissionTex, IN.uv_MainTex) * _EmissionColor;
            if (_Udon_VideoTex_TexelSize.z >= 16)
            {
                c = 0;
                o.Emission = tex2D(_Udon_VideoTex, IN.uv_MainTex) * _EmissionColor;
            }
            o.Albedo = c.rgb;
            o.Emission = emission.rgb;
            o.Metallic = _Metallic;
            o.Smoothness = _Glossiness;
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
