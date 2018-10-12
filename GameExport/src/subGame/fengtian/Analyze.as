package subGame.fengtian	
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	public class Analyze
	{
		public function Analyze(folder:String, $callback:Function = null)
		{
			appDomain = new ApplicationDomain();
//			appDomain = ApplicationDomain.currentDomain
			
			callback = $callback;
			
			folderName = folder;
		}
		
		private var callback:Function;
		
		private var folderName:String;
		
		private var loader:Loader;
		
		private var key:String;
		
		private var skinId:int;
		
		private var targetActionName:String;
		
		private var modelDic:Dictionary;
		
		public function ana(ba:ByteArray, $skinId:int, $actionName:String, $modelDic:Dictionary, $foldName:String):void
		{
			skinId = $skinId;
			
			targetActionName = $actionName;
			
			modelDic = $modelDic;
			
			folderName = $foldName;
			
			var context:LoaderContext = new LoaderContext(false, appDomain);
			context.allowCodeImport = true;
			
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadComplete);
			loader.loadBytes(ba, context);
		}
		
		public function analyzeRsFile(ba:ByteArray, $foldName:String):void
		{
			folderName = $foldName;
			
			var _loc3_:int = 0;
			var _loc4_:ByteArray = null;
			var _loc5_:ByteArray = null;
			var _loc2_:ByteArray = ba as ByteArray;
			_loc2_.uncompress();
			_loc2_.position = 0;
			_loc2_.readBoolean();
			_loc3_ = _loc2_.readInt();
			_loc4_ = new ByteArray();
			_loc2_.readBytes(_loc4_,0,_loc3_);
			_loc4_.position = 0;
			_loc5_ = new ByteArray();
			_loc2_.readBytes(_loc5_);
			while(_loc4_.bytesAvailable > 0)
			{
				add(_loc4_);
			}
			
			var context:LoaderContext = new LoaderContext(false, appDomain);
			context.allowCodeImport = true;
			
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadBytesComplete);
			loader.loadBytes(_loc5_, context);
		}
		
		protected function onLoadBytesComplete(event:Event):void
		{
			for (var name:String in rsDic)
			{
				var hasDefine:Boolean = appDomain.hasDefinition(name);
				
				if (hasDefine)
				{
					var c:Object = appDomain.getDefinition(name);
					
					var z:BitmapData = new c() as BitmapData;
					
					var pngFile:File = new File(this.folderName + name + ".png");
					
					var ba:ByteArray = PNGEncoder2.encode(z);
					
					var pngFs:FileStream = new FileStream();
					pngFs.open(pngFile, FileMode.WRITE);
					pngFs.writeBytes(ba, 0, ba.length);
					pngFs.close();
					
				}
			}
			
			this.finish();
		}
		
		private function add(param1:ByteArray) : void
		{
			var _loc2_:UIBitmapItem = new UIBitmapItem();
			_loc2_.scale = param1.readInt();
			_loc2_.quality = param1.readInt();
			_loc2_.left = param1.readInt();
			_loc2_.right = param1.readInt();
			_loc2_.up = param1.readInt();
			_loc2_.down = param1.readInt();
			_loc2_.name = param1.readUTF();
			rsDic[_loc2_.name] = _loc2_;
		}
		
		private var rsDic:Dictionary = new Dictionary();
		
		protected function onLoadComplete(event:Event):void
		{
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onLoadComplete);		
//			var instance:Object = new c();
			
			var vectors:Vector.<String> = appDomain.getQualifiedDefinitionNames();

			if (vectors.length == 0)
			{
				finish();
				return;
			}
			
			var targetKey:String = "";
			
			for each (var className:String in vectors)
			{
				for (var key:String in this.modelDic)
				{
					if (className.toLocaleLowerCase().indexOf(key.toLocaleLowerCase()) != -1)
					{
						targetKey = key;
						
						break;
					}
				}
				
				if (targetKey != "")
				{
					break;
				}
			}
			
			if (targetKey == "")
			{
				this.finish();
				
				return;
			}
			
			var skinInfo:Object = this.modelDic[targetKey];
			
			if (skinInfo == null)
			{
				this.finish();
				
				return;
			}
			
			var targetObj:Object = skinInfo[skinId];
			
			if (targetObj == null)
			{
				this.finish();
				
				return;
			}
			
			var actions:Object = targetObj.actions;
			
			for each (var actionObj:Object in actions)
			{
				var actionName:String = actionObj.actionName;
				
				if (targetActionName != actionName)
				{
					continue;
				}
				
				var frameNum:int = actionObj.frameNum;
				
				var frames:Object = actionObj.frames;
				
				var index:int = 1;
				
				var actionUrl:String = this.folderName;
				
				checkFolderAndCreate(actionUrl);
				
				var placementUrl:String = actionUrl + "Placements/";
				
				var placementFile:File = new File(placementUrl);
				
				if (!placementFile.exists)
				{
					placementFile.createDirectory();
				}
				
				//方向默认8
				for (var i:int = 0; i < 8; i++)
				{
					var oneFrameData:Array = frames[i];
					
					if (oneFrameData == null || oneFrameData.length == 0)
					{
						continue;
					}
					
					for each (var oneFrameObj:Object in oneFrameData)
					{
						var frameX:int = oneFrameObj.x;
						var frameY:int = oneFrameObj.y;
						
						var frameIndex:int = int(oneFrameObj.index)
							
						var linkageName:String = targetKey + "_" + skinId + "_" + actionName + "_" + frameIndex;
						
						var has:Boolean = appDomain.hasDefinition(linkageName);
						
						if (!has)
						{
							continue;
						}
						else
						{
							var c:Object = appDomain.getDefinition(linkageName);
							
							var pngData:BitmapData = new c() as BitmapData;
							
							var ba : ByteArray = PNGEncoder2.encode(pngData);
							
							var pngName:String = "000" + index.toString();
							
							if (index >= 10)
							{
								pngName = "00" + index.toString();
							}
							
							var pngFile:File = new File(actionUrl + pngName + ".png");
							
							var pngFs:FileStream = new FileStream();
							pngFs.open(pngFile, FileMode.WRITE);
							pngFs.writeBytes(ba, 0, ba.length);
							pngFs.close();
							
							var frameEndTime:int = flash.utils.getTimer();
							
							var txtUrl:String = placementUrl + pngName + ".txt";
							
							var txtData:String = frameX + "\r\n" +  frameY;
							
							var xmlFile:File = new File(txtUrl);
							
							var xmlFs:FileStream = new FileStream();
							xmlFs.open(xmlFile, FileMode.WRITE);
							xmlFs.writeUTFBytes(txtData);
							xmlFs.close();
							
							index++;
						}
						
					}
				}
			}
			
			finish();
		}
		
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
				callback(this);
				
				callback = null;
				
				modelDic = null;
			}
		}
		
		private function sortDir(dir1:int, dir2:int):int
		{
			var value1:int = DIR_VALUE[dir1];
			
			var value2:int = DIR_VALUE[dir2];
			
			if (value1 < value2)
			{
				return -1;
			}
			else if (value1 > value2)
			{
				return 1;
			}
			else
			{
				return 0;
			}
			
		}
		
		private const DIR_VALUE:Array = [4, 3, 2, 1, 0, 7, 6, 5];
		
		private function exportObjDataToXml(source:Object, targetXml:XML):XML
		{
			if (source == null)
			{
				return targetXml;
			}
			
			var sourceInfo:XML = flash.utils.describeType(source);
			var prop:XML;
			
			for each(prop in sourceInfo.variable)
			{
				var propertName:String = String(prop.@name);
				
				var propertyType:String = String(prop.@type).toLowerCase();
				
				var value:Object = source[propertName];
				
				if (value == null)
				{
					value = "";
				}
				
				if (propertyType == "boolean")
				{
					value = int(value);
				}
				
				targetXml.@[propertName] = String(value);
				
			}
			
			for each(prop in sourceInfo.accessor) {
				
				if(prop.@access == "readwrite") {
					
					var accessorName:String = String(prop.@name);
					
					var accessorType:String = String(prop.@type).toLowerCase();
					
					var accessValue:Object = source[accessorName];
					
					if (accessValue == null)
					{
						accessValue = "";
					}
					
					if (accessorType == "boolean")
					{
						accessValue = int(accessValue);
					}
					
					targetXml.@[accessorName] = String(accessValue);
					
				}
			}
			
			return targetXml;
		}
		
		private var appDomain:ApplicationDomain;
		
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