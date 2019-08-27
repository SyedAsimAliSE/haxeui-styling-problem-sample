package com.valour.classes.service;

import com.valour.classes.data.enums.Screens;
import flash.errors.IllegalOperationError;
import haxe.ui.util.EventMap;
import openfl.events.EventDispatcher;

/**
 * ...
 * @author Asim
 */
/*A helper class to provide services*/
class AppService extends EventDispatcher implements Singleton
{

	//static public var instance(get, null):ServiceProvider;
	//static function get_instance(): ServiceProvider return (instance == null) ? instance = new ServiceProvider() : instance;

	private var _eventMap:EventMap = null;
	
	@:isVar public var CURR_SCREEN(get, set):Screens = null;
	

	public function new()
	{
		super();
	}

	public function initialize()
	{
		//trace("--::SERVICE HELPER INITIALIZED::-- ");

		this._eventMap = new EventMap();

	}

	public function registerEvent(type:String, listener:Dynamic)
	{

		if (_eventMap == null) throw new IllegalOperationError("Please initialize AppService");

		_eventMap.add(type, listener);
	}

	function get_CURR_SCREEN():Screens { return CURR_SCREEN; }

    function set_CURR_SCREEN(value:Screens):Screens { return CURR_SCREEN = value; }
	
}
