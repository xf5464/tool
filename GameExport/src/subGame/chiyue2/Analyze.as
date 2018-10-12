package subGame.chiyue2
{
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.system.ApplicationDomain;
	import flash.utils.ByteArray;

	public class Analyze
	{
		public function Analyze(folder:String, $callback:Function = null)
		{
			callback = $callback;
			
			folderName = folder;
		}
		
		public var chiyueUrl:String;
		private var startIndex:int;
		
		public var fileName:String;
		
		public var inputFileUrl:String;
		
		private var callback:Function;
		
		private var folderName:String;
		
		private var loader:Loader;
		
		private var _globalScale:Number = 1;
		
		private var _totalCount:int;
		
		private var _loadedCount:int;
		
		public function ana(ba:ByteArray, $foldName:String):void
		{
			folderName = $foldName;
			
			var _dataBytes:ByteArray = ba;

			var zzz:Object = _dataBytes.readObject();
			
			var obj:Array = zzz as Array;
			
			if (obj != null)
			{
				totalFrames = obj.length;
			}
			else
			{
				for (var key:Object in zzz)
				{
					totalFrames++;
				}
			}
			
			_ResMgr.instance.addGenerateCallback(chiyueUrl, oneFramecallback, fatalErrorCallback);
			
			_ResMgr.instance.restoreDone(zzz, this.chiyueUrl);
			
			_dataBytes.clear();
		}
		
		private function fatalErrorCallback():void
		{
			trace("FATAL ERROR:" + this.chiyueUrl);
			this.finish();			
		}
		
		private var totalFrames:int;
		
		private var finishedFrame:int;
		
		private function oneFramecallback(index:int, bmda:BitmapData, ox:int, oy:int):void
		{
			if (bmda == null)
			{
				finishedFrame++;
				
				trace("EMPTY ERROR:" + this.chiyueUrl);
			}
			else
			{
				writePng(index, bmda, ox, oy);
				
				finishedFrame++;
			}
			
			if (finishedFrame == totalFrames)
			{
				this.finish();
			}
		}
		
		private function checkFolderAndCreate(url:String):void
		{
			var file:File = new File(url);
			
			if (!file.exists)
			{
				file.createDirectory();
			}
		}
		
		private function writePng(index:int, bmda:BitmapData, ox:int, oy:int):void
		{
			var actionUrl:String = folderName;
			
			checkFolderAndCreate(actionUrl);
			
			var placementUrl:String = actionUrl + "Placements/";
			
			var placementFile:File = new File(placementUrl);
			
			if (!placementFile.exists)
			{
				placementFile.createDirectory();
			}
			
			var bytes:ByteArray = PNGEncoder2.encode(bmda);
			
			var pngName:String = "000" + index.toString();
			
			if (index >= 10)
			{
				pngName = "00" + index.toString();
			}
			
			var pngFile:File = new File(actionUrl + pngName + ".png");
			
			var pngFs:FileStream = new FileStream();
			pngFs.open(pngFile, FileMode.WRITE);
			pngFs.writeBytes(bytes, 0, bytes.length);
			pngFs.close();
			
			var frameEndTime:int = flash.utils.getTimer();
			
			var txtUrl:String = placementUrl + pngName + ".txt";
			
			var txtData:String = ox + "\r\n" +  oy;
			
			var xmlFile:File = new File(txtUrl);
			
			var xmlFs:FileStream = new FileStream();
			xmlFs.open(xmlFile, FileMode.WRITE);
			xmlFs.writeUTFBytes(txtData);
			xmlFs.close();
		}
		
		private function finish():void
		{
			_ResMgr.instance.clearnBa(chiyueUrl);
			
			if (callback != null)
			{
				callback(this);
				
				callback = null;
				
			}
		}
		
		private function onError():void
		{
			if (callback != null)
			{
				callback(this);
				
				callback = null;
			}
		}
		
	}
}