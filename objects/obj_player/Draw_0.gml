draw_self();

if (show_interact_prompt)
{
    var _txt = interact_prompt_text;

    draw_set_font(global.fnt_interact);
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);

    var _scale = 0.5;
    var _y = y - 24;

    // outline (scaled too)
    draw_set_colour(c_black);
    draw_text_transformed(x+1, _y, _txt, _scale, _scale, 0);
    draw_text_transformed(x-1, _y, _txt, _scale, _scale, 0);
    draw_text_transformed(x, _y+1, _txt, _scale, _scale, 0);
    draw_text_transformed(x, _y-1, _txt, _scale, _scale, 0);

    // main text
    draw_set_colour(c_white);
    draw_text_transformed(x, _y, _txt, _scale, _scale, 0);
}