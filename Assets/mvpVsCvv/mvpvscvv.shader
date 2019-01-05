// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Unlit/mvpvscvv"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
	}
	SubShader
	{
		Tags { "RenderType"="Opaque" }

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
				float4 color: TEXCOORD1;
			};

			v2f vert (appdata v)
			{
				v2f o;

				float4 worleVertex = UnityObjectToClipPos(v.vertex);
				o.vertex = UnityObjectToClipPos(v.vertex);
				
				float w = o.vertex.w;
				o.color = float4(o.vertex.x / w, o.vertex.y / w, o.vertex.z / w, 1);

				return o;
			}
			
			fixed4 frag (v2f o) : SV_Target
			{	

					return o.color;
					if (o.vertex.x > 640){
							return float4(0, 0, 0, 1);
					}
					else
					{
							return float4(1, 1, 1, 1);
					}
			}
			ENDCG
		}
	}
}
