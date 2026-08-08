var _layer = layer_tilemap_get_id("tl_tile")

if(place_meeting(x, y+1, _layer) and !place_meeting(x, y-1, _layer) )
{
	instance_destroy();
	instance_create_layer(x, y, "Instances", obj_tree);
}