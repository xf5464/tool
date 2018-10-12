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
	
	import subGame.LoadOneFile;

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
		
		private var loadedBitmapData:Dictionary = new Dictionary();
		
		private var frameIndex:int;
		
		public function run():void
		{
			if (aniObj == null)
			{
				this.finish();
				
				return;
			}
			
			var frames:Array = aniObj.frame;
			
//			frames.sort(sortFrame);
			
			if (frames == null || frames.length == 0)
			{
				this.finish();
				
				return;
			}
			
			internalRun();
		}
		
		private function sortFrame(frame1:Object, frame2:Object):int
		{
			if (frame1.img < frame2.img)
			{
				return -1;
			}
			else if (frame1.img > frame2.img)
			{
				return 1;
			}
			else 
			{
				var index1:int = aniObj.frame.indexOf(frame1);
				
				var index2:int = aniObj.frame.indexOf(frame2);
				
				if (index1 < index2)
				{
					return -1;
				}
				else if (index1 > index2)
				{
					return 1;
				}
				else
				{
					return 0;
				}
			}
		}
		
		private var bmdaDic:Dictionary = new Dictionary();
		
		private function finishOneFrame():void
		{
			frameIndex++;
			
			internalRun();
		}
		
		private function internalRun():void
		{
			if (frameIndex == aniObj.frame.length)
			{
				this.finish();
			
				return;
			}
			
			var frame:LoadOneFrame = new LoadOneFrame();
			saveFrames.push(frame);
			frame.load(this.outputPath, this.sourceFileUrl, this.aniObj, this.frameIndex, finishOneFrame, this.bmdaDic);
		}
		
		private var saveFrames:Array = [];
		
		private var img:int;
		
		private function checkFolderAndCreate(url:String):void
		{
			var file:File = new File(url);
			
			if (!file.exists)
			{
				file.createDirectory();
			}
		}
		
		private function finish():void
		{
			if (callback != null)
			{
				callback();
				
				callback = null;
			}
			
			sourceFileUrl = null;
			
			aniObj = null;
			
			if (this.bmdaDic != null)
			{
				for (var key:Object in this.bmdaDic)
				{
					var bmda:BitmapData = this.bmdaDic[key];
					
					if (bmda != null)
					{
						bmda.dispose();
					}
					
					this.bmdaDic[key] = null;
					
					delete this.bmdaDic[key];
				}
				
				this.bmdaDic = null;
			}
			
			if (saveFrames != null)
			{
				saveFrames.length = 0;
				
				saveFrames = null;
			}
		}
		
		private var sourceFileUrl:String;
		
		private var callback:Function;
		
		private var aniObj:Object;
	}
}