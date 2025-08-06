using UnityEngine;
using UnityEditor;
using Pointless;
using System.Collections.Generic;

[CustomEditor(typeof(PointlessCreations))]
public class GumroadLinkEditor : Editor
{
    private GUIStyle customStyle;
    private GUIStyle buttonStyle;
    private GUIStyle imageStyle;
    private int lastFontSize = -1;
    private float time = 0f;
    private double lastRepaintTime;
    private GUIContent buttonContent;
    private List<Color> characterColors;
    private GUIStyle waveButtonStyle;
    
    //
    // IF YOU ARE READING THIS, YOU SHOULDNT BE HERE.
    // I DO NOT HAVE A LICENSE FOR YOU TO USE THIS IN YOUR OWN ASSETS.
    // 
    // IF YOU ARE READING THIS, YOU SHOULDNT BE HERE.
    // I DO NOT HAVE A LICENSE FOR YOU TO USE THIS IN YOUR OWN ASSETS.
    //
    // IF YOU ARE READING THIS, YOU SHOULDNT BE HERE.
    // I DO NOT HAVE A LICENSE FOR YOU TO USE THIS IN YOUR OWN ASSETS.
    //
    // IF YOU ARE READING THIS, YOU SHOULDNT BE HERE.
    // I DO NOT HAVE A LICENSE FOR YOU TO USE THIS IN YOUR OWN ASSETS.
    //
    // IF YOU ARE READING THIS, YOU SHOULDNT BE HERE.
    // I DO NOT HAVE A LICENSE FOR YOU TO USE THIS IN YOUR OWN ASSETS.
    //

    private void UpdateWaveColors(string text)
    {
        double currentTime = EditorApplication.timeSinceStartup;
        double deltaTime = currentTime - lastRepaintTime;
        lastRepaintTime = currentTime;
        
        time += (float)deltaTime * -1f;
        
        if (characterColors == null || characterColors.Count != text.Length)
        {
            characterColors = new List<Color>(new Color[text.Length]);
        }

        float frequency = 2f;
        float phase = time;
        
        for (int i = 0; i < text.Length; i++)
        {
            float wavePosition = (i / (float)text.Length) * frequency * Mathf.PI * 0.5f + phase;
            float hue = (Mathf.Sin(wavePosition) + 1f) * 0.5f;
            characterColors[i] = Color.HSVToRGB(hue, 0.7f, 1f);
        }
        
        Repaint();
    }

    private void DrawRichTextButton(string text, GUIStyle baseStyle)
    {
        if (waveButtonStyle == null || waveButtonStyle.fontSize != baseStyle.fontSize)
        {
            waveButtonStyle = new GUIStyle(GUI.skin.button);
            waveButtonStyle.richText = true;
            waveButtonStyle.font = baseStyle.font;
            waveButtonStyle.fontSize = baseStyle.fontSize;
            waveButtonStyle.padding = baseStyle.padding;
            waveButtonStyle.margin = baseStyle.margin;
        }

        System.Text.StringBuilder richText = new System.Text.StringBuilder();
        for (int i = 0; i < text.Length; i++)
        {
            Color color = characterColors[i];
            string hex = ColorUtility.ToHtmlStringRGB(color);
            richText.Append($"<color=#{hex}>{text[i]}</color>");
        }

        if (GUILayout.Button(richText.ToString(), waveButtonStyle))
        {
            PointlessCreations gumroadLink = (PointlessCreations)target;
            Application.OpenURL(gumroadLink.urlPointless);
        }
    }

    private void DrawResponsiveImage(Texture2D image, float availableWidth, float customSpacing)
    {
        if (image == null) return;

        // Calculate aspect ratio
        float aspectRatio = (float)image.height / image.width;
        
        // Calculate new dimensions while maintaining aspect ratio
        float targetWidth = Mathf.Min(availableWidth, image.width);
        float targetHeight = targetWidth * aspectRatio;

        // Apply custom spacing from the inspector
        EditorGUILayout.Space(customSpacing);
        
        // Center the image
        EditorGUILayout.BeginHorizontal();
        GUILayout.FlexibleSpace();
        
        Rect imageRect = GUILayoutUtility.GetRect(targetWidth, targetHeight);
        imageRect.width = targetWidth;
        imageRect.height = targetHeight;
        
        GUI.DrawTexture(imageRect, image, ScaleMode.ScaleToFit);
        
        GUILayout.FlexibleSpace();
        EditorGUILayout.EndHorizontal();
        
        // Apply custom spacing after image
        EditorGUILayout.Space(customSpacing);
    }

    public override void OnInspectorGUI()
    {   
        PointlessCreations gumroadLink = (PointlessCreations)target;

        // Check if we need to update styles
        bool updateStyles = customStyle == null || 
                          customStyle.font != gumroadLink.customFont || 
                          lastFontSize != gumroadLink.fontSize;

        if (updateStyles)
        {
            lastFontSize = gumroadLink.fontSize;
            
            customStyle = new GUIStyle(GUI.skin.label)
            {
                font = gumroadLink.customFont,
                fontSize = lastFontSize
            };

            buttonStyle = new GUIStyle(GUI.skin.button)
            {
                font = gumroadLink.customFont,
                fontSize = lastFontSize,
                normal = new GUIStyleState(),
                hover = new GUIStyleState(),
                active = new GUIStyleState()
            };

            imageStyle = new GUIStyle(GUI.skin.label)
            {
                alignment = TextAnchor.MiddleCenter,
                imagePosition = ImagePosition.ImageOnly,
                stretchWidth = true
            };

            // Force wave button style update
            waveButtonStyle = null;
        }

        const string buttonText = "Open Gumroad Link";
        UpdateWaveColors(buttonText);

        // Version label with custom style
        GUILayout.Label("Version : " + gumroadLink.versionNumber, customStyle);
        EditorGUILayout.Space(gumroadLink.textSpacing);

        // Calculate available width for responsive layout
        float availableWidth = EditorGUIUtility.currentViewWidth - 20;

        // Draw responsive image with custom spacing
        if (gumroadLink.imagePointless != null)
        {
            DrawResponsiveImage(gumroadLink.imagePointless, availableWidth, gumroadLink.imageSpacing);
        }

        // Label with custom style
        GUILayout.Label("Check out my other products on Gumroad!:", customStyle);
        EditorGUILayout.Space(gumroadLink.textSpacing);

        // Draw button with custom style
        DrawRichTextButton(buttonText, buttonStyle);

        EditorGUILayout.Space(gumroadLink.textSpacing);

        if (gumroadLink.showDefaultInspector || gumroadLink.imagePointless == null)
        {
            DrawDefaultInspector();
        }

        // Keep repainting for animation
        if (gumroadLink.imagePointless != null && gumroadLink.imagePointless.isReadable)
        {
            Repaint();
        }
    }
}