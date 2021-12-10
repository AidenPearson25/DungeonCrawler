// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DrawRoom(_roomObject)
{
	var grassType = irandom_range(0, 3);
	var ground = layer_tilemap_get_id("ti_ground"); //Set ground tilemap name
	var deco = layer_tilemap_get_id("ti_deco"); //Set deco tilemap name
	var wall = layer_tilemap_get_id("ti_walls"); //Set wall tilemap name
	
	for (var i = 0; i < _roomObject.leftSize[0]; i++) //Set x 
	{
		for (var j = 0; j < _roomObject.leftSize[1]; j++) //Set y
		{
			//Draw room
			tilemap_set_at_pixel(ground, (6 + (7 * grassType)), (_roomObject.leftPos[0] + i) * 16, (_roomObject.leftPos[1] + j) * 16);
		}
	}
	
	//Set outer boundary
	for (var i = 0; i < _roomObject.leftSize[0]; i++) //Top & Bottom
	{
		tilemap_set_at_pixel(wall, 10, (_roomObject.leftPos[0] + i) * 16, (_roomObject.leftPos[1] * 16));
		tilemap_set_at_pixel(wall, 10, (_roomObject.leftPos[0] + i) * 16, (_roomObject.leftPos[1] + _roomObject.leftSize[1] - 1) * 16);
	}
	
	for (var i = 0; i < _roomObject.leftSize[1]; i++) //Left & Right
	{
		tilemap_set_at_pixel(wall, 10, (_roomObject.leftPos[0] * 16), (_roomObject.leftPos[1] + i) * 16);
		tilemap_set_at_pixel(wall, 10, (_roomObject.leftPos[0] + _roomObject.leftSize[0] - 1) * 16, (_roomObject.leftPos[1] + i) * 16);
	}
	
	//Set inner boundary
	for (var i = 1; i < _roomObject.leftSize[0] - 1; i++) //Tree border
	{
		tilemap_set_at_pixel(ground, 3, (_roomObject.leftPos[0] + i) * 16, ((_roomObject.leftPos[1] + 1) * 16));
		tilemap_set_at_pixel(wall, 4, (_roomObject.leftPos[0] + i) * 16, ((_roomObject.leftPos[1] + _roomObject.leftSize[1] - 2) * 16));
	}
	
	tilemap_set_at_pixel(wall, 5, (_roomObject.leftPos[0] + 1) * 16, (_roomObject.leftPos[1] + _roomObject.leftSize[1] - 2) * 16);
	tilemap_set_at_pixel(wall, 12, (_roomObject.leftPos[0] + _roomObject.leftSize[0] - 2) * 16, (_roomObject.leftPos[1] + _roomObject.leftSize[1] - 2) * 16);

	for (var i = 1; i < _roomObject.leftSize[1] - 2; i++) //Left and right
	{
		tilemap_set_at_pixel(wall, 19, (_roomObject.leftPos[0] + 1) * 16, ((_roomObject.leftPos[1] + i) * 16));
		tilemap_set_at_pixel(wall, 26, (_roomObject.leftPos[0] + _roomObject.leftSize[0] - 2) * 16, ((_roomObject.leftPos[1] + i) * 16));
	}
}