package subGame.nuhun
{
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
	
	import mx.graphics.codec.JPEGEncoder;

	public class Analyze
	{
		public function Analyze(folder:String, $callback:Function = null)
		{
			appDomain = new ApplicationDomain();
			
			callback = $callback;
			
			folderName = folder;
		}
		
		public var fileName:String;
		
		private var callback:Function;
		
		private var folderName:String;
		
		private var loader:Loader;
		
		private var images:Array = [];
		
		public function ana(ba:ByteArray, $foldName:String):void
		{
			folderName = $foldName;
			
			if (fileName.indexOf(".mp") != -1)
			{
				loadMp(ba);
				return;
			}
			var img:SingleImage = null;
			var bytes:ByteArray = ba;

			var key:String = bytes.readMultiByte(3,"utf-8");
			if(key != "YER")
			{
				bytes.position = 0;
			}
			var blendMode:String = bytes.readUTF();
			var length:int = bytes.readByte();
			var i:int = 0;
			while(i < length)
			{
				img = new SingleImage();
				img.offsetX = bytes.readShort();
				img.offsetY = bytes.readShort();
				img.delayTime = bytes.readInt();
				img.imageName = bytes.readUTF();
				i++;
				
				images.push(img);
			}
			
			var swf:ByteArray = new ByteArray();
			bytes.readBytes(swf);
			
			var context:LoaderContext = new LoaderContext(false, appDomain);
			context.allowCodeImport = true;
			
			if(swf.length > 10)
			{
				loader = new Loader();
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadComplete);
				try
				{
					loader.loadBytes(swf, context);
				}
				catch(e:Error)
				{
					trace("nuhunerror");
				}
			}
			else
			{
			}
			
/*			var vectors:Vector.<String> = appDomain.getQualifiedDefinitionNames();
			
			if (vectors.length == 0)
			{
				finish();
			}
			*/
	/*		loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadComplete);
			loader.loadBytes(ba, context);*/
		}
		
		private const jpegEncode:JPEGEncoder = new JPEGEncoder();
		
		private function loadMp(ba:ByteArray):void
		{
			ba.uncompress();
			
			var pngFile:File = new File(this.folderName + this.fileName.replace(".mp", ".jpg"));
			
			var pngFs:FileStream = new FileStream();
			pngFs.open(pngFile, FileMode.WRITE);
			pngFs.writeBytes(ba, 0, ba.length);
			pngFs.close();
			
			this.finish();
			return;
			var context:LoaderContext = new LoaderContext(false, appDomain);
			context.allowCodeImport = true;
			
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onMapLoadComplete);
			loader.loadBytes(ba, context);
		}
		
		protected function onMapLoadComplete(event:Event):void
		{
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onLoadComplete);	
			
			var pngFile:File = new File(this.folderName + this.fileName.replace(".mp", ".jpg"));
			
			var ba:ByteArray = event.target.data;
			var pngFs:FileStream = new FileStream();
			pngFs.open(pngFile, FileMode.WRITE);
			pngFs.writeBytes(ba, 0, ba.length);
			pngFs.close();
			
			this.finish();
		}
		
		protected function onLoadComplete(event:Event):void
		{
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onLoadComplete);		

			var vectors:Vector.<String> = appDomain.getQualifiedDefinitionNames();
			
			var actionUrl:String = this.folderName;
			
			checkFolderAndCreate(actionUrl);
			
			var placementUrl:String = actionUrl + "Placements/";
			
			var placementFile:File = new File(placementUrl);
			
			if (!placementFile.exists)
			{
				placementFile.createDirectory();
			}
			
			var index:int = 1;
			
			for (var i:int = 0; i < this.images.length; i++)
			{
				var lingageName:String = "a" + i;
				
				var has:Boolean = appDomain.hasDefinition(lingageName);
				
				if (!has)
				{
					continue;
				}
				else
				{
					var image:SingleImage = images[i];
					
					if (image == null)
					{
						continue;
					}
					
					var c:Object = appDomain.getDefinition(lingageName);
					
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
					
					var txtData:String = image.offsetX + "\r\n" +  image.offsetY;
					
					var xmlFile:File = new File(txtUrl);
					
					var xmlFs:FileStream = new FileStream();
					xmlFs.open(xmlFile, FileMode.WRITE);
					xmlFs.writeUTFBytes(txtData);
					xmlFs.close();
					
					index++;
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
				
				appDomain = null;
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