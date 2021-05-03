package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import flixel.util.FlxPath;

class PlayState extends FlxState
{
	// var playerSprite:FlxSprite = new FlxSprite();
	var player:Player;
	var line:Line;

	override public function create()
	{
		super.create();

		player = new Player(20, 20);

		add(player);
		add(player.line);

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
		if (FlxG.mouse.pressed)
		{
			this.player.line.points.push(FlxG.mouse.getPosition());
		}

		if (FlxG.mouse.justPressedRight)
		{
			this.player.moveAlongLine();
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
