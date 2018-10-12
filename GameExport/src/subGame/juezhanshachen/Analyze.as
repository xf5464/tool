package subGame.juezhanshachen
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
	
	import subGame.juezhanshachen.animation.AnimationObj;

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
			
			var param2:ByteArray = ba;

			param2.position = 0;
			param2.endian = Endian.LITTLE_ENDIAN;
			
			var _loc4_:int;
			
			var _loc5_:String;
			
			var _loc6_:ByteArray;
			
			var dic:Dictionary = new Dictionary();
			
			while(param2.bytesAvailable > 0)
			{
				_loc4_ = param2.readInt();
				_loc5_ = param2.readUTFBytes(_loc4_);
				_loc4_ = param2.readUnsignedInt();
				_loc6_ = new ByteArray();
				param2.readBytes(_loc6_,0,_loc4_);
				if(dic[_loc5_] != null)
				{
					throw new Error("动画资源包资源重复keyname:" + _loc5_ + " url:");
				}

				dic[_loc5_] = _loc6_;
			}

			var param3:Dictionary = GlobalConsts.actionCopyMap;
			
			var _loc8_:Array = null;
			
			var _loc9_:String = null;
			
			var _loc10_:ByteArray = null;
			
			if(param3 != null)
			{
				for(var _loc7_:String in param3)
				{
					if(inputFileUrl.indexOf(_loc7_) != -1)
					{
						_loc8_ = param3[_loc7_];
						if(_loc8_.length >= 2)
						{
							_loc8_ = _loc8_.concat();
							_loc9_ = _loc8_[0];
							_loc8_.splice(0,1);
							_loc10_ = dic[_loc9_];
							for each(_loc5_ in _loc8_)
							{
								if(dic[_loc5_] == null)
								{
									_loc6_ = new ByteArray();
									_loc10_.readBytes(_loc6_,0,_loc10_.length);
									dic[_loc5_] = _loc6_;
								}
							}
							break;
						}
					}
				}
			}
			
			for (var key:String in dic)
			{
				try
				{
					var animationObj:AnimationObj = new AnimationObj();
					animationObj.parseSpr(dic[key], key, this.inputFileUrl, this.folderName);
				}
				catch(e:Error)
				{
					trace("parseSpr error:" + e.toString());
				}
			}
			
			this.finish();
		}
		
		private var index:int = 1;
		
		protected function onPngLoadComplete(event:Event):void
		{
			
		}
		
		private var curLoader:Loader;
		
		private var _loaderArray:Array;
		
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