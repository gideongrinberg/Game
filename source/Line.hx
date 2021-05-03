package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;

using flixel.util.FlxSpriteUtil;

class Line extends FlxSprite
{
	public var points:Array<FlxPoint>;

	private var lineStyle:LineStyle;
	private var scaleMode:DrawStyle;

	public function new(points:Null<Array<FlxPoint>> = null, _color:FlxColor = FlxColor.RED, _thickness:Int = 1, smoothLine:Bool = true)
	{
		super(0, 0);
		this.makeGraphic(FlxG.width, FlxG.height, FlxColor.TRANSPARENT, true);

		if (points != null)
		{
			this.points = points;
		}
		else
		{
			this.points = new Array<FlxPoint>();
		}

		this.lineStyle = {color: _color, thickness: _thickness};
		this.scaleMode = {smoothing: smoothLine};
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		for (i in 0...this.points.length)
		{
			if (this.points[i + 1] != null)
			{
				this.drawLine(this.points[i].x, this.points[i].y, this.points[i + 1].x, this.points[i + 1].y, this.lineStyle, this.scaleMode);
			}
		}
	}
}
