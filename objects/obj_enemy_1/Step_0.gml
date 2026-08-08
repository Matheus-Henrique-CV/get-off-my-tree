if(image_blend == c_aqua) 
{
	freeze = true
	if(freeze)
	{
		image_speed = 0; 
		speed = 0;
		target = noone;
	}
}
else
{
	freeze = false;	
}

state_machine();
y = clamp(y, -100, 335);

if(place_meeting(x, y, obj_cobweb)) speed = 0;