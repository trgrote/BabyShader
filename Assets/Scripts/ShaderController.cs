using UnityEngine;
using UnityEngine.UI;
using System.Collections;

[RequireComponent(typeof(SpriteRenderer))]
public class ShaderController : MonoBehaviour 
{
	SpriteRenderer renderer;
	Material _material;

	[Range( 0, 1.0f )] public float percent = 0.5f;

	void Start()
	{
		renderer = GetComponent<SpriteRenderer>();

		if ( ! renderer )
		{
			Debug.LogWarning("Failed to Find Renderer");
			return;
		}
	}

	// In 3 second cycles, move sepia filter from left to right
	const float timeToCycle = 3f;

	void Update()
	{
		// Set the Percent of the shader
		renderer.material.SetFloat(
			"_Percent",
			Time.realtimeSinceStartup % timeToCycle / timeToCycle
		);
	}
}
