function get_unstuck(_object){
	if(place_meeting(x, y, _object)) {
		for(var i = 0; i < 1000; ++i) {
			//Right
			if(!place_meeting(x + i, y, _object)) {
				x += i;
				break;
			}
			//Left
			if(!place_meeting(x - i, y, _object)) {
				x -= i;
				break;
			}
			//Up
			if(!place_meeting(x, y - i, _object)) {
				y -= i;
				break;
			}
			//Down
			if(!place_meeting(x, y + i, _object)) {
				y += i;
				break;
			}
			//Top Right
			if(!place_meeting(x + i, y - i, _object)) {
				x += i;
				y -= i;
				break;
			}
			//Top Left
			if(!place_meeting(x - i, y - i, _object)) {
				x -= i;
				y -= i;
				break;
			}
			//Bottom Right
			if(!place_meeting(x + i, y + i, _object)) {
				x += i;
				y += i;
				break;
			}
			//Bottom Left
			if(!place_meeting(x - i, y + i, _object)) {
				x -= i;
				y += i;
				break;
			}
		}
	}
	
}