using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

[ExecuteInEditMode]
public class AVWHelper : MonoBehaviour
{
    public string text = "Blendshape Fix!";
    public float height = 0.2f;
    public Color textColor = Color.white;
    public Color backgroundColor = new Color(0f, 0f, 0f, 0.6f); // semi-transparent black
    public int fontSize = 16;
    public Vector2 padding = new Vector2(6f, 4f);

    private void OnDrawGizmos()
    {
#if UNITY_EDITOR
        if (string.IsNullOrEmpty(text)) return;
        if (SceneView.lastActiveSceneView == null) return;

        Camera cam = SceneView.lastActiveSceneView.camera;
        if (cam == null) return;

        Vector3 worldPos = transform.position + Vector3.up * height;
        Vector3 screenPos = cam.WorldToScreenPoint(worldPos);

        if (screenPos.z < 0) return; // Behind the camera

        // Flip Y because GUI space is inverted
        screenPos.y = SceneView.currentDrawingSceneView.position.height - screenPos.y;

        Handles.BeginGUI();

        // Create style
        GUIStyle style = new GUIStyle(EditorStyles.boldLabel);
        style.fontSize = fontSize;
        style.normal.textColor = textColor;

        // Measure content size
        Vector2 contentSize = style.CalcSize(new GUIContent(text));
        contentSize += padding * 2;

        Rect rect = new Rect(
            screenPos.x - contentSize.x / 2,
            screenPos.y - contentSize.y / 2,
            contentSize.x,
            contentSize.y
        );

        // Draw background box
        Color oldColor = GUI.color;
        GUI.color = backgroundColor;
        GUI.Box(rect, GUIContent.none);
        GUI.color = oldColor;

        // Draw the label
        GUI.Label(rect, text, style);

        Handles.EndGUI();
#endif
    }
}



