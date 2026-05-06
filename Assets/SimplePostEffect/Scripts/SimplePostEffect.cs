using UnityEngine;


namespace Maruchu
{
	/// <summary>
	/// ポストエフェクトアタッチ用スクリプト
	/// (C) ㊥Maruchu 2026
	/// </summary>
	[ExecuteInEditMode]
	[RequireComponent(typeof(Camera))]
	[ImageEffectAllowedInSceneView]
	public class SimplePostEffect : MonoBehaviour
	{
		/// <summary>
		/// ポストエフェクトのシェーダーを割り当てたMaterial
		/// </summary>
		public Material _postEffectMaterial;

		/// <summary>
		/// ポストエフェクトの実行用
		/// </summary>
		/// <param name=srcTex>入力：カメラの映像</param>
		/// <param name=dstTex>出力：書き込み先</param>
		void OnRenderImage(RenderTexture srcTex, RenderTexture dstTex)
		{
			if(null==_postEffectMaterial) {
				return;
			}
			Graphics.Blit(srcTex, dstTex, _postEffectMaterial, 0);
		}
	}
}
