Shader "Sbin/v2f.shader"
{
	SubShader
	{
		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			// make fog work
			#pragma multi_compile_fog
			
			#include "UnityCG.cginc"


			struct C3E4_Output {

			  float4 position : POSITION;

			  float4 color    : COLOR;

			};


			C3E4_Output vert(in float2 position :POSITION, in float4 col:COLOR)
			{
				
				C3E4_Output OUT;

				float angle = 0 * length(position);

				float cosLength, sinLength;

				sincos(angle, sinLength, cosLength);

				OUT.position[0] = cosLength * position[0] +

				               -sinLength * position[1];

				OUT.position[1] = sinLength * position[0] +

				                cosLength * position[1];

				OUT.position[2] = 1;

				OUT.position[3] = 1;

				OUT.color = col;

				return OUT;
			}

			fixed4 frag(in float4 col:COLOR):COLOR
			{
				//col.x = sin(_Time.y);
				//col.y = sin(_Time.y);

				return col;
			}

			ENDCG
		}
	}
}
