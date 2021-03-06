import haxe.Timer;
import haxe.io.Bytes;

class AllocMain {
	public function new() {
		var startTime = Timer.stamp();

		var count:Int = 500000;

		allocBytes(count, 100);
		allocBytes(count, 1000);
		allocBytes(count, 101);
		allocBytes(count, 1001);
		allocBytes(count, 102);

		printStats(Timer.stamp() - startTime);
	}

	function allocBytes(count:Int, size:Int) {
		var data:Array<Bytes> = [];
		for (i in 0...count) {
			var bytes:Bytes = Bytes.alloc(size);
			bytes.fill(0, size, i);
			data.push(bytes);
		}
		for (i in 0...count) {
			var bytes:Bytes = Bytes.alloc(size);
			bytes.fill(0, size, i);
			bytes.compare(data[i]);
		}
	}

	function printStats(duration:Float) {
		var target = HaxeVersionsMacro.macroMapOutput2Target();
		Sys.println('$target;---;0;0;${Std.string(duration)}');
	}

	static function main() {
		try {
			new AllocMain();
		} catch (e:Any) {
			trace(e);
		}
	}
}
