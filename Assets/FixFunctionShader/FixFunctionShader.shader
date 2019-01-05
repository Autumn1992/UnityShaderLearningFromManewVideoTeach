Shader "FixFunction/FixFunctionShader"
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
	}
	
	SubShader {

		pass {

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
		}

	}

}
