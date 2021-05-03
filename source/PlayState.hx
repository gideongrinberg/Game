package;

import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState
{
	// var playerSprite:FlxSprite = new FlxSprite();
	var player:Player;

	override public function create()
	{
		super.create();

		player = new Player(20, 20);
		player.setTargetVelocity(500);

		add(player);

		#if debug
		debug();
		#end
	}

	override public function update(elapsed:Float)
	{
		handleInput();
		super.update(elapsed);
	}

	function handleInput()
	{
		if (FlxG.mouse.justPressed)
		{
			player.addTarget(FlxG.mouse.getPosition());
		}

		if (FlxG.keys.justPressed.BACKSLASH)
		{
			FlxG.debugger.visible = false;
		}
	}

	private function debug()
	{
		FlxG.debugger.visible = true;
		FlxG.log.redirectTraces = true;
	}
}
