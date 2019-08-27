package com.valour.classes.events;
import haxe.ui.events.UIEvent;

/**
 * ...
 * @author Asim
 */

class HaxeUIEvent extends UIEvent
{

	public static inline var ON_UI_READY:String = "onUIReady";

	public var params:Dynamic = null; //Will hold different data

	override public function clone():HaxeUIEvent
	{

		var c:HaxeUIEvent = new HaxeUIEvent(this.type);
		c.type = this.type;
		c.params = this.params;

		return c;
	}

}
