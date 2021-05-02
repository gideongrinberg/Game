package utils;

import flixel.math.FlxPoint;

class MathP
{
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
}
