package com.valour.classes.ui.screens;
import com.valour.classes.core.BaseScreen;
import com.valour.classes.core.IScreen;
import com.valour.classes.data.enums.Screens;
import com.valour.classes.events.AppEvents;
import com.valour.classes.events.HaxeUIEvent;
import com.valour.classes.service.AppService;
import com.valour.classes.ui.screens.LoginScreen;
import haxe.ui.containers.VBox;
import motion.Actuate;
import motion.easing.Linear;

/**
 * ...
 * @author Asim
 *
 *  Main Screen which decides what screen to show
 */

@:build(haxe.ui.macros.ComponentMacros.build("assets/ui/screens/main_screen.xml"))
class MainScreen extends BaseScreen
{

	private static inline var SCREEN_FADE_SPEED:Float = 0.5;

	private var _screenHolder:VBox = null;

	//Screens
	private var loginScreen:LoginScreen = null;

	public function new()
	{
		super();

		initUI();
	}

	override public function initUI():Void
	{
		trace("MAIN VIEW " + this);

		//After enabling these the main screen started getting styles :) 
		percentWidth = 100;
		percentHeight = 100;

		
		//if i use instance generated from xml, it will be added way before main screen instance.
		//_screenHolder = screenHolder; 
		
		//fix 
		_screenHolder = new VBox();
		this.addComponent(_screenHolder);
		_screenHolder.percentWidth = 100;
		_screenHolder.percentHeight = 100;
		
		 
		AppService.instance.registerEvent(AppEvents.ON_CHANGE_SCREEN, onChangeScreen);

		showScreen(Screens.LOGIN_SCREEN);

	}

	override public function load():Void
	{

	}

	private function onChangeScreen(event:HaxeUIEvent):Void
	{

		trace(event.params.screenName);
		showScreen(event.params.screenName);
	}

	public function showScreen(screen:Screens):Void
	{

		if (AppService.instance.CURR_SCREEN == screen)
			return;

		try {
			AppService.instance.CURR_SCREEN = screen;

			if (_screenHolder.numChildren > 0)
			{
				Actuate.tween(_screenHolder.getChildAt(0), 0.1, {alpha: 0}).ease(Linear.easeNone).autoVisible(true).onComplete(screenOutComp, [ _screenHolder.getChildAt(0) ]);
			}

			switch (screen)
			{
				case Screens.LOGIN_SCREEN:
					{
						loginScreen = new LoginScreen();

						//_screenHolder.addChild(loginScreen);
						_screenHolder.addComponent(loginScreen);

						loginScreen.visible = false;
						loginScreen.alpha = 0;
						Actuate.tween(loginScreen, SCREEN_FADE_SPEED, {alpha: 1})
						.ease(Linear.easeNone)
						.autoVisible(true)
						.onComplete(screenInComp, [loginScreen]);
					}
				default:
			}
		}
		catch (e:Dynamic)
		{
			trace("SCREEN CHANGING ERROR " + e);
		}

	} // F

	private function screenInComp(_screen:IScreen):Void
	{
		_screen.load();
	}

	private function screenOutComp(_screen:IScreen):Void
	{
		_screen.unload();
		_screenHolder.removeChildAt(0);

	}

	override public function unload():Void
	{
		this.removeAllComponents();
	}

}
