package subGame.jueshitangmeng
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
	import flash.utils.Endian;

	public class Analyze
	{
		public function Analyze(folder:String, $callback:Function = null)
		{
			appDomain = new ApplicationDomain();
			
			callback = $callback;
			
			folderName = folder;
		}
		
		private var startIndex:int;
		
		public var fileName:String;
		
		public var inputFileUrl:String;
		
		private var callback:Function;
		
		private var folderName:String;
		
		private var loader:Loader;
		
		private var images:Array = [];
		
		private var _globalScale:Number = 1;
		
		private var animatorObj:Object;
		
		private var _totalCount:int;
		
		private var _loadedCount:int;
		
		private var imgsArray:Array;
		
		public function ana(ba:ByteArray, $foldName:String, isGenerateAtf:Boolean = false):void
		{
			folderName = $foldName;
			
			var _dataBytes:ByteArray = ba;

			var key:String = _dataBytes.readMultiByte(3,"utf-8");

			var _DB:ByteArray = new ByteArray();
			
			_DB.writeBytes(_dataBytes,3,_dataBytes.length - 3);
			_DB.endian = Endian.LITTLE_ENDIAN;
			_DB.position = 0;
			
			try
			{
				_DB.uncompress();
			}
			catch(e:Error)
			{
				trace("don't uncompress");
			}
			
			var _fraInfo:Object = processBytes(_DB);
			
			_DB.clear();
			
			var texsObj:Object = _fraInfo.texs;
			
			var curFmt:String = texsObj.fmt;
			
			imgsArray = texsObj.imgs;
			
			var b:Boolean = (!(!curFmt || curFmt != "atf" && curFmt != "png"));
			if(!(!imgsArray || 0 == imgsArray.length))
			{
				var anisInfo:Object = _fraInfo.anis;
				
				if(anisInfo)
				{
					if(texsObj.scale)
					{
						this._globalScale = texsObj.scale as Number;
					}
					
					animatorObj = anisInfo;
					_totalCount = imgsArray.length;
					
					this._loadedCount = 0;

					if (isGenerateAtf)
					{
						var atf_index:int = 0;
						for each (var oneImageData:ByteArray in imgsArray)
						{
							if (curFmt == "atf")
							{
								analyzeAtf(oneImageData, atf_index);	
								
								atf_index++;
							}
							else if (curFmt == "png")
							{
		//						loadImageData();
								this.finish();
							}
						}
					}
					else
					{
						var loadBitmapData:Dictionary = new Dictionary();
						
						var fileNamePre:String = fileName.substring(0, fileName.indexOf("."));
						
						for (var aniKey:String in anisInfo)
						{
							if (aniKey.indexOf(fileNamePre) != -1)
							{
								var oneAniObj:Object = anisInfo[aniKey];
								
								if (oneAniObj == null)
								{
									continue;
								}
								
								var dirPngCreator:CreateOneDirPng = new CreateOneDirPng(this.inputFileUrl, folderName + aniKey + "/", finishedOneDirCallback, oneAniObj);
								
								decodeDirPngs.push(dirPngCreator);
							}
						}
						
						if (decodeDirPngs.length == 0)
						{
							this.finish();
							
							return;
						}
						
						for each (var pngCreator:CreateOneDirPng in decodeDirPngs)
						{
							pngCreator.run();
						}
					}
				}
			}

		}
		
		private function finishedOneDirCallback():void
		{
			finsihedOneDirCount++;
			
			if (finsihedOneDirCount == decodeDirPngs.length)
			{
				this.finish();
			}
		}
		
		private var finsihedOneDirCount:int = 0;
		
		private var decodeDirPngs:Array = [];
		
		protected function onBigPngLoadComplete(event:Event):void
		{
			bigPngFile.removeEventListener(Event.COMPLETE, onBigPngLoadComplete);
		
			var context:LoaderContext = new LoaderContext();
			context.allowCodeImport = true;
			
			bigPngLoader = new Loader();
			bigPngLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onBigPngByteLoadComplete);
			bigPngLoader.loadBytes(event.target.data);
		}
		
		protected function onBigPngByteLoadComplete(event:Event):void
		{
			// TODO Auto-generated method stub
			bigPngLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onBigPngByteLoadComplete);
			
			var bmda:BitmapData = event.target.content.bitmapData;
		}
		
		private var bigPngLoader:Loader;
		
		private var bigPngFile:File;
		private var dxt5Param:ByteArray;
		
