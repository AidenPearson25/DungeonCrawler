/// @description Invicibility timing
// You can write your code in this editor
if((currentState == 4) && (playerHealth <= 0)) //If you just recoiled, and you're dead,
{
	currentState = 5; //enter a dead state.
}
if(currentState == 4) //if you're here because you're recoiling,
{
	currentState = 0; //stop that.
	iframes = true; //Start iframes
	alarm_set(4, iframesTime); //Come back here once your iframes are over
}
else if(iframes) //if you're here because you ran out of iframes,
{
	iframes = false; //then turn off iframes.
}
