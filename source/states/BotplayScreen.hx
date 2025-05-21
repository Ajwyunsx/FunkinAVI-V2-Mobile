package states;

import lime.app.Application;
import flixel.text.FlxText.FlxTextFormat;
import flixel.text.FlxText.FlxTextFormatMarkerPair;
import backend.FlxTextAlphabet;
import gameObjects.utils.AttachedFlxText;
import flixel.addons.transition.FlxTransitionableState;

class BotplayScreen extends MusicBeatState {
    override public function create() {
        super.create();

        var text = new FlxSprite().loadGraphic(Paths.image("Funkin_avi/botplayScreen/botplayBG"));
        add(text);

        var fog:FlxBackdrop = new FlxBackdrop(Paths.image("Funkin_avi/botplayScreen/botplayFog"), X, 0, 0);
		fog.velocity.set(-100, 0);
        fog.alpha = 0.45;
		add(fog);

	#if android
	addVirtualPad(NONE, A_B);
	#end
    }
    override function update(elapsed:Float) {
        super.update(elapsed);

        if (FlxG.keys.justPressed.Y #if android || _virtualpad.buttonA.justPressed #end)
        {
            GameData.overrideBotplay();
        }
        if (FlxG.keys.justPressed.N #if android || _virtualpad.buttonB.justPressed #end)
        {
            MusicBeatState.switchState(new PlayState());
        }
    }
}
