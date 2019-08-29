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
		percentWidth = 100; //without these lines no stytling
		percentHeight = 100;

		mcLogin.horizontalAlign = "center";
		mcLogin.verticalAlign = "center";  ///<< ---- this is not taking any effect

		mcLogin.backgroundColor = 0x6633FF; // i am assigning this to whole vBox but it is ignoring one of the box in it
	}

	override public function load():Void
	{
		trace("LOGIN SCREEN LOADED");
	}

	override public function unload():Void
	{

	}

}
