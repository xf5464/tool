package subGame.sanrenchuanqi
{
	import flash.display.Loader;
	import flash.system.ApplicationDomain;
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	import subGame.sanrenchuanqi.wylib.Packs.BitmapPack.MDPBitmapPackage;
	import subGame.sanrenchuanqi.wylib.Packs.BitmapPack.MDPSWFBitmapDirectory;
	import subGame.sanrenchuanqi.wylib.Packs.BitmapPack.MDPSWFBitmapPackage;

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
		
		public static const MDPFILEVERSION_100116:uint = 655632;
		
		public static const MDPFILERECORDIDENT:uint = 16860237;
		
		public static const MDPDIRECTORYRECORDIDENT:uint = 16925773;
		
		public static const MDPFILEVERSION_CURRENT:uint = MDPFILEVERSION_100116;
		
		public static const MDPFILEHEADERIDENT:uint = 5260365;
		
		protected function loadHead(param1:ByteArray) : void
		{
			var k1:uint = param1.readUnsignedInt();
			
			if(k1 != MDPFILEHEADERIDENT)
			{
				trace("非有效的资源包文件      ");
			}
			
			var k2:uint = param1.readUnsignedInt();
			
			if(k2 != MDPFILEVERSION_CURRENT)
			{
				trace("资源包文件有效，但需要在更新后才可使用！    ");
			}
			param1.position = param1.readUnsignedInt();
		}
		
		public function ana(ba:ByteArray, $foldName:String, isGenerateAtf:Boolean = false):void
		{
			folderName = $foldName;
			
			var _dataBytes:ByteArray = ba;
			
			ba.endian = Endian.LITTLE_ENDIAN;

			mdpPackger = new MDPSWFBitmapPackage();
			mdpPackger.outputUrl = this.folderName;
			mdpPackger.finishAllCallback = this.onAllBitmapFinishCallback;
			try
			{
				mdpPackger.load(ba);
			}
			catch(e:Error)
			{
				trace("run MDPBitmapPackage load error:" + fileName + "  " + e.toString());
				
				finish();
			}
		}
		
		private function onAllBitmapFinishCallback():void
		{
			finish();
		}
		
		private var mdpPackger:MDPSWFBitmapPackage;
		
		private function finish():void
		{
			if (callback != null)
			{
				callback(this);
				
				callback = null;
				
				if (mdpPackger != null)
				{
					mdpPackger.destruct();
				}
				
				mdpPackger = null;
			}
		}
		
		
	}
}