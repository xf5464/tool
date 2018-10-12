package subGame.jueshitangmeng
{
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;

	public class CreateOneDirPng
	{
		public function CreateOneDirPng($sourceFileUrl:String, $outputPath:String, $callback:Function, $aniObj:Object)
		{
			sourceFileUrl = $sourceFileUrl;
			
			callback = $callback;
			
			aniObj = $aniObj;
			
			outputPath = $outputPath;
		}
		
		private var outputPath:String;
		
		public function run():void
		{
			if (aniObj == null)
			{
				this.finish();
				
				return;
			}
			
			var frames:Array = aniObj.frame;
			
			if (frames == null || frames.length == 0)
			{
				this.finish();
				
				return;
			}
			
			var firstObj:Object = frames[0];
			
			if (firstObj == null)
			{
				this.finish();
				
				return;
			}
			
			img = firstObj.img;
			
			var pngUrl:String = sourceFileUrl.replace(".fra", "") + "_" + img + ".png";
		
			pngFile = new File(pngUrl);
			
			if (!pngFile.exists || pngFile.isDirectory)
			{
				this.finish();
				
				return;
			}
			
			pngFile.addEventListener(Event.COMPLETE, onPngLoadComplete);
			pngFile.load();
		}
		
		private var img:int;
		
		protected function onPngLoadComplete(event:Event):void
		{
			pngFile.removeEventListener(Event.COMPLETE, onPngLoadComplete);
			
			pngLoader = new Loader();
			pngLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadBitmapComplete);
			pngLoader.loadBytes(pngFile.data);
		}
		
		private function checkFolderAndCreate(url:String):void
		{
			var file:File = new File(url);
			
			if (!file.exists)
			{
				file.createDirectory();
			}
		}
		
		protected function onLoadBitmapComplete(event:Event):void
		{
			pngLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onLoadBitmapComplete);
			
			var sourceBmda:BitmapData = event.target.content.bitmapData;
			
			var actionUrl:String = outputPath + "/" + img + "/";
		
			checkFolderAndCreate(actionUrl);
			
			var placementUrl:String = actionUrl + "Placements/";
			
			var placementFile:File = new File(placementUrl);
			
			if (!placementFile.exists)
			{
				placementFile.createDirectory();
			}
			
			var index:int = 1;
			
			for each (var frameObj:Object in aniObj.frame)
			{
				var offsetObj:Object = frameObj.offset;
				
				var bitmapData:BitmapData = new BitmapData(frameObj.uv.w, frameObj.uv.h, true, 0xffffffff);
				
				bitmapData.copyPixels(sourceBmda, new Rectangle(frameObj.uv.x, frameObj.uv.y, frameObj.uv.w, frameObj.uv.h), new Point(0, 0));
				
				var bytes:ByteArray = PNGEncoder2.encode(bitmapData);
				
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
				
				var txtData:String = offsetObj.x + "\r\n" +  offsetObj.y;
				
				var xmlFile:File = new File(txtUrl);
				
				var xmlFs:FileStream = new FileStream();
				xmlFs.open(xmlFile, FileMode.WRITE);
				xmlFs.writeUTFBytes(txtData);
				xmlFs.close();
				
				index++;
			}
			
			this.finish();
		}
		
		private var pngLoader:Loader;
		private var pngFile:File;
		
		private function finish():void
		{
			if (callback != null)
			{
				callback();
				
				sourceFileUrl = null;
				
				aniObj = null;
				
				callback = null;
				
				pngFile = null;
				
				if (pngLoader != null)
				{
					pngLoader.unloadAndStop();
					
					pngLoader = null;
				}
			}
		}
		
		private var sourceFileUrl:String;
		
		private var callback:Function;
		
		private var aniObj:Object;
	}
}