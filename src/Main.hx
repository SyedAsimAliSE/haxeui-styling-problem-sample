package;

import com.valour.classes.ValorApp;
import com.valour.classes.service.AppService;
import openfl.display.Sprite;
import openfl.events.Event;

/**
 * ...
 * @author Asim
 *
 * ENTRY POINT
 */
class Main extends Sprite
{

	private var _app:ValorApp = null;

	public function new()
	{
		super();
		this.addEventListener(Event.ADDED_TO_STAGE, init);
	}

	private function init(event:Event):Void
	{
		this.removeEventListener(Event.ADDED_TO_STAGE, init);

		AppService.instance.initialize();

		_app = new ValorApp(this);

	}

}