//		private var textLoader:TextureLoader;
		
		private function analyzeAtf(param1:ByteArray, atf_index:int):void
		{
			dxt5Param =param1;
			
			var atfUrl:String = this.inputFileUrl.replace(".fra", "") + "_" + atf_index + ".atf";
			
			var atfFile:File = new File(atfUrl);
			
			var pngFs:FileStream = new FileStream();
			pngFs.open(atfFile, FileMode.WRITE);
			pngFs.writeBytes(param1, 0, param1.length);
			pngFs.close()
				
			this.finish();
			
			return;
		}
		
		private function loadImageData():void
		{
			if (imgsArray.length > 0)
			{
				curLoader = new Loader();
				curLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onPngLoadComplete);
				
				var bytes:ByteArray = imgsArray.shift();
				
				curLoader.loadBytes(bytes);
			}
		}
		
		private var index:int = 1;
		
		protected function onPngLoadComplete(event:Event):void
		{
			
		}
		
		private var curLoader:Loader;
		
		private var _loaderArray:Array;
		
		private function processBytes(param1:ByteArray) : *
		{
			var _loc5_:uint = 0;
			var _loc6_:uint = 0;
			var _loc7_:Boolean = false;
			var _loc8_:uint = 0;
			var _loc9_:uint = 0;
			var _loc10_:uint = 0;
			var _loc11_:int = 0;
			var _loc12_:uint = 0;
			var _loc13_:String = null;
			var _loc14_:Object = null;
			var _loc15_:ByteArray = null;
			var _loc2_:Object = null;
			if(param1.bytesAvailable < 1)
			{
				return _loc2_;
			}
			var _loc3_:uint = param1.readUnsignedByte();
			var _loc4_:uint = _loc3_ & 15;
			if(_loc4_ == 0)
			{
				_loc2_ = Boolean(_loc3_ & 16);
			}
			else if(_loc4_ == 1)
			{
				_loc7_ = Boolean(_loc3_ & 16);
				_loc8_ = _loc3_ >>> 5;
				if(_loc7_)
				{
					if(_loc8_ == 2)
					{
						_loc2_ = param1.readInt();
					}
					else if(_loc8_ == 1)
					{
						_loc2_ = param1.readShort();
					}
					else if(_loc8_ == 0)
					{
						_loc2_ = param1.readByte();
					}
					else if(_loc8_ == 3)
					{
						_loc2_ = param1.readUnsignedInt() + param1.readInt() * 4294967296;
					}
				}
				else if(_loc8_ == 2)
				{
					_loc2_ = param1.readUnsignedInt();
				}
				else if(_loc8_ == 1)
				{
					_loc2_ = param1.readUnsignedShort();
				}
				else if(_loc8_ == 0)
				{
					_loc2_ = param1.readUnsignedByte();
				}
				else if(_loc8_ == 3)
				{
					_loc2_ = param1.readUnsignedInt() + param1.readUnsignedInt() * 4294967296;
				}
			}
			else if(_loc4_ == 2)
			{
				_loc8_ = _loc3_ >>> 5;
				if(_loc8_ == 2)
				{
					_loc2_ = param1.readFloat();
				}
				else if(_loc8_ == 3)
				{
					_loc2_ = param1.readDouble();
				}
			}
			else if(_loc4_ == 3)
			{
				_loc5_ = param1.readUnsignedByte();
				_loc6_ = param1.readUnsignedShort();
				_loc9_ = (_loc6_ << 16 | _loc5_ << 8 | _loc3_) >>> 4;
				if(true)
				{
					_loc2_ = param1.readMultiByte(_loc9_,"utf-8");
				}
				else
				{
					_loc2_ = param1.readUTFBytes(_loc9_);
				}
			}
			else if(_loc4_ == 4)
			{
				_loc5_ = param1.readUnsignedByte();
				_loc6_ = param1.readUnsignedShort();
				_loc9_ = (_loc6_ << 16 | _loc5_ << 8 | _loc3_) >>> 4;
				_loc2_ = {};
				_loc12_ = 0;
				while(_loc12_ < _loc9_)
				{
					_loc10_ = param1.readUnsignedByte();
					_loc13_ = param1.readUTFBytes(_loc10_);
					_loc14_ = this.processBytes(param1);
					_loc2_[_loc13_] = _loc14_;
					_loc12_++;
				}
			}
			else if(_loc4_ == 5)
			{
				_loc5_ = param1.readUnsignedByte();
				_loc6_ = param1.readUnsignedShort();
				_loc9_ = (_loc6_ << 16 | _loc5_ << 8 | _loc3_) >>> 4;
				_loc2_ = [];
				_loc12_ = 0;
				while(_loc12_ < _loc9_)
				{
					_loc2_.push(this.processBytes(param1));
					_loc12_++;
				}
			}
			else if(_loc4_ == 6)
			{
				_loc5_ = param1.readUnsignedByte();
				_loc6_ = param1.readUnsignedShort();
				_loc9_ = (_loc6_ << 16 | _loc5_ << 8 | _loc3_) >>> 4;
				_loc15_ = new ByteArray();
				param1.readBytes(_loc15_,0,_loc9_);
				_loc2_ = _loc15_;
			}
			else if(_loc4_ == 7)
			{
				_loc5_ = param1.readUnsignedByte();
				_loc6_ = param1.readUnsignedShort();
				_loc9_ = (_loc6_ << 16 | _loc5_ << 8 | _loc3_) >>> 4;
				_loc2_ = [];
				_loc12_ = 0;
				while(_loc12_ < _loc9_)
				{
					_loc11_ = param1.readInt();
					_loc2_[_loc11_] = this.processBytes(param1);
					_loc12_++;
				}
			}
			
			return _loc2_;
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
				
				this.images.length = 0;
				this.images = null;
				
				loader = null;
				
				this.animatorObj = null;
				
				if (this.decodeDirPngs)
				{
					this.decodeDirPngs.length = 0;
					
					this.decodeDirPngs = null;
				}
			}
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