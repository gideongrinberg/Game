package;

import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import flixel.util.FlxPath;
import haxe.io.Path;

class Player extends FlxSprite
{
	public var line:Line;

	public function new(x:Float, y:Float)
	{
		super(x, y);

		this.path = new FlxPath();
		this.line = new Line();

		makeGraphic(16, 16, FlxColor.BLUE);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		line.update(elapsed);
	}

	public function moveAlongLine()
	{
		this.path = new FlxPath().start(line.points);
	}
}
