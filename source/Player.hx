package;

import flixel.FlxSprite;
import flixel.util.FlxPath;

class Player extends FlxSprite
{
	public var line:Line;
	public final speed:Int = 100;

	public function new(x:Float, y:Float, sprite:Null<String> = null)
	{
		super(x, y);

		this.path = new FlxPath();
		this.line = new Line();

		if (sprite != null)
		{
			loadGraphic(sprite);
		}
		else
		{
			makeGraphic(16, 16);
		}
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		line.update(elapsed);
	}

	public function moveAlongLine()
	{
		for (i in 0...this.line.points.length)
		{
			// Lerp between points using distance / speed as time.
			this.line.points.insert(i + 1,
				Utils.lerp(line.points[i], line.points[i + 1], Utils.distBetweenPoints(line.points[i], line.points[i + 1]) / speed));
		}

		this.path = new FlxPath().start(Utils.getEveryNthElement(line.points, 4), speed, FlxPath.FORWARD, true);
		if (!this.path.active)
		{
			this.line.points = null;
		}
	}
}
