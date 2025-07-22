// Made with Amplify Shader Editor v1.9.5.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Particles"
{
	Properties
	{
		_HueShift("Hue Shift", Range( 0 , 1)) = 0
		[Toggle]_HueShiftOverTime("Hue Shift Over Time", Range( 0 , 1)) = 0
		_HueShiftTimeScale("Hue Shift Time Scale", Float) = 1
		[ToggleUI]_UseCustomData("Use Custom Data", Float) = 0
		[ToggleUI]_UseVertexAlpha("Use Vertex Alpha", Float) = 0
		_TextureSample0("_TextureSample 0", 2D) = "white" {}
		[HDR]_Color("Color", Color) = (0,0,0,0)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  }
		Cull Off
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Unlit alpha:premul keepalpha noshadow nofog 
		#undef TRANSFORM_TEX
		#define TRANSFORM_TEX(tex,name) float4(tex.xy * name##_ST.xy + name##_ST.zw, tex.z, tex.w)
		struct Input
		{
			float4 vertexColor : COLOR;
			float4 uv_texcoord;
		};

		uniform sampler2D _TextureSample0;
		uniform float4 _TextureSample0_ST;
		uniform float4 _Color;
		uniform float _UseCustomData;
		uniform float _UseVertexAlpha;
		uniform float _HueShiftOverTime;
		uniform float _HueShift;
		uniform float _HueShiftTimeScale;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float2 uvs_TexCoord8 = i.uv_texcoord;
			uvs_TexCoord8.xy = i.uv_texcoord.xy * _TextureSample0_ST.xy + _TextureSample0_ST.zw;
			float4 tex2DNode1 = tex2D( _TextureSample0, uvs_TexCoord8.xy );
			float3 break2_g1 = ( i.vertexColor * tex2DNode1.r * float4( ( _Color.rgb * (( _UseCustomData )?( i.uv_texcoord.z ):( 1.0 )) * (( _UseVertexAlpha )?( i.vertexColor.a ):( 1.0 )) ) , 0.0 ) ).rgb;
			float XCol24_g1 = max( break2_g1.x , 1E-06 );
			float YCol25_g1 = max( break2_g1.y , 1E-06 );
			float ZCol26_g1 = max( break2_g1.z , 1E-06 );
			float L44_g1 = pow( ( ( XCol24_g1 * 0.4122215 ) + ( YCol25_g1 * 0.5363325 ) + ( ZCol26_g1 * 0.05144599 ) ) , 0.3333333 );
			float M45_g1 = pow( ( ( XCol24_g1 * 0.2119035 ) + ( YCol25_g1 * 0.6806995 ) + ( ZCol26_g1 * 0.107397 ) ) , 0.3333333 );
			float S46_g1 = pow( ( ( XCol24_g1 * 0.08830246 ) + ( YCol25_g1 * 0.2817189 ) + ( ZCol26_g1 * 0.6299787 ) ) , 0.3333333 );
			float X71_g1 = ( ( ( L44_g1 * 0.2104543 ) + ( M45_g1 * 0.7936178 ) ) - ( S46_g1 * 0.004072047 ) );
			float temp_output_192_0_g1 = _HueShift;
			float mulTime190_g1 = _Time.y * _HueShiftTimeScale;
			float ifLocalVar194_g1 = 0;
			if( _HueShiftOverTime == 1.0 )
				ifLocalVar194_g1 = ( temp_output_192_0_g1 + mulTime190_g1 );
			else
				ifLocalVar194_g1 = temp_output_192_0_g1;
			float Z73_g1 = ( ( ( L44_g1 * 0.02590404 ) + ( M45_g1 * 0.7827718 ) ) - ( S46_g1 * 0.8086758 ) );
			float Y72_g1 = ( ( ( L44_g1 * 1.977998 ) - ( M45_g1 * 2.428592 ) ) + ( S46_g1 * 0.4505937 ) );
			float temp_output_177_0_g1 = ( ( ifLocalVar194_g1 * 6.283185 ) + atan2( Z73_g1 , Y72_g1 ) );
			float2 appendResult175_g1 = (float2(Y72_g1 , Z73_g1));
			float temp_output_176_0_g1 = length( appendResult175_g1 );
			float ZMod185_g1 = ( sin( temp_output_177_0_g1 ) * temp_output_176_0_g1 );
			float YMod184_g1 = ( cos( temp_output_177_0_g1 ) * temp_output_176_0_g1 );
			float temp_output_142_0_g1 = ( ( X71_g1 + ( ZMod185_g1 * 0.2158038 ) ) + ( YMod184_g1 * 0.3963378 ) );
			float L2146_g1 = ( temp_output_142_0_g1 * temp_output_142_0_g1 * temp_output_142_0_g1 );
			float temp_output_140_0_g1 = ( ( X71_g1 - ( ZMod185_g1 * 0.06385417 ) ) - ( YMod184_g1 * 0.1055613 ) );
			float M2147_g1 = ( temp_output_140_0_g1 * temp_output_140_0_g1 * temp_output_140_0_g1 );
			float temp_output_141_0_g1 = ( ( X71_g1 - ( ZMod185_g1 * 1.291486 ) ) - ( YMod184_g1 * 0.08948418 ) );
			float S2148_g1 = ( temp_output_141_0_g1 * temp_output_141_0_g1 * temp_output_141_0_g1 );
			float3 appendResult155_g1 = (float3(( ( ( L2146_g1 * 4.076742 ) - ( M2147_g1 * 3.307712 ) ) + ( S2148_g1 * 0.2309699 ) ) , ( ( ( L2146_g1 * -1.268438 ) + ( M2147_g1 * 2.609757 ) ) - ( S2148_g1 * 0.3413194 ) ) , ( ( ( L2146_g1 * -0.004196086 ) - ( M2147_g1 * 0.7034186 ) ) + ( S2148_g1 * 1.707615 ) )));
			o.Emission = appendResult155_g1;
			o.Alpha = ( (( _UseCustomData )?( i.uv_texcoord.z ):( 1.0 )) * saturate( tex2DNode1.r ) * (( _UseVertexAlpha )?( i.vertexColor.a ):( 1.0 )) );
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=19501
Node;AmplifyShaderEditor.TexturePropertyNode;6;-1280,112;Inherit;True;Property;_TextureSample0;_TextureSample 0;6;0;Create;False;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TextureTransformNode;7;-1008,176;Inherit;False;-1;False;1;0;SAMPLER2D;;False;2;FLOAT2;0;FLOAT2;1
Node;AmplifyShaderEditor.TexCoordVertexDataNode;11;-432,400;Inherit;False;0;4;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VertexColorNode;2;-432,-48;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;8;-752,240;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;4;-432,-256;Inherit;False;Property;_Color;Color;7;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ToggleSwitchNode;13;-144,320;Inherit;False;Property;_UseCustomData;Use Custom Data;4;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;14;-160,432;Inherit;False;Property;_UseVertexAlpha;Use Vertex Alpha;5;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1;-512,128;Inherit;True;Property;_TextureSample1;Texture Sample 0;0;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;12;-145,-197.5;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;10;-112,192;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3;-176,-64;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;9;112,160;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;5;-16,-64;Inherit;False;OKLAB Hue Shifting;0;;1;894df294c231c5646b239e098380b977;0;3;1;FLOAT3;0,0,0;False;192;FLOAT;0;False;198;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;336,-16;Float;False;True;-1;2;ASEMaterialInspector;0;0;Unlit;Particles;False;False;False;False;False;False;False;False;False;True;False;False;False;False;True;False;False;False;False;False;False;Off;0;False;;0;False;;False;0;False;;0;False;;False;0;Premultiply;0.5;True;False;0;False;Transparent;;Transparent;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;False;3;1;False;;10;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;16;FLOAT4;0,0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;7;0;6;0
WireConnection;8;0;7;0
WireConnection;8;1;7;1
WireConnection;13;1;11;3
WireConnection;14;1;2;4
WireConnection;1;0;6;0
WireConnection;1;1;8;0
WireConnection;12;0;4;5
WireConnection;12;1;13;0
WireConnection;12;2;14;0
WireConnection;10;0;1;1
WireConnection;3;0;2;0
WireConnection;3;1;1;1
WireConnection;3;2;12;0
WireConnection;9;0;13;0
WireConnection;9;1;10;0
WireConnection;9;2;14;0
WireConnection;5;1;3;0
WireConnection;0;2;5;0
WireConnection;0;9;9;0
ASEEND*/
//CHKSM=DA35BA7FD170576ED45372612E089B91B4BCF9B0