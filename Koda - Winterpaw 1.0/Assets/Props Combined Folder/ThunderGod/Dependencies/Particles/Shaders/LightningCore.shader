// Made with Amplify Shader Editor v1.9.5.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "LightningCore"
{
	Properties
	{
		[HDR]_Color("Color", Color) = (0,0,0,0)
		_HueShift("Hue Shift", Range( 0 , 1)) = 0
		[Toggle]_HueShiftOverTime("Hue Shift Over Time", Range( 0 , 1)) = 0
		_HueShiftTimeScale("Hue Shift Time Scale", Float) = 1
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#include "UnityCG.cginc"
		#pragma target 4.6
		#pragma surface surf Unlit keepalpha noshadow nofog vertex:vertexDataFunc 
		struct Input
		{
			float3 worldPos;
			float3 worldNormal;
			INTERNAL_DATA
		};

		uniform float4 _Color;
		uniform float _HueShiftOverTime;
		uniform float _HueShift;
		uniform float _HueShiftTimeScale;


float2 voronoihash38( float2 p )
{
	
	p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
	return frac( sin( p ) *43758.5453);
}


float voronoi38( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
{
	float2 n = floor( v );
	float2 f = frac( v );
	float F1 = 8.0;
	float F2 = 8.0; float2 mg = 0;
	for ( int j = -1; j <= 1; j++ )
	{
		for ( int i = -1; i <= 1; i++ )
	 	{
	 		float2 g = float2( i, j );
	 		float2 o = voronoihash38( n + g );
			o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
			float d = 0.5 * dot( r, r );
	 //		if( d<F1 ) {
	 //			F2 = F1;
	 			float h = smoothstep(0.0, 1.0, 0.5 + 0.5 * (F1 - d) / smoothness); F1 = lerp(F1, d, h) - smoothness * h * (1.0 - h);mg = g; mr = r; id = o;
	 //		} else if( d<F2 ) {
	 //			F2 = d;
	
	 //		}
	 	}
	}
	return F1;
}


float2 voronoihash43( float2 p )
{
	
	p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
	return frac( sin( p ) *43758.5453);
}


float voronoi43( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
{
	float2 n = floor( v );
	float2 f = frac( v );
	float F1 = 8.0;
	float F2 = 8.0; float2 mg = 0;
	for ( int j = -1; j <= 1; j++ )
	{
		for ( int i = -1; i <= 1; i++ )
	 	{
	 		float2 g = float2( i, j );
	 		float2 o = voronoihash43( n + g );
			o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
			float d = 0.5 * dot( r, r );
	 //		if( d<F1 ) {
	 //			F2 = F1;
	 			float h = smoothstep(0.0, 1.0, 0.5 + 0.5 * (F1 - d) / smoothness); F1 = lerp(F1, d, h) - smoothness * h * (1.0 - h);mg = g; mr = r; id = o;
	 //		} else if( d<F2 ) {
	 //			F2 = d;
	
	 //		}
	 	}
	}
	return F1;
}


float2 voronoihash8( float2 p )
{
	
	p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
	return frac( sin( p ) *43758.5453);
}


float voronoi8( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
{
	float2 n = floor( v );
	float2 f = frac( v );
	float F1 = 8.0;
	float F2 = 8.0; float2 mg = 0;
	for ( int j = -1; j <= 1; j++ )
	{
		for ( int i = -1; i <= 1; i++ )
	 	{
	 		float2 g = float2( i, j );
	 		float2 o = voronoihash8( n + g );
			o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
			float d = 0.5 * dot( r, r );
	 //		if( d<F1 ) {
	 //			F2 = F1;
	 			float h = smoothstep(0.0, 1.0, 0.5 + 0.5 * (F1 - d) / smoothness); F1 = lerp(F1, d, h) - smoothness * h * (1.0 - h);mg = g; mr = r; id = o;
	 //		} else if( d<F2 ) {
	 //			F2 = d;
	
	 //		}
	 	}
	}
	return F1;
}


		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float4 ase_vertexTangent = v.tangent;
			float mulTime39 = _Time.y * 15.0;
			float time38 = mulTime39;
			float2 voronoiSmoothId38 = 0;
			float voronoiSmooth38 = 0.0;
			float3 ase_vertex3Pos = v.vertex.xyz;
			float2 appendResult49 = (float2(ase_vertex3Pos.x , ase_vertex3Pos.z));
			float2 coords38 = appendResult49 * 5.0;
			float2 id38 = 0;
			float2 uv38 = 0;
			float voroi38 = voronoi38( coords38, time38, id38, uv38, voronoiSmooth38, voronoiSmoothId38 );
			float mulTime41 = _Time.y * 15.0;
			float time43 = mulTime41;
			float2 voronoiSmoothId43 = 0;
			float voronoiSmooth43 = 0.0;
			float2 appendResult44 = (float2(ase_vertex3Pos.z , ase_vertex3Pos.y));
			float2 coords43 = appendResult44 * 5.0;
			float2 id43 = 0;
			float2 uv43 = 0;
			float voroi43 = voronoi43( coords43, time43, id43, uv43, voronoiSmooth43, voronoiSmoothId43 );
			float temp_output_3_0_g8 = ( voroi43 - voroi38 );
			v.vertex.xyz += ( ase_vertexTangent.xyz * ( saturate( ( ( ( voroi38 + voroi43 ) * 0.5 ) + saturate( ( temp_output_3_0_g8 / 0 ) ) ) ) * 0.1 ) );
			v.vertex.w = 1;
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
			float fresnelNdotV1 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode1 = ( 0.0 + 1.0 * pow( 1.0 - fresnelNdotV1, 1.0 ) );
			float mulTime10 = _Time.y * 5.0;
			float time8 = mulTime10;
			float2 voronoiSmoothId8 = 0;
			float voronoiSmooth8 = 0.5;
			float3 ase_vertex3Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float4 unityObjectToClipPos3_g3 = UnityObjectToClipPos( ase_vertex3Pos );
			float4 computeScreenPos5_g3 = ComputeScreenPos( unityObjectToClipPos3_g3 );
			float temp_output_20_0_g3 = 1.0;
			float4 unityObjectToClipPos4_g3 = UnityObjectToClipPos( float3(0,0,0) );
			float4 computeScreenPos6_g3 = ComputeScreenPos( unityObjectToClipPos4_g3 );
			float4 transform10_g3 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
			float2 coords8 = (( ( ( ( computeScreenPos5_g3 / (computeScreenPos5_g3).w ) * temp_output_20_0_g3 ) - ( temp_output_20_0_g3 * ( computeScreenPos6_g3 / (computeScreenPos6_g3).w ) ) ) * length( ( float4( _WorldSpaceCameraPos , 0.0 ) - transform10_g3 ) ) )).xy * 5.0;
			float2 id8 = 0;
			float2 uv8 = 0;
			float voroi8 = voronoi8( coords8, time8, id8, uv8, voronoiSmooth8, voronoiSmoothId8 );
			float3 break2_g7 = ( _Color.rgb * saturate( pow( ( ( 1.0 - fresnelNode1 ) + ( voroi8 * 0.25 ) ) , 5.0 ) ) );
			float XCol24_g7 = max( break2_g7.x , 1E-06 );
			float YCol25_g7 = max( break2_g7.y , 1E-06 );
			float ZCol26_g7 = max( break2_g7.z , 1E-06 );
			float L44_g7 = pow( ( ( XCol24_g7 * 0.4122215 ) + ( YCol25_g7 * 0.5363325 ) + ( ZCol26_g7 * 0.05144599 ) ) , 0.3333333 );
			float M45_g7 = pow( ( ( XCol24_g7 * 0.2119035 ) + ( YCol25_g7 * 0.6806995 ) + ( ZCol26_g7 * 0.107397 ) ) , 0.3333333 );
			float S46_g7 = pow( ( ( XCol24_g7 * 0.08830246 ) + ( YCol25_g7 * 0.2817189 ) + ( ZCol26_g7 * 0.6299787 ) ) , 0.3333333 );
			float X71_g7 = ( ( ( L44_g7 * 0.2104543 ) + ( M45_g7 * 0.7936178 ) ) - ( S46_g7 * 0.004072047 ) );
			float temp_output_192_0_g7 = _HueShift;
			float mulTime190_g7 = _Time.y * _HueShiftTimeScale;
			float ifLocalVar194_g7 = 0;
			if( _HueShiftOverTime == 1.0 )
				ifLocalVar194_g7 = ( temp_output_192_0_g7 + mulTime190_g7 );
			else
				ifLocalVar194_g7 = temp_output_192_0_g7;
			float Z73_g7 = ( ( ( L44_g7 * 0.02590404 ) + ( M45_g7 * 0.7827718 ) ) - ( S46_g7 * 0.8086758 ) );
			float Y72_g7 = ( ( ( L44_g7 * 1.977998 ) - ( M45_g7 * 2.428592 ) ) + ( S46_g7 * 0.4505937 ) );
			float temp_output_177_0_g7 = ( ( ifLocalVar194_g7 * 6.283185 ) + atan2( Z73_g7 , Y72_g7 ) );
			float2 appendResult175_g7 = (float2(Y72_g7 , Z73_g7));
			float temp_output_176_0_g7 = length( appendResult175_g7 );
			float ZMod185_g7 = ( sin( temp_output_177_0_g7 ) * temp_output_176_0_g7 );
			float YMod184_g7 = ( cos( temp_output_177_0_g7 ) * temp_output_176_0_g7 );
			float temp_output_142_0_g7 = ( ( X71_g7 + ( ZMod185_g7 * 0.2158038 ) ) + ( YMod184_g7 * 0.3963378 ) );
			float L2146_g7 = ( temp_output_142_0_g7 * temp_output_142_0_g7 * temp_output_142_0_g7 );
			float temp_output_140_0_g7 = ( ( X71_g7 - ( ZMod185_g7 * 0.06385417 ) ) - ( YMod184_g7 * 0.1055613 ) );
			float M2147_g7 = ( temp_output_140_0_g7 * temp_output_140_0_g7 * temp_output_140_0_g7 );
			float temp_output_141_0_g7 = ( ( X71_g7 - ( ZMod185_g7 * 1.291486 ) ) - ( YMod184_g7 * 0.08948418 ) );
			float S2148_g7 = ( temp_output_141_0_g7 * temp_output_141_0_g7 * temp_output_141_0_g7 );
			float3 appendResult155_g7 = (float3(( ( ( L2146_g7 * 4.076742 ) - ( M2147_g7 * 3.307712 ) ) + ( S2148_g7 * 0.2309699 ) ) , ( ( ( L2146_g7 * -1.268438 ) + ( M2147_g7 * 2.609757 ) ) - ( S2148_g7 * 0.3413194 ) ) , ( ( ( L2146_g7 * -0.004196086 ) - ( M2147_g7 * 0.7034186 ) ) + ( S2148_g7 * 1.707615 ) )));
			o.Emission = appendResult155_g7;
			o.Alpha = 1;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=19501
Node;AmplifyShaderEditor.PosVertexDataNode;42;-608,704;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PosVertexDataNode;40;-528,464;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;28;-896,416;Inherit;False;Constant;_Float0;Float 0;1;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;10;-928,288;Inherit;False;1;0;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;27;-1008,192;Inherit;False;ScreenSpaceUVLockedToObject;-1;;3;bcc05ebb4d97a5844a7b143c5d825e6e;0;1;20;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;44;-384,752;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;49;-336,496;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;41;-432,880;Inherit;False;1;0;FLOAT;15;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;39;-400,608;Inherit;False;1;0;FLOAT;15;False;1;FLOAT;0
Node;AmplifyShaderEditor.FresnelNode;1;-736,0;Inherit;False;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.VoronoiNode;8;-688,192;Inherit;True;0;0;1;0;1;False;1;False;True;False;4;0;FLOAT2;0,0;False;1;FLOAT;7.24;False;2;FLOAT;5;False;3;FLOAT;0;False;3;FLOAT;0;FLOAT2;1;FLOAT2;2
Node;AmplifyShaderEditor.VoronoiNode;43;-208,800;Inherit;True;0;0;1;0;1;False;1;False;True;False;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;5;False;3;FLOAT;0;False;3;FLOAT;0;FLOAT2;1;FLOAT2;2
Node;AmplifyShaderEditor.VoronoiNode;38;-192,512;Inherit;True;0;0;1;0;1;False;1;False;True;False;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;5;False;3;FLOAT;0;False;3;FLOAT;0;FLOAT2;1;FLOAT2;2
Node;AmplifyShaderEditor.OneMinusNode;3;-512,0;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;31;-256,192;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.25;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;45;176,528;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;51;176,832;Inherit;True;Step Antialiasing;-1;;8;2a825e80dfb3290468194f83380797bd;0;2;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;29;-96,48;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;53;288,576;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;4;48,16;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;52;464,672;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;5;416,-160;Inherit;False;Property;_Color;Color;0;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SaturateNode;2;224,16;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;46;480,528;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6;656,-16;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TangentVertexDataNode;32;560,208;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;34;640,512;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;48;816,-16;Inherit;False;OKLAB Hue Shifting;1;;7;894df294c231c5646b239e098380b977;0;3;1;FLOAT3;0,0,0;False;192;FLOAT;0;False;198;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;33;800,336;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1216,-64;Float;False;True;-1;6;ASEMaterialInspector;0;0;Unlit;LightningCore;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;;0;False;;False;0;False;;0;False;;False;0;Opaque;0.5;True;False;0;False;Opaque;;Geometry;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;0;15;10;25;False;0.5;False;0;0;False;;0;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;0;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;16;FLOAT4;0,0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;44;0;42;3
WireConnection;44;1;42;2
WireConnection;49;0;40;1
WireConnection;49;1;40;3
WireConnection;8;0;27;0
WireConnection;8;1;10;0
WireConnection;8;3;28;0
WireConnection;43;0;44;0
WireConnection;43;1;41;0
WireConnection;38;0;49;0
WireConnection;38;1;39;0
WireConnection;3;0;1;0
WireConnection;31;0;8;0
WireConnection;45;0;38;0
WireConnection;45;1;43;0
WireConnection;51;1;38;0
WireConnection;51;2;43;0
WireConnection;29;0;3;0
WireConnection;29;1;31;0
WireConnection;53;0;45;0
WireConnection;4;0;29;0
WireConnection;52;0;53;0
WireConnection;52;1;51;0
WireConnection;2;0;4;0
WireConnection;46;0;52;0
WireConnection;6;0;5;5
WireConnection;6;1;2;0
WireConnection;34;0;46;0
WireConnection;48;1;6;0
WireConnection;33;0;32;0
WireConnection;33;1;34;0
WireConnection;0;2;48;0
WireConnection;0;11;33;0
ASEEND*/
//CHKSM=CE38CD4F514BE23F82BBF1B05493B9677A89C73B