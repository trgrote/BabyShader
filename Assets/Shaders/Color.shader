// Shader Name
// Will be found Under Custom->FlipX
Shader "Custom/Color"
{
	// Properties that can be set by the material and modified by external
	// scripts
	Properties
	{
		// _Color ("Color Tint", Color) = (1,1,1,1)
	}
	SubShader
	{
		// Area to specify Tags and other shader configurations
		// No culling or depth
		//Cull Off
		//ZWrite Off
		//ZTest Always

		// A subshader can have multiple passes
		Pass
		{
			// Actual Shader 'Code'
			CGPROGRAM

			// Specify that this Shader's vertex function is called 'vert'
			#pragma vertex vert
			// Specify that this Shader's fragment function is called 'frag'
			#pragma fragment frag

			// Vertex Shader Argument
			struct appdata
			{
				float4 vertex   : POSITION;
				float2 texcoord : TEXCOORD0;
			};

			// Vertex Shader Output and Fragment shader input argument
			struct v2f
			{
				float4 vertex   : SV_POSITION;
				half2 texcoord  : TEXCOORD0;    // 0,0 => 1,1, bottom left is 0,0
			};

			// Vertex Shader
			// Simply transform the position to Model View space
			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = mul(UNITY_MATRIX_MVP, v.vertex);
				o.texcoord = v.texcoord;
				return o;
			}

			// The Color Parameter
			// fixed4 _Color;

			// Fragment shader
			// Returns the color of the pixel at the given position
			fixed4 frag (v2f i) : SV_Target
			{
				// Just return the color specified
				// return _Color;
				return fixed4(0,0,1,1);
			}

			ENDCG

		}
	}
}
