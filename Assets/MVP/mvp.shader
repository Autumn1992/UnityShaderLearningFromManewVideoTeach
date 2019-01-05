// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "learn/mvp"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_CordW ("CordW", float) = 1
	}
	SubShader
	{
		Tags { "RenderType"="Transparent" }

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			#include "UnityCG.cginc"

			struct v2f
			{
				float4 pos : POSITION;
				fixed4 color:COLOR;
			};

			sampler2D _MainTex;
			float _cordW;
			
			v2f vert (appdata_base v)
			{
				v2f o;
				//UnityObjectToClipPos(v.vertex);
				//o.vertex = mul(UNITY_MATRIX_MVP, v.vertex);
				o.pos = UnityObjectToClipPos(v.vertex);
				//o.pos = UnityObjectToClipPos(v.vertex);

				float x = o.pos.y / o.pos.w;

				o.color = fixed4(x, 0, 0, 1);
				//if(x<=-1)
				//	o.color = fixed4(1,0,0,1);
				//else if(x>=0.5)
				//	o.color = fixed4(0,0,0,1);
				//else
				//	o.color = fixed4(o.pos.w,o.pos.w,o.pos.w,o.pos.w);
					
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{	
				return i.color;
				//if(vertex.x > 300){
				//	return fixed4(0, 1, 1, 1);
				//}else{
				//	return fixed4(0, 0, 1, 1);
				//}
			}
			ENDCG
		}
	}
}
