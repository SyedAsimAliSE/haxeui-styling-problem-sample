package com.valour.classes.ui.screens;
import com.valour.classes.core.BaseScreen;
import openfl.events.Event;

@:build(haxe.ui.macros.ComponentMacros.build("assets/ui/screens/loginscreen/login_screen.xml"))
class LoginScreen extends BaseScreen
{

	public function new()
	{
		super();

		this.addEventListener(Event.ADDED_TO_STAGE, init);
	}

	private function init(evt:Event):Void
	{

		this.removeEventListener(Event.ADDED_TO_STAGE, init);

		initUI();
	}

	override public function initUI():Void
	{

		//this.horizontalAlign = "center";
		//this.verticalAlign = "center";

	}

	override public function load():Void
	{
		trace("LOGIN SCREEN LOADED");
	}

	override public function unload():Void
	{

	}

}
