// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DrawRoom(_roomObject)
{
	var grassType = irandom_range(0, 3);
	
	for (var i = 0; i < _roomObject.leftSize[0]; i++) //Set x 
	{
		for (var j = 0; j < _roomObject.leftSize[1]; j++) //Set y
		{
			var tilemapName = layer_tilemap_get_id("ti_ground"); //Set tilemap name
			
			//Draw room
			tilemap_set_at_pixel(tilemapName, (6 + (7 * grassType)), (_roomObject.leftPos[0] + i) * 16, (_roomObject.leftPos[1] + j) * 16);
		}
	}
}