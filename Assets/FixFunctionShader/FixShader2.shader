Shader "FixFunction/FixShader2"
{
	Properties
	{	
		// 漫反射光
		_Color("Main Color", color) = (1, 1, 1, 1)
		// 环境光
		_Ambient("Ambient", color) = (0.3, 0.3, 0.3, 0.3)
		// 镜面高光
		_Specular("Specular", color) = (1, 1, 1, 1)
		// 镜面高光系数
		_Shininess("Shininess", range(0, 8)) = 4
		// 自发光颜色
		_Emission("Emission", color) = (1, 1, 1, 1)

		_Constant("ConstantColor", color) = (1, 1, 1, 0.3)

		_MainTex("MainTex", 2d) = ""
		_SecondTex("SecondTex", 2d) = "" 

	}
	
	SubShader {
		// 以半透明的queue渲染
		tags { "Queue" = "Transparent" }

		pass {

			// 为什么用 SrcAlpha ConstantColor调成透明后 会变全黑
			Blend SrcAlpha OneMinusSrcAlpha

			material {
				diffuse[_Color]
				ambient[_Ambient]
				specular[_Specular]
				// 镜面高光强度
				shininess[_Shininess]
				emission[_Emission]
			}

			lighting on
			// 开启镜面高光独立显示
			separatespecular on

			// primary 顶点广告后的颜色 即material计算后的颜色
			settexture[_MainTex]
			{	
				// 合并 _MainTex  * primary乘以之前材质和光照设置的颜色
				constantColor[_Constant]
				combine texture * primary double, texture
				combine texture * primary double, texture*constant
			}
			//settexture[_SecondTex]
			//{	
				// 合并 _MainTex  * primary乘以之前材质和光照设置的颜色
				// , texture 表示渲染的alpha取texture的alpha
				// 设置constantColor值
				//constantColor[_Constant]
				//combine texture * previous double, texture
				//combine texture * previous double, 
			//}
		}

	}

}
