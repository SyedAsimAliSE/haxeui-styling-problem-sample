package com.valour.classes.events;

import openfl.events.Event;

/**
 * ...
 * @author Asim
 */
class AppEvents extends Event
{
	public static inline var ON_CLOSE:String = "onClose";
	public static inline var ON_READY:String = "onReady";
	public static inline var ON_ERROR:String = "onError";
	public static inline var ON_CHANGE_SCREEN:String = "onChangeScreen";
	public inline static var ON_PAGE_UNLOAD:String = "ON_PAGE_UNLOAD";

	public var params:Dynamic;

	public function new(type:String, customData:Dynamic = null, bubbles:Bool=false, cancelable:Bool=false)
	{
		this.params = customData;
		super(type, bubbles, cancelable);
	}

	public override function clone ():AppEvents
	{
		return new AppEvents (type, params, bubbles, cancelable);
	}

	public override function toString ():String
	{
		return "[AppEvents type=\"" + type + "\" bubbles=" + bubbles + " cancelable=" + cancelable + " eventPhase=" + eventPhase + " data=" + params + "]";
	}
}