package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.math.FlxVelocity;
import flixel.util.FlxColor;
import flixel.util.FlxSpriteUtil;
import haxe.Timer;
import utils.Math.MathP;

class Player extends FlxSprite
{
	private var startPoint:Null<FlxPoint>;
	private var moveDistance:Null<Float>;
	private var target:Null<FlxPoint>;

	public function new(x:Float, y:Float)
	{
		super(x, y);
		makeGraphic(16, 16, FlxColor.BLUE);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (shouldStopMoving())
		{
			// Clear the velocity.
			this.velocity = new FlxPoint(0);

			// Make sure the sprite ends up exactly on target.
			this.setPosition(this.target.x, this.target.y);

			// Clear the move state.
			this.moveDistance = 0;
			this.startPoint = null;
			this.target = null;
		}
	}

	public function stopMoving()
	{
		this.velocity = new FlxPoint(0, 0);
	}

	public function moveToMouse(velocity:Float)
	{
		this.moveToPoint(FlxG.mouse.getPosition(), velocity, false);
	}

	public function moveToPoint(target:FlxPoint, velocity:Float, shouldStop:Bool = true)
	{
		// Store the target position.
		this.target = target;

		// Store initial position.
		this.startPoint = this.getMidpoint();

		// Calculate the distance.
		this.moveDistance = this.startPoint.distanceTo(this.target);

		this.velocity.rotate(FlxPoint.weak(0, 0), MathP.degreesBetweenPoint(this.getMidpoint(), target));
		FlxVelocity.moveTowardsPoint(this, target, velocity);
	}

	private function shouldStopMoving():Bool
	{
		if (this.startPoint == null || this.moveDistance == null)
		{
			return false;
		}

		return this.startPoint.distanceTo(this.getMidpoint()) >= moveDistance;
	}
}
