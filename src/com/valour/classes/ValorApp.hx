package com.valour.classes;

import com.valour.classes.ui.screens.MainScreen;
import haxe.ui.HaxeUIApp;
import openfl.display.Sprite;

class ValorApp extends Sprite
{

	private var haxeUIApp:HaxeUIApp = null;

	private var mainScreen:MainScreen = null;

	public function new(sprite:Sprite)
	{
		super();

		haxeUIApp = new HaxeUIApp();

		haxeUIApp.ready(function()
		{

			mainScreen = new MainScreen();
			haxeUIApp.addComponent(mainScreen);

			haxeUIApp.start();
		});
	}

}
