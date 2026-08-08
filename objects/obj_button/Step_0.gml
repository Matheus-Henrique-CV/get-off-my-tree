if(position_meeting(mouse_x, mouse_y, self))
{
	image_xscale = 1.2;
	image_yscale = 1.2;
	
	if(mouse_check_button_released(mb_left))
	{
		if(number == 1)
		{
			room_goto(rm_gameplay);
		}
		else if(number == 2)
		{
			game_end()	;
		}
		else if(number == 3)
		{
			room_goto(rm_menu);
		}
		else if(number == 4)
		{
			room_goto(rm_gameplay);
		}	
		else if(number == 5)
		{
			room_goto(rm_tutorial);
		}	
	}
}	

image_xscale = lerp(image_xscale, 1, 0.2)
image_yscale = lerp(image_yscale, 1, 0.2)