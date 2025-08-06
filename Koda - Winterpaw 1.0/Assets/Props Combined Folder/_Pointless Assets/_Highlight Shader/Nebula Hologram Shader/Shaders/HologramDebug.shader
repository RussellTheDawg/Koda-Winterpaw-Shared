// Made with Amplify Shader Editor v1.9.5.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "HologramDebug"
{
	Properties
	{
		_DepthFade("Depth Fade", Range( 0 , 10)) = 0
		[HDR]_Color1("Color 0", Color) = (0.6981132,0.6981132,0.6981132,0)
		[HDR]_Color2("Color 1", Color) = (0.6981132,0.6981132,0.6981132,0)
		[HDR]_Color3("Color 2", Color) = (0.6981132,0.6981132,0.6981132,0)
		[HDR][NoScaleOffset][SingleLineTexture]_NoiseTex("NoiseTex", 2D) = "white" {}
		[HDR][NoScaleOffset][SingleLineTexture]_GlowTex("GlowTex", 2D) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  }
		Cull Back
		Blend One OneMinusSrcAlpha
		
		CGPROGRAM
		#include "UnityCG.cginc"
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Unlit keepalpha noshadow 
		struct Input
		{
			float3 worldPos;
			float3 worldNormal;
			INTERNAL_DATA
			float4 screenPos;
		};

		UNITY_DECLARE_DEPTH_TEXTURE( _CameraDepthTexture );
		uniform float4 _CameraDepthTexture_TexelSize;
		uniform float _DepthFade;
		uniform sampler2D _GlowTex;
		uniform float4 _Color1;
		uniform sampler2D _NoiseTex;
		uniform float4 _Color2;
		uniform float4 _Color3;


inline float4 TriplanarSampling130( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
{
	float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
	projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
	float3 nsign = sign( worldNormal );
	half4 xNorm; half4 yNorm; half4 zNorm;
	xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
	yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
	zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
	return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
}


inline float4 TriplanarSampling120( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
{
	float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
	projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
	float3 nsign = sign( worldNormal );
	half4 xNorm; half4 yNorm; half4 zNorm;
	xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
	yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
	zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
	return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
}


		float4 CalculateContrast( float contrastValue, float4 colorTarget )
		{
			float t = 0.5 * ( 1.0 - contrastValue );
			return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
		}

inline float4 TriplanarSampling73( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
{
	float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
	projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
	float3 nsign = sign( worldNormal );
	half4 xNorm; half4 yNorm; half4 zNorm;
	xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
	yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
	zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
	return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
}


inline float4 TriplanarSampling74( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
{
	float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
	projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
	float3 nsign = sign( worldNormal );
	half4 xNorm; half4 yNorm; half4 zNorm;
	xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
	yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
	zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
	return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
}


inline float4 TriplanarSampling75( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
{
	float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
	projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
	float3 nsign = sign( worldNormal );
	half4 xNorm; half4 yNorm; half4 zNorm;
	xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
	yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
	zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
	return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
}


		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			o.Normal = float3(0,0,1);
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 ase_normWorldNormal = normalize( ase_worldNormal );
			float fresnelNdotV33 = dot( ase_normWorldNormal, ase_worldViewDir );
			float fresnelNode33 = ( 0.0 + 0.51 * pow( max( 1.0 - fresnelNdotV33 , 0.0001 ), 0.68 ) );
			float saferPower37 = abs( ( 1.0 - fresnelNode33 ) );
			float temp_output_34_0 = saturate( pow( saferPower37 , 13.4 ) );
			float fresnelNdotV6 = dot( ase_normWorldNormal, ase_worldViewDir );
			float fresnelNode6 = ( 0.0 + 3.0 * pow( max( 1.0 - fresnelNdotV6 , 0.0001 ), 6.0 ) );
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float eyeDepth1_g10 = LinearEyeDepth(SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_screenPosNorm.xy ));
			float smoothstepResult4_g10 = smoothstep( 0.0 , 1.0 , ( ( eyeDepth1_g10 - ase_screenPos.w ) / _DepthFade ));
			float3 ase_vertex3Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float4 unityObjectToClipPos3_g9 = UnityObjectToClipPos( ase_vertex3Pos );
			float4 computeScreenPos5_g9 = ComputeScreenPos( unityObjectToClipPos3_g9 );
			float temp_output_20_0_g9 = 500.0;
			float4 unityObjectToClipPos4_g9 = UnityObjectToClipPos( float3(0,0,0) );
			float4 computeScreenPos6_g9 = ComputeScreenPos( unityObjectToClipPos4_g9 );
			float4 transform10_g9 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
			float cos169 = cos( 0.9 );
			float sin169 = sin( 0.9 );
			float2 rotator169 = mul( (( ( ( ( computeScreenPos5_g9 / (computeScreenPos5_g9).w ) * temp_output_20_0_g9 ) - ( temp_output_20_0_g9 * ( computeScreenPos6_g9 / (computeScreenPos6_g9).w ) ) ) * length( ( float4( _WorldSpaceCameraPos , 0.0 ) - transform10_g9 ) ) )).xy - float2( 0,0 ) , float2x2( cos169 , -sin169 , sin169 , cos169 )) + float2( 0,0 );
			float2 panner15 = ( 10.0 * _Time.y * float2( 1,1 ) + float2( 0,0 ));
			float temp_output_24_0 = saturate( sin( (rotator169*1.0 + panner15).y ) );
			float3 temp_output_122_0 = ( ase_worldPos * 1.0 );
			float2 panner106 = ( 0.1 * _Time.y * float2( -0.2,-0.5 ) + temp_output_122_0.xy);
			float2 temp_cast_2 = (( ase_worldPos.z * 1.0 )).xx;
			float2 panner133 = ( 0.15 * _Time.y * float2( 0.8,0 ) + temp_cast_2);
			float3 appendResult127 = (float3(panner106 , panner133.x));
			float4 triplanar130 = TriplanarSampling130( _GlowTex, ( appendResult127 * 1.0 ), ase_worldNormal, 1.0, float2( 1,1 ), 1.0, 0 );
			float2 panner109 = ( 0.05 * _Time.y * float2( 1.2,-1 ) + temp_output_122_0.xy);
			float3 appendResult124 = (float3(panner109 , panner133.x));
			float4 triplanar120 = TriplanarSampling120( _GlowTex, ( appendResult124 * 0.5 ), ase_worldNormal, 1.0, float2( 1,1 ), 1.0, 0 );
			float4 temp_cast_4 = (( triplanar130.x * triplanar120.x )).xxxx;
			float grayscale174 = (CalculateContrast(4.9,temp_cast_4).rgb.r + CalculateContrast(4.9,temp_cast_4).rgb.g + CalculateContrast(4.9,temp_cast_4).rgb.b) / 3;
			float saferPower108 = abs( grayscale174 );
			float temp_output_113_0 = saturate( ( pow( saferPower108 , 15.0 ) * 2.0 ) );
			float mulTime51 = _Time.y * 0.25;
			float3 temp_output_56_0 = ( ase_worldPos * 1.0 );
			float2 panner61 = ( mulTime51 * float2( -0.7,0.5 ) + temp_output_56_0.xy);
			float temp_output_52_0 = ( ase_worldPos.z * 1.0 );
			float2 temp_cast_7 = (temp_output_52_0).xx;
			float2 panner53 = ( mulTime51 * float2( 0.7,1 ) + temp_cast_7);
			float3 appendResult63 = (float3(panner61 , panner53.x));
			float4 triplanar73 = TriplanarSampling73( _NoiseTex, ( appendResult63 * 0.3 ), ase_worldNormal, 1.0, float2( 1,1 ), 1.0, 0 );
			float2 panner60 = ( mulTime51 * float2( 1.2,1 ) + temp_output_56_0.xy);
			float2 temp_cast_9 = (temp_output_52_0).xx;
			float2 panner54 = ( mulTime51 * float2( 0.8,0 ) + temp_cast_9);
			float3 appendResult64 = (float3(panner60 , panner54.x));
			float4 triplanar74 = TriplanarSampling74( _NoiseTex, ( appendResult64 * 0.2 ), ase_worldNormal, 1.0, float2( 1,1 ), 1.0, 0 );
			float2 panner62 = ( mulTime51 * float2( 0.65,1 ) + temp_output_56_0.xy);
			float2 temp_cast_11 = (temp_output_52_0).xx;
			float2 panner55 = ( mulTime51 * float2( -1.2,1 ) + temp_cast_11);
			float3 appendResult65 = (float3(panner62 , panner55.x));
			float4 triplanar75 = TriplanarSampling75( _NoiseTex, ( appendResult65 * 0.25 ), ase_worldNormal, 1.0, float2( 1,1 ), 1.0, 0 );
			float3 saferPower47 = abs( ( ( _Color1.rgb * triplanar73.x ) + ( _Color2.rgb * triplanar74.x ) + ( _Color3.rgb * triplanar75.x ) ) );
			o.Emission = ( saturate( ( ( temp_output_34_0 * 0.5 ) + saturate( fresnelNode6 ) + ( 1.0 - smoothstepResult4_g10 ) + saturate( ( ( temp_output_24_0 * temp_output_34_0 * 5.0 ) * temp_output_113_0 ) ) + ( temp_output_113_0 * 0.5 ) + 0.05 ) ) * ( pow( saferPower47 , 2.0 ) * 1.0 ) );
			o.Alpha = 0.75;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=19501
Node;AmplifyShaderEditor.WorldPosInputsNode;121;-672,960;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;131;-656,1136;Inherit;False;Constant;_Float2;Float 0;5;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;132;-480,1088;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;133;-288,1088;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0.8,0;False;1;FLOAT;0.15;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;122;-384,976;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.BreakToComponentsNode;134;-112,1088;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.PannerNode;109;-176,848;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;1.2,-1;False;1;FLOAT;0.05;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;106;-176,640;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;-0.2,-0.5;False;1;FLOAT;0.1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;127;16,640;Inherit;False;FLOAT3;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;129;32,768;Inherit;False;Constant;_Float8;Float 4;5;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;124;32,864;Inherit;False;FLOAT3;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;126;48,992;Inherit;False;Constant;_Float7;Float 4;5;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;128;272,672;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;125;288,896;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexturePropertyNode;175;176,320;Inherit;True;Property;_GlowTex;GlowTex;7;3;[HDR];[NoScaleOffset];[SingleLineTexture];Create;True;0;0;0;False;0;False;None;a50773e4f84b0454f825561119b0c041;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;171;-1856,-480;Inherit;False;Constant;_Float10;Float 10;6;0;Create;True;0;0;0;False;0;False;0.9;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;46;-2016,-672;Inherit;True;ScreenSpaceUVLockedToObject;-1;;9;bcc05ebb4d97a5844a7b143c5d825e6e;0;1;20;FLOAT;500;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TriplanarNode;120;464,864;Inherit;True;Spherical;World;False;Top Texture 3;_TopTexture3;white;-1;None;Mid Texture 3;_MidTexture3;white;-1;None;Bot Texture 3;_BotTexture3;white;-1;None;Triplanar Sampler;Tangent;10;0;SAMPLER2D;;False;5;FLOAT;1;False;1;SAMPLER2D;;False;6;FLOAT;0;False;2;SAMPLER2D;;False;7;FLOAT;0;False;9;FLOAT3;0,0,0;False;8;FLOAT;1;False;3;FLOAT2;1,1;False;4;FLOAT;1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TriplanarNode;130;480,656;Inherit;True;Spherical;World;False;Top Texture 4;_TopTexture4;white;-1;None;Mid Texture 4;_MidTexture4;white;-1;None;Bot Texture 4;_BotTexture4;white;-1;None;Triplanar Sampler;Tangent;10;0;SAMPLER2D;;False;5;FLOAT;1;False;1;SAMPLER2D;;False;6;FLOAT;0;False;2;SAMPLER2D;;False;7;FLOAT;0;False;9;FLOAT3;0,0,0;False;8;FLOAT;1;False;3;FLOAT2;1,1;False;4;FLOAT;1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WorldPosInputsNode;49;-3152,800;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;48;-3008,528;Inherit;False;Constant;_Float1;Float 1;5;0;Create;True;0;0;0;False;0;False;0.25;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;50;-3056,1152;Inherit;False;Constant;_Float0;Float 0;5;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;15;-1584,-448;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;1,1;False;1;FLOAT;10;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;169;-1696,-672;Inherit;True;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;112;880,688;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;52;-2928,896;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;51;-2848,528;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;33;-1408,-368;Inherit;True;Standard;WorldNormal;ViewDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0.51;False;3;FLOAT;0.68;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;22;-1408,-528;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT;1;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;173;1040,688;Inherit;True;2;1;COLOR;0,0,0,0;False;0;FLOAT;4.9;False;1;COLOR;0
Node;AmplifyShaderEditor.PannerNode;53;-2560,608;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0.7,1;False;1;FLOAT;0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;55;-2576,1184;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;-1.2,1;False;1;FLOAT;0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;56;-2928,784;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PannerNode;54;-2576,896;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0.8,0;False;1;FLOAT;0.15;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;35;-1120,-368;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;21;-1200,-528;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.TFHCGrayscale;174;1264,688;Inherit;False;2;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;57;-2384,608;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.BreakToComponentsNode;59;-2400,1184;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.PannerNode;61;-2560,480;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;-0.7,0.5;False;1;FLOAT;0.2;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;62;-2576,1056;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0.65,1;False;1;FLOAT;0.15;False;1;FLOAT2;0
Node;AmplifyShaderEditor.BreakToComponentsNode;58;-2400,896;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.PannerNode;60;-2576,768;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;1.2,1;False;1;FLOAT;0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SinOpNode;12;-1088,-528;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;108;1456,688;Inherit;True;True;2;0;FLOAT;0;False;1;FLOAT;15;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;37;-976,-368;Inherit;True;True;2;0;FLOAT;0;False;1;FLOAT;13.4;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;63;-2224,528;Inherit;False;FLOAT3;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;64;-2240,816;Inherit;False;FLOAT3;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;66;-2224,656;Inherit;False;Constant;_Float4;Float 4;5;0;Create;True;0;0;0;False;0;False;0.3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;67;-2224,928;Inherit;False;Constant;_Float5;Float 4;5;0;Create;True;0;0;0;False;0;False;0.2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;65;-2240,1104;Inherit;False;FLOAT3;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;68;-2224,1232;Inherit;False;Constant;_Float6;Float 4;5;0;Create;True;0;0;0;False;0;False;0.25;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;24;-960,-528;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;158;-656,-480;Inherit;False;Constant;_Float9;Float 9;6;0;Create;True;0;0;0;False;0;False;5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;155;1696,688;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;34;-752,-368;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;69;-1984,528;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;70;-2000,832;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;71;-1984,1136;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TexturePropertyNode;72;-1920,160;Inherit;True;Property;_NoiseTex;NoiseTex;6;3;[HDR];[NoScaleOffset];[SingleLineTexture];Create;True;0;0;0;False;0;False;None;3b6cfb55bb5abe54fb3d9a55c4d9b500;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;36;-352,-560;Inherit;True;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;113;1952,688;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TriplanarNode;73;-1616,176;Inherit;True;Spherical;World;False;Top Texture 0;_TopTexture0;white;-1;None;Mid Texture 0;_MidTexture0;white;-1;None;Bot Texture 0;_BotTexture0;white;-1;None;Triplanar Sampler;Tangent;10;0;SAMPLER2D;;False;5;FLOAT;1;False;1;SAMPLER2D;;False;6;FLOAT;0;False;2;SAMPLER2D;;False;7;FLOAT;0;False;9;FLOAT3;0,0,0;False;8;FLOAT;1;False;3;FLOAT2;1,1;False;4;FLOAT;1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TriplanarNode;74;-1632,704;Inherit;True;Spherical;World;False;Top Texture 1;_TopTexture1;white;-1;None;Mid Texture 1;_MidTexture1;white;-1;None;Bot Texture 1;_BotTexture1;white;-1;None;Triplanar Sampler;Tangent;10;0;SAMPLER2D;;False;5;FLOAT;1;False;1;SAMPLER2D;;False;6;FLOAT;0;False;2;SAMPLER2D;;False;7;FLOAT;0;False;9;FLOAT3;0,0,0;False;8;FLOAT;1;False;3;FLOAT2;1,1;False;4;FLOAT;1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;76;-1536,-32;Inherit;False;Property;_Color1;Color 0;2;1;[HDR];Create;True;0;0;0;False;0;False;0.6981132,0.6981132,0.6981132,0;0,0.2303667,2,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;77;-1504,480;Inherit;False;Property;_Color2;Color 1;4;1;[HDR];Create;True;0;0;0;False;0;False;0.6981132,0.6981132,0.6981132,0;2,0.02094241,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;78;-1488,928;Inherit;False;Property;_Color3;Color 2;5;1;[HDR];Create;True;0;0;0;False;0;False;0.6981132,0.6981132,0.6981132,0;0,1.308901,2,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.TriplanarNode;75;-1600,1152;Inherit;True;Spherical;World;False;Top Texture 2;_TopTexture2;white;-1;None;Mid Texture 2;_MidTexture2;white;-1;None;Bot Texture 2;_BotTexture2;white;-1;None;Triplanar Sampler;Tangent;10;0;SAMPLER2D;;False;5;FLOAT;1;False;1;SAMPLER2D;;False;6;FLOAT;0;False;2;SAMPLER2D;;False;7;FLOAT;0;False;9;FLOAT3;0,0,0;False;8;FLOAT;1;False;3;FLOAT2;1,1;False;4;FLOAT;1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;30;-896,80;Inherit;False;Depth_Fade;0;;10;a1fbd3177f0df5f47b674224ad73f680;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;159;-96,-592;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;6;-944,-144;Inherit;True;Standard;WorldNormal;ViewDir;True;True;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;3;False;3;FLOAT;6;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;79;-1232,128;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;80;-1200,976;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;81;-1200,608;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;8;-656,-144;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;31;-720,80;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;161;108.5588,-535.1365;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;179;556.3644,-12.2796;Inherit;False;Constant;_Float11;Float 11;7;0;Create;True;0;0;0;False;0;False;0.05;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;156;-416,-336;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;160;288,-64;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;82;-800,672;Inherit;True;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;23;640,-304;Inherit;True;6;6;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;47;-576,672;Inherit;True;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;95;-448,448;Inherit;False;Constant;_Float3;Float 3;6;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;118;896,-304;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;94;-256,416;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;101;-1888,-48;Inherit;False;Tex;-1;True;1;0;SAMPLER2D;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.GetLocalVarNode;102;243.1945,527.566;Inherit;False;101;Tex;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;99;1152,64;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;39;-749.849,-645.8697;Inherit;False;ScreenLines;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;182;2352,16;Inherit;False;Constant;_Float12;Float 12;7;0;Create;True;0;0;0;False;0;False;0.75;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;2512,-176;Float;False;True;-1;2;ASEMaterialInspector;0;0;Unlit;HologramDebug;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Back;0;False;;0;False;;False;0;False;;0;False;;False;0;Custom;0.5;True;False;0;True;Transparent;;Transparent;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;False;3;1;False;;10;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;3;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;16;FLOAT4;0,0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;132;0;121;3
WireConnection;132;1;131;0
WireConnection;133;0;132;0
WireConnection;122;0;121;0
WireConnection;122;1;131;0
WireConnection;134;0;133;0
WireConnection;109;0;122;0
WireConnection;106;0;122;0
WireConnection;127;0;106;0
WireConnection;127;2;134;0
WireConnection;124;0;109;0
WireConnection;124;2;134;0
WireConnection;128;0;127;0
WireConnection;128;1;129;0
WireConnection;125;0;124;0
WireConnection;125;1;126;0
WireConnection;120;0;175;0
WireConnection;120;9;125;0
WireConnection;130;0;175;0
WireConnection;130;9;128;0
WireConnection;169;0;46;0
WireConnection;169;2;171;0
WireConnection;112;0;130;1
WireConnection;112;1;120;1
WireConnection;52;0;49;3
WireConnection;52;1;50;0
WireConnection;51;0;48;0
WireConnection;22;0;169;0
WireConnection;22;2;15;0
WireConnection;173;1;112;0
WireConnection;53;0;52;0
WireConnection;53;1;51;0
WireConnection;55;0;52;0
WireConnection;55;1;51;0
WireConnection;56;0;49;0
WireConnection;56;1;50;0
WireConnection;54;0;52;0
WireConnection;54;1;51;0
WireConnection;35;0;33;0
WireConnection;21;0;22;0
WireConnection;174;0;173;0
WireConnection;57;0;53;0
WireConnection;59;0;55;0
WireConnection;61;0;56;0
WireConnection;61;1;51;0
WireConnection;62;0;56;0
WireConnection;62;1;51;0
WireConnection;58;0;54;0
WireConnection;60;0;56;0
WireConnection;60;1;51;0
WireConnection;12;0;21;1
WireConnection;108;0;174;0
WireConnection;37;0;35;0
WireConnection;63;0;61;0
WireConnection;63;2;57;0
WireConnection;64;0;60;0
WireConnection;64;2;58;0
WireConnection;65;0;62;0
WireConnection;65;2;59;0
WireConnection;24;0;12;0
WireConnection;155;0;108;0
WireConnection;34;0;37;0
WireConnection;69;0;63;0
WireConnection;69;1;66;0
WireConnection;70;0;64;0
WireConnection;70;1;67;0
WireConnection;71;0;65;0
WireConnection;71;1;68;0
WireConnection;36;0;24;0
WireConnection;36;1;34;0
WireConnection;36;2;158;0
WireConnection;113;0;155;0
WireConnection;73;0;72;0
WireConnection;73;9;69;0
WireConnection;74;0;72;0
WireConnection;74;9;70;0
WireConnection;75;0;72;0
WireConnection;75;9;71;0
WireConnection;159;0;36;0
WireConnection;159;1;113;0
WireConnection;79;0;76;5
WireConnection;79;1;73;1
WireConnection;80;0;78;5
WireConnection;80;1;75;1
WireConnection;81;0;77;5
WireConnection;81;1;74;1
WireConnection;8;0;6;0
WireConnection;31;0;30;0
WireConnection;161;0;159;0
WireConnection;156;0;34;0
WireConnection;160;0;113;0
WireConnection;82;0;79;0
WireConnection;82;1;81;0
WireConnection;82;2;80;0
WireConnection;23;0;156;0
WireConnection;23;1;8;0
WireConnection;23;2;31;0
WireConnection;23;3;161;0
WireConnection;23;4;160;0
WireConnection;23;5;179;0
WireConnection;47;0;82;0
WireConnection;118;0;23;0
WireConnection;94;0;47;0
WireConnection;94;1;95;0
WireConnection;101;0;72;0
WireConnection;99;0;118;0
WireConnection;99;1;94;0
WireConnection;39;0;24;0
WireConnection;0;2;99;0
WireConnection;0;9;182;0
ASEEND*/
//CHKSM=F776F2790395277DFCBAD2BB280D2029ED5F1A37