Shader "Custom/Sepia"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_Percent ( "Percent", Float ) = 0
	}
	SubShader
	{
		// Area to specify Tags and other shader configurations
		// No culling or depth
		//Cull Off
		//ZWrite Off
		//ZTest Always

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"

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
				o.vertex = mul(UNITY_MATRIX_MVP, v.vertex);
				o.uv = v.uv;
				return o;
			}
			
			sampler2D _MainTex;
			float _Percent;

			fixed4 frag (v2f i) : SV_Target
			{
				fixed4 color = tex2D(_MainTex, i.uv);

				fixed3 sepia;

				// Get Sepia tone
				sepia.r = dot(color.rgb, half3(0.393, 0.769, 0.189));
	            sepia.g = dot(color.rgb, half3(0.349, 0.686, 0.168));   
	            sepia.b = dot(color.rgb, half3(0.272, 0.534, 0.131));

	            if (i.uv.x < _Percent)
	            	color.rgb = sepia.rgb;

				return color;
			}
			ENDCG
		}
	}
}
