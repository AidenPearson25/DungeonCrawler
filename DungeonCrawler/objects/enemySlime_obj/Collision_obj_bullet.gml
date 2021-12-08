/// @description Insert description here
// You can write your code in this editor
instance_destroy();
instance_destroy(other);
for (var i = 0; i < 2; ++i) {
    with instance_create_layer(x,y,"objects",enemyMiniSlime_obj){
		x+=irandom_range(5,10);
		y+=irandom_range(5,10);
	}
}