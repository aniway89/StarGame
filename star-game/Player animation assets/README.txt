Godot 4 character animation assets

Folders contain individual 256x256 transparent PNG frames and one horizontal strip per state:
- idle_01..06.png / idle_strip.png
- run_01..06.png / run_strip.png
- jump_01..06.png / jump_strip.png
- fall_01..06.png / fall_strip.png

Important:
The source sheet was AI-generated with a checkerboard-looking background. The background has been removed automatically, so inspect the PNG edges and clothing for any small artifacts before shipping.

Godot setup:
1. Copy the PNG files into your project's res://art/player/ folder.
2. Add/select the player's AnimatedSprite2D.
3. In SpriteFrames, create animations named idle, run, jump, and fall.
4. Add the six matching individual PNGs to each animation in order.
5. Set looping on idle and run; jump and fall are usually non-looping.
