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
	import flash.utils.Dictionary;

	public class LoadOneFrame
	{
		public function LoadOneFrame()
		{
		}
		
		public function load($outputUrl:String, $sourceUrl:String, $ani:Object, $index:int, $callback:Function, $dic:Dictionary):void
		{
			ani = $ani;
			
			index = $index;
			
			callback = $callback;
			
			dic = $dic;
			
			outputPath = $outputUrl;
			
			var targetFrameObj:Object = ani.frame[index];
			
			if (targetFrameObj == null)
			{
				this.finish();
				
				return;
			}
			
			targetImg  = targetFrameObj.img;
			
			if (dic[targetImg] != null)
			{
				var sourceBmda:BitmapData = dic[targetImg];
				
				this.processWithBitmapData(sourceBmda);
			}
			else
			{
				var pngUrl:String = $sourceUrl.replace(".fra", "") + "_" + targetImg + ".png";
				
				pngFile = new File(pngUrl);
				
				if (!pngFile.exists || pngFile.isDirectory)
				{
					this.finish();
					
					return;
				}
	
				pngFile.addEventListener(Event.COMPLETE, onPngLoadComplete);
				pngFile.load();
			}
		}
		
		private var targetImg:int;
		
		private var pngLoader:Loader;
		
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
			
			this.dic[targetImg] = sourceBmda;
			
			processWithBitmapData(sourceBmda);
		}
		
		private function processWithBitmapData(sourceBmda:BitmapData):void
		{
			var actionUrl:String = outputPath;
			
			checkFolderAndCreate(actionUrl);
			
			var placementUrl:String = actionUrl + "Placements/";
			
			var placementFile:File = new File(placementUrl);
			
			if (!placementFile.exists)
			{
				placementFile.createDirectory();
			}
			
			var frameObj:Object = this.ani.frame[index];
			
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
			
			this.finish();
		}
		
		private var pngFile:File;
		
		private function finish():void
		{
			if (callback != null)
			{
				callback();
			}
			
			ani = null;
			
			callback = null;
			
			dic = null;
		
			this.pngFile = null;
			
			if (this.pngLoader != null)
			{
				this.pngLoader.unloadAndStop();
				
				this.pngLoader = null;
			}
		}
		
		private var ani:Object;
		
		private var index:int;
		
		private var callback:Function;
		
		private var dic:Dictionary;
		
		private var outputPath:String;
	}
}