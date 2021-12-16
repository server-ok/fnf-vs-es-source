package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;

class CharacterSetting
{
	public var x(default, null):Int;
	public var y(default, null):Int;
	public var scale(default, null):Float;
	public var flipped(default, null):Bool;

	public function new(x:Int = 0, y:Int = 0, scale:Float = 1.0, flipped:Bool = false)
	{
		this.x = x;
		this.y = y;
		this.scale = scale;
		this.flipped = flipped;
	}
}

class MenuCharacter extends FlxSprite
{
	private static var settings:Map<String, CharacterSetting> = [
		'bf' => new CharacterSetting(0, -20, 1.0, true),
		'gf' => new CharacterSetting(50, 80, 1.5, true),
		'dad' => new CharacterSetting(-15, 130),
		'spooky' => new CharacterSetting(20, 30),
		'pico' => new CharacterSetting(0, 0, 1.0, true),
		'mom' => new CharacterSetting(-30, 140, 0.85),
		'parents-christmas' => new CharacterSetting(100, 130, 1.8),
		'senpai' => new CharacterSetting(-40, -45, 1.4),
		'slavya' => new CharacterSetting(-15, 50),
		'lena' => new CharacterSetting(-15, 50),
		'ulya' => new CharacterSetting(-15, 50),
		'alisa' => new CharacterSetting(-15, 50),
		'pioneers' => new CharacterSetting(-15, 50)
	];

	private var flipped:Bool = false;
	//questionable variable name lmfao
	private var goesLeftNRight:Bool = false;
	private var danceLeft:Bool = false;
	private var character:String = '';

	public function new(x:Int, y:Int, scale:Float, flipped:Bool)
	{
		super(x, y);
		this.flipped = flipped;

		antialiasing = FlxG.save.data.antialiasing;

		frames = Paths.getSparrowAtlas('menu chel');

		animation.addByPrefix('bf', "BF idle dance white", 24, false);
		animation.addByPrefix('bfConfirm', 'BF HEY!!', 24, false);
		animation.addByPrefix('slavya', 'Slavya story icon', 24, false);
		animation.addByPrefix('lena', 'Lena story icon', 24, false);
		animation.addByPrefix('ulya', 'Ulya story icon', 24, false);
		animation.addByPrefix('alisa', 'Dvach story icon', 24, false);
		animation.addByPrefix('pioneers', 'Pioneers story icon', 24, false);

		setGraphicSize(Std.int(width * scale));
		updateHitbox();
	}

	public function setCharacter(character:String):Void
	{
		var sameCharacter:Bool = character == this.character;
		this.character = character;
		if (character == '')
		{
			visible = false;
			return;
		}
		else
		{
			visible = true;
		}

		if (!sameCharacter) {
			bopHead(true);
		}

		var setting:CharacterSetting = settings[character];
		offset.set(setting.x, setting.y);
		setGraphicSize(Std.int(width * setting.scale));
		flipX = setting.flipped != flipped;
	}

	public function bopHead(LastFrame:Bool = false):Void
	{
		if (character == 'gf' || character == 'spooky') {
			danceLeft = !danceLeft;

			if (danceLeft)
				animation.play(character + "-left", true);
			else
				animation.play(character + "-right", true);
		} else {
			//no spooky nor girlfriend so we do da normal animation
			if (animation.name == "bfConfirm")
				return;
			animation.play(character, true);
		}
		if (LastFrame) {
			animation.finish();
		}
	}
}
