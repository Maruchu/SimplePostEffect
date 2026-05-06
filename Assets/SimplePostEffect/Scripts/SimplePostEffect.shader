// シンプルなポストエフェクト
// (C) ㊥Maruchu 2026
Shader "Maruchu/SimplePostEffect"
{
	Properties
	{
		_MainTex("", 2D) = "" {}
	}

	SubShader
	{
		Pass
		{
			ZTest Always
			Cull Off
			ZWrite Off

			CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0

			#include "UnityCG.cginc"

			struct appdata {
				float4 vertex   : POSITION;
				float2 uv       : TEXCOORD0;
			};
			struct v2f {
				float4 position : SV_POSITION;
				float2 uv       : TEXCOORD0;
			};

			sampler2D _MainTex;

			v2f vert (appdata IN) {
				v2f OUT;
				OUT.position = UnityObjectToClipPos(IN.vertex);
				OUT.uv = IN.uv;
				return OUT;
			}

			half4 frag (v2f_img IN) : SV_Target
			{
				float4 col = tex2D(_MainTex, IN.uv);
				col.b = 1;
				return col;
			}

			ENDCG
		}
	}
}
