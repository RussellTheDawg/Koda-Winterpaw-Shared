#if UNITY_EDITOR
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using UnityEditor;
using UnityEngine;

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
    
namespace Pointless
{
    [InitializeOnLoad]
    public static class PointlessCreationsWhitelistPatch
    {
        static PointlessCreationsWhitelistPatch()
        {
            PerformPatch();
        }
 
        private static void PerformPatch()
        {
            Debug.Log("Pointless is patching VRC component whitelist...");

            try
            {
                Debug.Log("Patching VRC whitelist for PointlessCreations...");

                var validationType = GetTypeFromAnyAssembly("VRC.SDKBase.Validation.AvatarValidation");
                var whitelistField = validationType.GetField("ComponentTypeWhiteListCommon", BindingFlags.Static | BindingFlags.Public | BindingFlags.NonPublic);

                if (whitelistField != null)
                {
                    var whitelist = (string[])whitelistField.GetValue(null);
                    var updatedWhitelist = UpdateComponentList(whitelist);
                    whitelistField.SetValue(null, updatedWhitelist);
                    Debug.Log("PointlessCreations successfully added to the whitelist.");
                }
                else
                {
                    Debug.LogError("Failed to find whitelist field in AvatarValidation.");
                }
            }
            catch (Exception e)
            {
                Debug.LogError("Error while patching the whitelist: " + e.Message);
            }
        }

        private static string[] UpdateComponentList(string[] list)
        {
            var updatedList = new List<string>(list);

            // Add PointlessWorkshop component to the whitelist
            updatedList.Add("Pointless.PointlessCreations");

            return updatedList.ToArray();
        }

        public static Type GetTypeFromAnyAssembly(string typeName)
        {
            return AppDomain.CurrentDomain.GetAssemblies()
                .Select(assembly => assembly.GetType(typeName))
                .FirstOrDefault(t => t != null);
        }
    }
}
#endif
