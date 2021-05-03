import flixel.math.FlxPoint;

class Utils
{
	private static var i:Int;

	static public function degreesBetweenPoint(p0:FlxPoint, p1:FlxPoint):Float
	{
		var radians:Float = Math.atan2(p1.y - p0.y, p1.x - p0.x);
		return radiansToDegrees(radians);
	}

	static public function distBetweenPoints(p0:FlxPoint, p1:FlxPoint)
	{
		var x = p0.x - p1.x;
		var y = p0.y - p1.y;
		return Math.sqrt(x * x + y * y);
	}

	static function radiansToDegrees(radians:Float):Float
	{
		return radians * 180 / Math.PI;
	}

	static public function getEveryNthElement<T>(input:Array<T>, n:Int):Array<T>
	{
		var retVal = new Array<T>();

		i = 0;
		while (i < input.length)
		{
			retVal.push(input[i]);
			i += n;
		}

		return retVal;
	}

	public static function lerp(a:FlxPoint, b:FlxPoint, t:Float):FlxPoint
	{
		return new FlxPoint((1.0 - t) * a.x + t * b.x, (1.0 - t) * a.y + t * b.y);
	}
}
