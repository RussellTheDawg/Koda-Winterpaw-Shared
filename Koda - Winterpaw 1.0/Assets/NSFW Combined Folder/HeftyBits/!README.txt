 #     #                                                 
 #     # ###### ###### ##### #   # #####  # #####  ####  
 #     # #      #        #    # #  #    # #   #   #      
 ####### #####  #####    #     #   #####  #   #    ####  
 #     # #      #        #     #   #    # #   #        # 
 #     # #      #        #     #   #    # #   #   #    # 
 #     # ###### #        #     #   #####  #   #    ####  


1.7
ᐅ Fine tuned weightpainting
ᐅ New ballsag animation
ᐅ Additional collider in the nuts to help avoid the dick falling 
   through the sac when the balls are very big
ᐅ Slight tweak to physbone settings
ᐅ Alternative resize mode for the balls, basically scaling different bones, 
   the alternative mode is primarily for when there's extra sag applied.
   Applies some additional sag as well to compensate for what's lost when resizing that bone.
                                                         

Prerequisites: 
* (Required)    VRCFury                    (https://github.com/VRCFury/VRCFury)
* (Recommended) Poiyomi 8.1                (https://github.com/poiyomi/PoiyomiToonShader/releases)

#######################################################

Installation:
Image guide here: https://imgur.com/a/QhPHQwy

1. This project uses VRCFury to install itself into your 
    avatar in a way that does not modify your existing files.

    Please download and add it to your Unity project:

    https://github.com/VRCFury/VRCFury
    (Direct link: https://vrcfury.com/download)

2. Drag the "HeftyBits" prefab to a fitting spot in your avatar hierarchy,
   For example under "<Avatar>/Armature/Hips". 
   Resize, rotate and move it to your liking. Even though the size is adjustable ingame 
   I recommend picking a good default size.

   !! Do not use the FBX files directly unless you want to setup 
   !! everything manually from scratch!

3. Extra notes about shading:
   This project is setup to use Poiyomi by default, if you wish to use the standard shader
   then there's a "Standard" version in the Materials folder that you can just drag and
   drop onto the junk. 

   There are a few example textures but the included Substance Painter file exist if
   you wish to setup your own textures.

#######################################################

Model performance:

  * Normal
      Polygons:  3206
      Materials: 1
      Meshes:    1
      Physbones: 3
      VRAM:      ~10-15MB (Depends on texture resolution and quality)


 #######                                                     
 #       #    # ##### #####    ##      ##### # #####   ####  
 #        #  #    #   #    #  #  #       #   # #    # #      
 #####     ##     #   #    # #    #      #   # #    #  ####  
 #         ##     #   #####  ######      #   # #####       # 
 #        #  #    #   #   #  #    #      #   # #      #    # 
 ####### #    #   #   #    # #    #      #   # #       #### 

- Want your junk to interact with the ground? 
  Rightclick your avatar root in your hierarchy and click "Create Empty". Click on it and to the right press 
  "Add Component" and add a "VRC Phys Bone Collider". Set it to plane then add it as a collider 
  underneath the junk and balls dynamics!

- What about interacting with my legs and feet?
  This require a bit more work but basically add a VRC Phys Bone Colliders to the body parts you wish in your
  heirarchy, set it to capsule and in this case it's important to check "Bones As Spheres". Play around with the values
  then drag and drop into the collider fields on both the Junk and Balls dynamics.

  If you're a bit confused about the above, check this album to see how I have it setup:
  https://imgur.com/a/YkpisoW

- Want to increase the maxiumum size of the dick or nuts for the radial menu?
  Open either the BallSize or the CockSize animation, shift the timeline (the white line) 
  to the 1:00 mark and update the values that should be 3 by default to 
  your new desired number. The same goes for smaller, but for the first frame to a lower value.
 
  Check this link if you're confused about the above text:
  https://drive.google.com/file/d/1-M9EUh7xMvmITZiLq0qqDTEXbvgjXevr/view?usp=drive_link

- Want to modify the FBX in blender? 
  Remember to export it with "FBX Unit Scale" in the "Apply Scalings"
  during the export.

- Animations not working?
  This asset is made to work with "Write Defaults", if VRCFury asks about a mismatch either say yes to convert it all to 
  write defaults or just ignore.

#######################################################
Icons created by Smashicons - Flaticon