// Draws the shadow
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_circle(x - 1, y + 4, 3, false);
draw_set_color(c_white);
draw_set_alpha(1);

// Draws the sprite of this object with the height on air applied
draw_sprite_ext(sprite_index, image_index, x, y - z_value, image_xscale, image_yscale, image_angle, image_blend, image_alpha);