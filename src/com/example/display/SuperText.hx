package com.example.display;

import openfl.text.TextFormat;
import openfl.text.TextField;
import openfl.display.Sprite;

/**
	Just a silly little text component.
**/
class SuperText extends Sprite {
	public function new() {
		super();
	}

	private var _textField:TextField;

	private var _text:String = null;

	public var text(get, set):String;

	private function get_text():String {
		return _text;
	}

	private function set_text(value:String):String {
		if (_text == value) {
			return _text;
		}
		_text = value;
		updateTextField();
		return _text;
	}

	private var _textFormat:TextFormat = null;

	public var textFormat(get, set):TextFormat;

	private function get_textFormat():TextFormat {
		return _textFormat;
	}

	private function set_textFormat(value:TextFormat):TextFormat {
		if (_textFormat == value) {
			return _textFormat;
		}
		_textFormat = value;
		updateTextField();
		return _textFormat;
	}

	private function updateTextField():Void {
		if (_textField == null) {
			_textField = new TextField();
			_textField.autoSize = LEFT;
			_textField.multiline = true;
			_textField.wordWrap = true;
			addChild(_textField);
		}

		if (_textFormat != null) {
			_textField.defaultTextFormat = _textFormat;
		}
		_textField.text = text;
	}
}
