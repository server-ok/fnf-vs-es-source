package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.system.FlxSound;
import flixel.system.ui.FlxSoundTray;
import lime.app.Application;

class TerminalState extends MusicBeatState
{
    public static var LoggedIn:Bool = false;
    override function create()
        {
		    var txt:FlxText = new FlxText(0, 0, FlxG.width,
			"Easter egg terminal initialized.\n Hold your secret word to login.",
			32);
		    txt.setFormat("VCR OSD Mono", 32, FlxColor.fromRGB(200, 200, 200), CENTER);
		    txt.borderColor = FlxColor.BLACK;
		    txt.borderSize = 3;
		    txt.borderStyle = FlxTextBorderStyle.OUTLINE;
		    txt.screenCenter();
            add(txt);
            if (LoggedIn == true)
                {
                    remove(txt);
                    var txt2:FlxText = new FlxText(0, 0, FlxG.width,
                    "Logged in!\nPress 1 to open secret freeplay menu.\nPress ESC to exit.\n\nyou can also press other buttons, maybe they do something too.",
                    32);
                    txt2.setFormat("VCR OSD Mono", 32, FlxColor.fromRGB(200, 200, 200), CENTER);
                    txt2.borderColor = FlxColor.BLACK;
                    txt2.borderSize = 3;
                    txt2.borderStyle = FlxTextBorderStyle.OUTLINE;
                    txt2.screenCenter();
                    add(txt2);
                }
            else
                {
                    create;
                }
        }
    
    override function update(elapsed:Float)
	    {
		if (FlxG.keys.pressed.H && LoggedIn == false)
		{
            if (FlxG.keys.pressed.E)
                {
                    if (FlxG.keys.justPressed.X)
                        {
                            LoggedIn = true;
                            FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
                            FlxG.switchState(new TerminalState());
                        }
                }
		};
        if (FlxG.keys.justPressed.F && LoggedIn == true)
            {
                FlxG.switchState(new FreeplayState());
            }
        if (FlxG.keys.justPressed.S && LoggedIn == true)
            {
                FlxG.switchState(new StoryMenuState());
            }
        if (FlxG.keys.justPressed.O && LoggedIn == true)
            {
                FlxG.switchState(new OptionsMenu());
            }
        if (FlxG.keys.pressed.G && LoggedIn == true)
            {
                if (FlxG.keys.pressed.I)
                    {
                        if (FlxG.keys.pressed.R)
                            {
                                if (FlxG.keys.justPressed.L)
                                    {
                                        var gfDance:FlxSprite;
                                        gfDance = new FlxSprite(FlxG.width * 0.4, FlxG.height * 0.07);
		                                gfDance.frames = Paths.getSparrowAtlas('gfDanceTitle');
		                                gfDance.animation.addByIndices('danceLeft', 'gfDance', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
	                                	gfDance.animation.addByIndices('danceRight', 'gfDance', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
	                                	gfDance.antialiasing = FlxG.save.data.antialiasing;
	                                	add(gfDance);
                                    }
                            }
                    }
            }
        if (FlxG.keys.justPressed.ONE)
            {
                FlxG.switchState(new SecretFreeplayState());
            };
		if (controls.BACK)
		    {
			    FlxG.switchState(new TitleState());
		    };
        super.update(elapsed);
        }
        
}