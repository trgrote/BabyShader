// Shader Name
// Will be found Under Custom->FlipX
Shader "Custom/FlipX"
{
	// Properties that can be set by the material and modified by external
	// scripts
	Properties
	{
		// Specify the argument that is visisble within the Unity Material inspector
		// This makes it a texture object and it defaults to to a blank white texture
		_MainTex ("Texture", 2D) = "white" {}
	}
	SubShader
	{
		// Area to specify Tags and other shader configurations
		// No culling or depth
		/*Cull Off*/
		/*ZWrite Off*/
		/*ZTest Always*/

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

			// The Texture Parameter
			sampler2D _MainTex;

			// Fragment shader
			// Returns the color of the pixel at the given position
			fixed4 frag (v2f i) : SV_Target
			{
				// Mirror position if left of 0.5
			    // if (i.texcoord.x < 0.5)
			    //	i.texcoord.x = 1 - i.texcoord.x;

				fixed4 color = tex2D(_MainTex, i.texcoord);  // get the color of the texture at that position
				return color;
			}

			ENDCG

		}
	}
}
