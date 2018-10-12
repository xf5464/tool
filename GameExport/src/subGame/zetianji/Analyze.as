package subGame.zetianji
{
	import flash.display.Loader;
	import flash.system.ApplicationDomain;
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	import subGame.zetianji.parser.VFmtParser;
	
	public class Analyze
	{
		public function Analyze(folder:String, $callback:Function = null)
		{
			callback = $callback;
			
			folderName = folder;
		}
		
		public var fileName:String;
		
		public var inputFileUrl:String;
		
		private var callback:Function;
		
		private var folderName:String;
		
		public function ana(ba:ByteArray, $foldName:String, isGenerateAtf:Boolean = false):void
		{
			folderName = $foldName;
			
			var _dataBytes:ByteArray = ba;
			
			var parser:VFmtParser = new VFmtParser();
			parser.outputFolder = folderName;
			parser.onAllFinishCallback = this.onAllBitmapFinishCallback;
			parser.loadbytes(ba);
		}
		
		private function onAllBitmapFinishCallback():void
		{
			finish();
		}
		
		
		private function finish():void
		{
			if (callback != null)
			{
				callback(this);
				
				callback = null;
			}
		}
		
		
	}
	
}