package subGame.chiyue2
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.net.LocalConnection;
   import flash.net.registerClassAlias;
   import flash.system.System;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   
   import subGame.chiyue2.com.fio.display.loader.floader.FQueueLoader;
   import subGame.chiyue2.games.core.worker.RestoreBytesToFile;
   import subGame.chiyue2.games.display.Avatar.VtyAvatarActionInfo;
   import subGame.chiyue2.games.display.Avatar.VtyAvatarDataInfo;
   import subGame.chiyue2.games.display.Avatar.VtyAvatarFrameInfo;
   import subGame.chiyue2.games.globalCons.GConst;
   import subGame.chiyue2.games.globalCons.GOperation;
   import subGame.chiyue2.utils.MethodTool;
   
   public class _ResMgr
   {
      
      public static var mNullBitmapData:BitmapData;
       
      
      private const DEF_LINKAGE:String = "defaultAvatar";
      
      private const defaultP:Point = new Point();
      
      private const Gap_ClearBitmapData:int = 180000;
      
      private const Gap_ClearTexture:int = 60000;
      
      private const Gap_ClearLoader:int = 180000;
      
      private const LOADTYPE_FIRST:int = 0;
      
      private const LOADTYPE_SECOND:int = 1;
      
      private const LOADTYPE_THIRD:int = 2;
      
      const nofity:EventDispatcher = new EventDispatcher();
      
      private var xmls:Array;
      
      private var configs:Array;
      
      private var useLists:Array;
      
      public var assetBaseUrl:String = "";
      
      public var avatarUrl:String = "";
      
      public var version:String = "";
      
      private var loader:FQueueLoader;
      
      private var restorer:RestoreBytesToFile;
      
      private var loaded:Object;
      
      private var firstQueues:Array;
      
      private var currentQueues:Array;
      
      private var delayQueues:Array;
      
      private var urls:Array;
      
      private var errorUrls:Object;
      
      private var defaultAction:Array;
      
      private var offsets:Object;
      
      private var clearDic:Dictionary;
      
      private var rawConfig:Array;
      
      private var firstConfigDic:Dictionary;
      
      private var toBmpDoneDic:Dictionary;
      
      private var mIsClaer:Boolean;
      
      private const callbacks:Object = {};
      
      private var _newTime:Number;
      
      private var loopCacheList:Dictionary;
      
      private var preClearTimes:Number = 0;
      
      private var mResUrlDic:Dictionary;
      
      private var noFirstList:Array;
      
      private var mPreTestMemoryTimes:int;
      
      private var mCompleteCacheList:Array;
      
      private var isToBmp:Dictionary;
      
      private const mDirObj:Object = {
         1:7,
         2:6,
         3:5
      };
      
      private const mDirDown:Object = {
         7:1,
         6:2,
         5:3
      };
      
      private var mFlipTaskList:Array;
      
      private var flipHorizontalMatrix:Matrix;
      
      private var mMatrixRotate:Matrix;
      
      private var mPoint:Point;
      
      private var mColorMatrixFilter:ColorMatrixFilter;
      private static var _instance:_ResMgr;
      
      public function _ResMgr()
      {
         defaultAction = [];
         firstConfigDic = new Dictionary();
         toBmpDoneDic = new Dictionary();
         loopCacheList = new Dictionary();
         mResUrlDic = new Dictionary();
         noFirstList = GConst.MONSTER_SHABAK_CITYWALY;
         mCompleteCacheList = [];
         isToBmp = new Dictionary();
         mFlipTaskList = [];
         flipHorizontalMatrix = new Matrix();
         mMatrixRotate = new Matrix(1,0,0.5,0.5,0,0);
         mPoint = new Point(0,0);
         mColorMatrixFilter = new ColorMatrixFilter([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.5,0]);
         this.xmls = [];
         this.configs = [];
         this.useLists = [];
         super();
         this.restorer = new RestoreBytesToFile();
         loader = new FQueueLoader(2,3);
         this.loaded = {};
         this.firstQueues = [];
         this.currentQueues = [];
         this.delayQueues = [];
         this.errorUrls = {};
         this.urls = [];
         this.clearDic = new Dictionary();
         this.rawConfig = [];
         _newTime = getTimer();
		 
      }
	  
	  public function setStage(stage:Stage):void
	  {
		  stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
	  }
	  
	  private var lastGcTime:int;
	  
	  protected function onEnterFrame(event:Event):void
	  {
		  if (this.nowUrl == "")
		  {
			  return;
		  }
		  
		  var now:int = flash.utils.getTimer();
		  
		  if (now - startAnalyTime >= 2000)
		  {
			  trace("timeout:" + this.nowUrl);
			  triggleFatalERROR(this.nowUrl);
			  
			  this.nowUrl = "";
		  }
		  
		  var k:int = System.totalMemory>>10;
		  
		  if (now - lastGcTime >= 60000)
		  {
			  System.gc();
			  System.gc();
			  
			  try {
				  new LocalConnection().connect('foo');
				  new LocalConnection().connect('foo');
			  } catch (e:*) {}
			  
			  lastGcTime = now;
			  
			  trace("gc " + lastGcTime + " nowMemory:" + System.totalMemory/1024);
		  }
	  }
	  
	  private const LIMIT_MEMORY:int =  800*1024;
	  
	  public static function get instance():_ResMgr
	  {
		  if (_instance == null)
		  {
			  _instance = new _ResMgr();
		  }
		  
		  return _instance;
			  
	  }
      
      final function regist(param1:String, param2:Function) : void
      {
         var _loc3_:Dictionary = callbacks[param1];
         if(null == _loc3_)
         {
            _loc3_ = new Dictionary();
            callbacks[param1] = _loc3_;
         }
         _loc3_[param2] = 1;
      }
      
      final function remove(param1:String, param2:Function) : void
      {
         var _loc3_:Dictionary = callbacks[param1];
         if(null != _loc3_)
         {
            delete _loc3_[param2];
         }
      }
      
      private function clearLoader() : void
      {
         mIsClaer = true;
      }
      
      public function showRes() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = useLists;
         for(var _loc1_ in useLists)
         {
         }
         var _loc5_:int = 0;
         var _loc4_:* = configs;
         for(_loc1_ in configs)
         {
         }
         var _loc7_:int = 0;
         var _loc6_:* = GConst.GItem;
         for(_loc1_ in GConst.GItem)
         {
         }
      }
      
      private function get avatarBaseUrl() : String
      {
         if(GConst.DEBUG)
         {
            return "resources/NResource/";
         }
         return assetBaseUrl + avatarUrl;
      }
      
      public function finishingMemory() : void
      {
         this.restorer.clear();
      }
      
      final function setConfig(param1:Array) : void
      {
         this.rawConfig = param1;
      }
      
      final function getActionData(param1:String, param2:String, param3:Boolean = false, param4:Boolean = true) : VtyAvatarDataInfo
      {
         var _loc5_:* = null;
         var _loc6_:String = param1.toLowerCase() + "_" + param2;
         this.removeClearTag(_loc6_);
         var _loc7_:VtyAvatarDataInfo = this.configs[_loc6_];
         if(null != _loc7_)
         {
            if(param4)
            {
               this.useLists[_loc6_] = int(this.useLists[_loc6_]) + 1;
            }
            return _loc7_;
         }
         _loc5_ = this.rawConfig[_loc6_];
         if(null != _loc5_)
         {
            _loc7_ = _loc5_ as VtyAvatarDataInfo;
            if(param4)
            {
               this.useLists[_loc6_] = 1;
               this.configs[_loc6_] = _loc7_;
            }
         }
         if(null == _loc7_ && param3)
         {
            _loc7_ = this.defaultAction["0"];
         }
         return _loc7_;
      }
      
      final function getDefAction(param1:String, param2:String = "0", param3:String = "") : VtyAvatarActionInfo
      {
         if(param1 == "avatar")
         {
            param2 = getDefaultStyle(param2);
         }
         else
         {
            param2 = "0";
         }
         return this.defaultAction[param2].actions[param3];
      }
      
      public final function initDefault(param1:String) : void
      {
         var _loc2_:* = null;
         this.defaultAction[param1] = this.getActionData("avatar",param1,true);
         this.offsets = {};
/*         if(null != VtyAvatarManager.offsetConfig)
         {
            var _loc4_:int = 0;
            var _loc3_:* = VtyAvatarManager.offsetConfig.children();
            for each(_loc2_ in VtyAvatarManager.offsetConfig.children())
            {
               this.offsets[_loc2_.name()] = this.getPoints(_loc2_.@v);
            }
         }*/
      }
      
      public final function initDefaultResource(param1:String) : void
      {
/*         url = param1;
         loaded = function(param1:BitmapData):void
         {
            if(param1 == null)
            {
               return;
            }
            var _loc2_:* = param1.clone();
            defaultAvatarFrameInfo.bitmapData = _loc2_;
            mNullBitmapData = _loc2_;
            param1.dispose();
         };
         defaultAvatarFrameInfo = new VtyAvatarFrameInfo();
         defaultAvatarFrameInfo.x = -21;
         defaultAvatarFrameInfo.y = -91;
         App.mloader.loadBMD(url,1,new Handler(loaded));*/
      }
      
      public function initDefaultShadowResource(param1:String) : void
      {
/*         url = param1;
         loadshadowed = function(param1:BitmapData):void
         {
            var _loc4_:* = null;
            var _loc2_:* = null;
            var _loc3_:* = null;
            if(param1 == null)
            {
               return;
            }
            shadowAvatarFrameInfo.bitmapData = param1.clone();
            param1.dispose();
            var _loc5_:VtyAvatarDataInfo = rawConfig["avatar_6"];
            if(_loc5_ == null)
            {
               return;
            }
            var _loc11_:int = 0;
            var _loc10_:* = _loc5_.actions;
            for each(_loc4_ in _loc5_.actions)
            {
               var _loc9_:int = 0;
               var _loc8_:* = _loc4_.frames;
               for each(_loc2_ in _loc4_.frames)
               {
                  var _loc7_:int = 0;
                  var _loc6_:* = _loc2_;
                  for each(_loc3_ in _loc2_)
                  {
                     _loc3_.bitmapData = shadowAvatarFrameInfo.bitmapData;
                     _loc3_.x = -35;
                     _loc3_.y = -35;
                  }
               }
            }*/
      /*   };
         loadshadowed2 = function(param1:BitmapData):void
         {
            var _loc4_:* = null;
            var _loc2_:* = null;
            var _loc3_:* = null;
            if(param1 == null)
            {
               return;
            }
            shadowHorseFrameInfo.bitmapData = param1.clone();
            param1.dispose();
            var _loc5_:VtyAvatarDataInfo = rawConfig["avatar_7"];
            if(_loc5_ == null)
            {
               return;
            }
            var _loc11_:int = 0;
            var _loc10_:* = _loc5_.actions;
            for each(_loc4_ in _loc5_.actions)
            {
               var _loc9_:int = 0;
               var _loc8_:* = _loc4_.frames;
               for each(_loc2_ in _loc4_.frames)
               {
                  var _loc7_:int = 0;
                  var _loc6_:* = _loc2_;
                  for each(_loc3_ in _loc2_)
                  {
                     _loc3_.bitmapData = shadowHorseFrameInfo.bitmapData;
                     _loc3_.x = -55;
                     _loc3_.y = -35;
                  }
               }
            }
         };
         shadowAvatarFrameInfo = new VtyAvatarFrameInfo();
         App.mloader.loadBMD(url,1,new Handler(loadshadowed));
         shadowHorseFrameInfo = new VtyAvatarFrameInfo();*/
        // App.mloader.loadBMD(WebParamInfo.getInfo().assetsUrl + "shadow2.png",1,new Handler(loadshadowed2));
      }
      
      private final function getPoints(param1:String) : Array
      {
         var _loc5_:int = 0;
         var _loc2_:Array = String(param1).split(",");
         var _loc3_:* = _loc2_.length >> 1;
         var _loc4_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_[_loc5_] = new Point(int(_loc2_[2 * _loc5_]),int(_loc2_[2 * _loc5_ + 1]));
            _loc5_++;
         }
         return _loc4_;
      }
      
      final function delLoadResource(param1:String, param2:String, param3:String) : void
      {
         if(null == param1 || param1.length == 0)
         {
            return;
         }
         this.destoryConfig(param1,param2);
      }
      
      final function setLoopCache(param1:String, param2:String) : void
      {
         loopCacheList[param1 + "_" + param2] = 1;
      }
      
      final function checkLoopCache(param1:String, param2:String) : Boolean
      {
         return loopCacheList[param1 + "_" + param2] > 0;
      }
      
      private final function destoryConfig(param1:String, param2:String) : void
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param2 == "3" || param2 == "4" || param2 == "1" || param2 == "2" || param2 == "0" || param2 == "6" || param2 == "7")
         {
            return;
         }
         if(checkLoopCache(param1,param2))
         {
            return;
         }
         param1 = param1.toLowerCase();
         var _loc7_:String = param1 + "_" + param2;
         var _loc8_:VtyAvatarDataInfo = this.configs[_loc7_];
         if(null != _loc8_)
         {
            _loc5_ = this.useLists[_loc7_];
            _loc5_ = _loc5_ - 1;
            this.useLists[_loc7_] = _loc5_;
            if(_loc5_ < 1)
            {
               this.delResUrl(param1 + "/" + param2);
               this.addClearTag(_loc7_);
               delete this.useLists[_loc7_];
            }
         }
      }
      
      final function clearBitmapData(param1:Boolean = false) : void
      {
         var _loc11_:* = false;
         var _loc7_:* = false;
         var _loc4_:Boolean = false;
         var _loc9_:* = null;
         var _loc15_:* = null;
         var _loc6_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc10_:int = 0;
         var _loc12_:int = getTimer();
         var _loc13_:* = 180000;
         var _loc8_:int = 60000;
         var _loc2_:Date = new Date();
         if(param1)
         {
            _loc13_ = _loc13_ >> 2;
         }
         if(_loc12_ - mPreTestMemoryTimes > 5000)
         {
            mPreTestMemoryTimes = _loc12_;
            GConst.myMemory = Number((System.totalMemory * 9.54e-7).toFixed(3));
         }
         var _loc23_:int = 0;
         var _loc22_:* = clearDic;
         for(var _loc14_ in clearDic)
         {
            _loc9_ = clearDic[_loc14_];
            _loc11_ = _loc12_ - _loc9_.time > _loc13_;
            _loc7_ = _loc12_ - _loc9_.time > _loc8_;
            if(_loc4_)
            {
               _loc11_ = true;
               _loc7_ = true;
            }
            if(!(_loc11_ == false && _loc7_ == false && param1 == false))
            {
               if(!(_loc7_ && _loc9_.isClearTexture && _loc11_ == false))
               {
                  _loc9_.isClearTexture = true;
                  if(_loc11_)
                  {
                     this.removeClearTag(_loc14_);
                  }
                  _loc15_ = this.configs[_loc14_];
                  if(_loc11_)
                  {
                     this.configs[_loc14_] = null;
                  }
                  if(null != _loc15_.actions)
                  {
                     var _loc21_:int = 0;
                     var _loc20_:* = _loc15_.actions;
                     for each(_loc6_ in _loc15_.actions)
                     {
                        _loc10_ = 0;
                        var _loc19_:int = 0;
                        var _loc18_:* = _loc6_.frames;
                        for each(_loc3_ in _loc6_.frames)
                        {
                           var _loc17_:int = 0;
                           var _loc16_:* = _loc3_;
                           for each(_loc5_ in _loc3_)
                           {
                              if(_loc11_)
                              {
                                 _loc5_.destory();
                              }
                           }
                           if(true && _loc11_)
                           {
                              _loc10_++;
                              destroyLoader2(_loc14_ + "_" + _loc6_.actionName + "_" + _loc10_);
                           }
                        }
                        if(false && _loc11_)
                        {
                           destroyLoader(_loc14_ + "_" + _loc6_.actionName);
                        }
                     }
                     if(_loc11_)
                     {
                        delete this.configs[_loc14_];
                        delFirstConfig(_loc14_);
                     }
                  }
               }
            }
         }
         if(_loc12_ - preClearTimes > 180000)
         {
            preClearTimes = _loc12_;
         }
      }
      
      final function addClearTag(param1:String) : void
      {
         clearDic[param1] = {"time":getTimer()};
      }
      
      final function removeClearTag(param1:String) : void
      {
      }
      
      final function destroyLoader2(param1:String) : void
      {
         var _loc4_:* = null;
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         if(this.loaded[param1] is Array)
         {
            _loc4_ = this.loaded[param1];
            if(null != _loc4_)
            {
               _loc2_ = _loc4_.length;
               _loc3_ = 0;
               while(_loc3_ < _loc2_)
               {
                  delLoaderFrame2(param1,_loc3_);
                  _loc3_++;
               }
               this.loaded[param1] = null;
            }
            _loc4_ = null;
            delete this.toBmpDoneDic[param1];
            delete this.loaded[param1];
            delete this.isToBmp[param1];
         }
      }
      
      final function destroyLoader(param1:String) : void
      {
         var _loc3_:int = 0;
         var _loc7_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc6_:Array = this.loaded[param1];
         if(null != _loc6_)
         {
            _loc7_ = _loc6_.length;
            _loc3_ = 0;
            while(_loc3_ < _loc7_)
            {
               _loc2_ = this.loaded[param1][_loc3_];
               _loc5_ = _loc2_.length;
               _loc4_ = 0;
               while(_loc4_ < _loc5_)
               {
                  delLoaderFrame(param1,_loc3_,_loc4_);
                  _loc4_++;
               }
               this.loaded[param1][_loc3_] = null;
               _loc2_ = null;
               _loc3_++;
            }
         }
         _loc6_ = null;
         delete this.toBmpDoneDic[param1];
         delete this.loaded[param1];
      }
      
      final function delLoaderFrame(param1:String, param2:int, param3:int) : void
      {
         var _loc4_:ByteArray = this.loaded[param1][param2][param3];
         if(_loc4_)
         {
            _loc4_.length = 0;
         }
         this.loaded[param1][param2][param3] = null;
      }
      
      final function delLoaderFrame2(param1:String, param2:int) : void
      {
         if(loaded.hasOwnProperty(param1) == false || loaded[param1].hasOwnProperty(param2) == false)
         {
            return;
         }
         var _loc3_:ByteArray = this.loaded[param1][param2];
         if(_loc3_)
         {
            _loc3_.length = 0;
         }
         this.loaded[param1][param2] = null;
         return;
      }
      
      public function addResUrl(param1:String, param2:String) : void
      {
         var _loc3_:Object = mResUrlDic[param1];
         if(null == _loc3_)
         {
            _loc3_ = {};
            mResUrlDic[param1] = _loc3_;
         }
         if(1 == _loc3_[param2])
         {
            return;
         }
         _loc3_[param2] = 1;
      }
      
      public function delResUrl(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc2_:Object = mResUrlDic[param1];
         if(_loc2_ == null)
         {
            return;
         }
         var _loc5_:int = 0;
         var _loc4_:* = _loc2_;
         for(_loc3_ in _loc2_)
         {
            delLoad(_loc3_);
         }
         mResUrlDic[param1] = null;
         return;
      }
      
      final function loadResourceByteArray(type:String, avardId:String, actionName:String, dir:int = 0) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(GConst.AUTOROBOT)
         {
            return;
         }
         if(type == "avatar" && this.checkIsMonsterResID(int(avardId)) && this.mDirDown[dir] > 0)
         {
            dir = this.mDirDown[dir];
         }
         type = type.toLowerCase();
         _loc5_ = type + "_" + avardId + "_" + actionName + "_" + dir;
         if(false == this.hasRes(_loc5_))
         {
            if(type == "skill")
            {
               _loc7_ = this.rawConfig[type + "_" + avardId];
               if(_loc7_ && _loc7_.mirrorID == 0 && int(_loc7_.copySource) > 0)
               {
                  avardId = _loc7_.copySource;
                  _loc5_ = type + "_" + avardId + "_" + actionName + "_" + dir;
               }
            }
            if(rawConfig[type + "_" + avardId] || avardId == "1" || avardId == "2" || avardId == "11" || avardId == "22")
            {
               if((avardId == "1" || avardId == "2") && type == "avatarback")
               {
                  return;
               }
               _loc6_ = type + "/" + avardId + "/" + actionName + "_" + dir + ".res";
               this.addResUrl(type + "/" + avardId,_loc6_);
               if(avardId == "1" || avardId == "2" || avardId == "11" || avardId == "22" || avardId == "36")
               {
                  this.load(_loc6_,_loc5_,0);
               }
               else if(type == "avatar" || type == "hair" || type == "horse")
               {
                  this.load(_loc6_,_loc5_,1);
               }
               else
               {
                  this.load(_loc6_,_loc5_,2);
               }
            }
         }
      }
      
      private function isLoadFirst(param1:String, param2:String) : Boolean
      {
         if(param1 == "avatar" && this.checkIsMonsterResID(int(param2)) || param1 == "avatarui")
         {
            if(noFirstList.indexOf(int(param2)) != -1 || int(param2) == 35108)
            {
               return false;
            }
            return true;
         }
         return false;
      }
      
      private final function delLoad(param1:String) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Object = this.urls[param1];
         if(null != _loc3_)
         {
            loader.delLoad(this.avatarBaseUrl + param1);
            delete this.urls[param1];
            _loc2_ = this.delayQueues.indexOf(param1);
            if(_loc2_ > -1)
            {
               this.delayQueues.splice(_loc2_,1);
            }
            _loc2_ = this.currentQueues.indexOf(param1);
            if(_loc2_ > -1)
            {
               this.currentQueues.splice(_loc2_,1);
            }
         }
      }
      
      public final function load(param1:String, param2:String, param3:int = 1) : void
      {
         var _loc4_:int = 0;
         if(this.hasRes(param2))
         {
            return;
         }
         if(null != this.urls[param1])
         {
            this.urls[param1].c = this.urls[param1].c + 1;
            if(this.urls[param1].w == 2 && param3 == 1)
            {
               this.urls[param1].w = 1;
               _loc4_ = this.delayQueues.indexOf(param1);
               if(_loc4_ >= -1)
               {
                  this.delayQueues.splice(_loc4_,1);
                  this.currentQueues[this.currentQueues.length] = param1;
               }
            }
         }
         else
         {
            if(1 == this.errorUrls[param1])
            {
               return;
            }
            this.urls[param1] = {
               "c":1,
               "k":param2,
               "w":param3
            };
            if(param3 == 0)
            {
               this.firstQueues[this.firstQueues.length] = param1;
            }
            else if(param3 == 1)
            {
               this.currentQueues[this.currentQueues.length] = param1;
            }
            else
            {
               this.delayQueues[this.delayQueues.length] = param1;
            }
         }
      }
      
      private final function checkQueue() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(mIsClaer)
         {
            mIsClaer = false;
         }
         var _loc1_:int = 0;
         _loc2_ = this.delayQueues;
         if(this.delayQueues.length > 0 || this.currentQueues.length > 0 || this.firstQueues.length > 0)
         {
            if(this.currentQueues.length > 0)
            {
               _loc2_ = this.currentQueues;
            }
            if(this.firstQueues.length > 0)
            {
               _loc2_ = this.firstQueues;
               _loc1_ = 1;
            }
            _loc3_ = _loc2_.shift();
            if(_loc1_)
            {
               loader.load(this.avatarBaseUrl + _loc3_ + "?v=7",_loc3_,false,false,this.onComplete);
            }
            else
            {
//               loader.load(this.avatarBaseUrl + _loc3_ + "?v=" + UrlManager.getRevision(_loc3_,"avatar"),_loc3_,false,false,this.onComplete);
            }
            if(null == this.avatarBaseUrl || 0 == this.avatarBaseUrl.length)
            {
               trace("[WARING] AvatarManager未调用setRootUrl方法设置资源根目录！");
            }
         }
      }
      
      private final function resetUrl(param1:String, param2:Object = null) : void
      {
         if(null != param2)
         {
            this.errorUrls[param1] = 1;
         }
         if(null != param1)
         {
            delete this.urls[param1];
         }
      }
      
      private final function onComplete(param1:ByteArray, param2:String) : void
      {
         var url:* = null;
         if(param1 != null && param2 && param1.bytesAvailable > 0)
         {
            try
            {
               url = this.urls[param2].k;
               param1.position = 0;
               this.restoreDone(param1.readObject(),url);
               param1.position = 0;
               param1.clear();
               param1 = null;
            }
            catch(error:Error)
            {
               param1.clear();
            }
         }
         this.resetUrl(param2);
      }
      
      private function onMakeBitmap() : void
      {
         var _loc1_:* = null;
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc5_:* = null;
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < 3)
         {
            _loc1_ = this.mCompleteCacheList.shift();
            if(this.mCompleteCacheList.length == 0)
            {
               return;
            }
            _loc4_ = _loc1_[0];
            _loc2_ = _loc1_[1];
            if(_loc2_ != null && _loc4_ && _loc2_.bytesAvailable > 0)
            {
               try
               {
                  _loc5_ = this.urls[_loc4_].k;
                  _loc2_.position = 0;
                  this.restoreDone(_loc2_.readObject(),_loc5_);
                  _loc2_.position = 0;
                  _loc2_ = null;
               }
               catch(error:Error)
               {
                  trace("onComplete",_loc2_.bytesAvailable,_loc4_);
                  _loc2_.clear();
               }
            }
            this.resetUrl(_loc4_);
            _loc3_++;
         }
      }
	  
      public final function restoreDone(param1:Object, url:String) : void
      {
         var _loc3_:Array = url.split("_");
		 
		 this.nowUrl = url;
		 
		 this.startAnalyTime = flash.utils.getTimer();

		 if(this.loaded[url] == null)
         {
            this.loaded[url] = param1;
         }
         if(_loc3_[2] != "first")
         {
            saveByteArrayBitmapData2(url);
         }
         else
         {
            initFirstResource(_loc3_[0],_loc3_[1],param1);
         }
		 
      }
	  
	  private var nowUrl:String = "";
	  
	  private var startAnalyTime:int;
      
      private function initFirstResource(param1:String, param2:String, param3:Object) : void
      {
         var _loc6_:int = 0;
         var _loc9_:* = null;
         var _loc5_:* = null;
         var _loc4_:int = 0;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc8_:String = param1 + "_" + param2;
         _loc5_ = getRawConfigFirstInfo(_loc8_);
         if(_loc5_ == null)
         {
            return;
         }
         var _loc7_:Object = {
            1:7,
            2:6,
            3:5
         };
         _loc6_ = 0;
		 
		 var index:int = 0;
		 
         while(_loc6_ < 8)
         {
            _loc9_ = param3[_loc6_];
            _loc4_ = _loc7_[_loc6_];
            _loc10_ = _loc5_[_loc6_];
            _loc11_ = null;
            if(_loc4_ > 0)
            {
               _loc11_ = _loc5_[_loc4_];
            }
            if(_loc9_ == null)
            {
               return;
            }
			
            this.restorer.restore(_loc9_,baRestoreDone2,false,true,[_loc10_,_loc11_,[_loc8_,"first", index]]);
            _loc9_ = null;
            _loc11_ = null;
            _loc6_++;
			
			index++;
         }
      }
      
      private function delFirstConfig(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc5_:* = null;
         var _loc4_:Array = this.firstConfigDic[param1];
         if(_loc4_)
         {
            var _loc7_:int = 0;
            var _loc6_:* = _loc4_;
            for each(_loc2_ in _loc4_)
            {
               _loc2_.destory();
            }
            delete this.firstConfigDic[param1];
         }
         var _loc3_:Object = this.loaded[param1 + "_first"];
         if(_loc3_ != null)
         {
            var _loc9_:int = 0;
            var _loc8_:* = _loc3_;
            for each(_loc5_ in _loc3_)
            {
            }
            delete this.loaded[param1 + "_first"];
         }
      }
      
      function getRawConfigFirstInfo(param1:String) : Array
      {
         var _loc3_:int = 0;
         var _loc5_:Array = this.firstConfigDic[param1];
         var _loc6_:Array = param1.split("_");
         var _loc4_:* = 0;
         var _loc2_:int = param1.indexOf("avatarui") == -1?8:1;
         if(_loc5_ == null)
         {
            _loc5_ = [];
            if(this.rawConfig[param1] != null)
            {
               while(_loc3_ < _loc2_)
               {
                  _loc4_ = _loc3_;
                  _loc5_.push(CloneUtil.deepClone(this.rawConfig[param1]["actions"]["idle"]["frames"][_loc4_][0]));
                  _loc3_++;
               }
            }
            else
            {
               trace("errorFist",param1);
            }
            this.firstConfigDic[param1] = _loc5_;
         }
         return _loc5_;
      }
      
      final function getDefaultAvatarFrameInfo(param1:String, param2:String, param3:String, param4:int, param5:int) : VtyAvatarFrameInfo
      {
         var _loc7_:* = null;
         var _loc6_:* = null;
         var _loc8_:* = param1;
         if("avatarui" !== _loc8_)
         {
            if("avatar" !== _loc8_)
            {
               if("npc" !== _loc8_)
               {
                  if("horse" === _loc8_)
                  {
                  }
               }
               else
               {
               }
            }
            return _loc7_;
         }
         if(isLoadFirst(param1,param2))
         {
            _loc6_ = getRawConfigFirstInfo(param1 + "_" + param2);
            if(_loc6_)
            {
               _loc7_ = _loc6_[param4];
            }
            if("avatarui" == param1)
            {
               if(_loc7_ == null || _loc7_.bitmapData == null)
               {
                  if(checkIsMonsterResID(int(param2)) == false)
                  {
                     if(int(param2) > 21100)
                     {
                        _loc6_ = getRawConfigFirstInfo(param1 + "_" + 22);
                     }
                     else
                     {
                        _loc6_ = getRawConfigFirstInfo(param1 + "_" + 11);
                     }
                     if(_loc6_)
                     {
                        _loc7_ = _loc6_[param4];
                     }
                  }
               }
            }
         }
         else
         {
            param2 = getDefaultStyle(param2);
            if(param2 != "0")
            {
               _loc7_ = this.configs[param1 + "_" + param2]["actions"][param3]["frames"][param4][param5];
            }
         }
         if(_loc7_ == null || _loc7_.bitmapData == null)
         {
         }
		 
		 return _loc7_;
      }
	  
      
      private function getDefaultStyle(param1:String) : String
      {
         var _loc2_:* = param1.slice(0,3);
         if("210" !== _loc2_)
         {
            if("212" !== _loc2_)
            {
               if("211" !== _loc2_)
               {
                  if("213" !== _loc2_)
                  {
                     param1 = "0";
                  }
               }
               param1 = "2";
            }
            addr38:
            return param1;
         }
         param1 = "1";
		 
		 return param1;
      }
      
      final function saveByteArrayBitmapData(param1:String) : void
      {
         var _loc5_:* = null;
         var _loc13_:* = null;
         var _loc11_:* = null;
         var _loc8_:* = null;
         var _loc10_:int = 0;
         var _loc12_:* = null;
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         var _loc6_:int = 0;
         var _loc14_:* = null;
         var _loc4_:int = 0;
         var _loc15_:* = null;
         var _loc9_:* = null;
         var _loc7_:Array = param1.split("_");
         _loc11_ = this.rawConfig[_loc7_[0] + "_" + _loc7_[1]];
         if(_loc11_ == null)
         {
            return;
         }
         _loc11_ = _loc11_["actions"][_loc7_[2]]["frames"];
         if(_loc11_ == null)
         {
            return;
         }
         if(isToBmp[param1])
         {
            return;
         }
         if(this.hasRes(param1))
         {
            isToBmp[param1] = 1;
            _loc8_ = this.loaded[param1];
            _loc9_ = param1.split("_");
            _loc10_ = _loc8_.length;
            if(_loc10_ == 8 && _loc9_[0] == "avatar" && _loc9_[1] >= 30000)
            {
               _loc10_ = 5;
            }
            _loc2_ = 0;
            while(_loc2_ < _loc10_)
            {
               _loc12_ = this.loaded[param1][_loc2_];
               _loc3_ = _loc12_.length;
               _loc6_ = 0;
               while(_loc6_ < _loc3_)
               {
                  _loc13_ = _loc11_[_loc2_][_loc3_ - _loc6_ - 1];
                  _loc4_ = mDirObj[_loc2_];
                  if(_loc10_ == 5 && _loc4_ > 0)
                  {
                     _loc15_ = _loc11_[_loc4_][_loc3_ - _loc6_ - 1];
                  }
                  _loc14_ = this.loaded[param1][_loc2_][_loc3_ - _loc6_ - 1];
                  this.restorer.restore(_loc14_,baRestoreDone,false,true,[_loc13_,_loc15_,[param1,_loc2_,_loc3_ - _loc6_ - 1]]);
                  _loc14_ = null;
                  _loc15_ = null;
                  _loc6_++;
               }
               _loc12_ = null;
               _loc2_++;
            }
            _loc8_ = null;
         }
      }
	  
	  private function errorCallback(url:String):void
	  {
		  var callback:Function =  callbackDic[url];
		  
		  if (callback != null)
		  {
			  callback(url, null, 0, 0);
		  }
	  }
      
	  /**
	  * url "avardar" + "_" + id + "_" + ActionName + "_" + "dir"
	  *
 	  */
      public function saveByteArrayBitmapData2(url:String) : void
      {
         var _loc5_:* = null;
         var _loc18_:* = null;
         var _loc15_:Object= null;
         var _loc9_:* = null;
         var _loc13_:int = 0;
         var _loc17_:* = null;
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         var _loc6_:int = 0;
         var _loc19_:* = null;
         var _loc4_:int = 0;
         var _loc20_:* = null;
         var urlSplitData:* = null;
         var copySource:* = null;
         var _loc11_:* = null;
         var _loc10_:* = null;
         var _loc7_:Array = url.split("_");
         var mirrorDirMap:Object = {
            1:7,
            2:6,
            3:5
         };
         _loc15_ = this.rawConfig[_loc7_[0] + "_" + _loc7_[1]];
         if(_loc15_ == null)
         {
			 triggleFatalERROR(url);
            return;
         }
         else
         {
            if(_loc15_["actions"][_loc7_[2]] == null)
            {
				triggleFatalERROR(url);
               return;
            }
            _loc15_ = _loc15_["actions"][_loc7_[2]]["frames"];
            if(_loc15_ == null)
            {
				triggleFatalERROR(url);
               return;
            }
            if(isToBmp[url])
            {
//               return;
            }
            if(this.hasRes(url))
            {
               _loc9_ = this.loaded[url] as Array;
               urlSplitData = url.split("_");
               if(urlSplitData[0] == "avatar" && urlSplitData[1] >= 30000)
               {
                  _loc13_ = 5;
               }
               isToBmp[url] = 1;
               copySource = VtyAvatarDataInfo(this.rawConfig[urlSplitData[0] + "_" + urlSplitData[1]]).copySource;
               if(int(copySource) > 0)
               {
                  urlSplitData[1] = copySource;
                  if(mirrorDirMap.hasOwnProperty(urlSplitData[3]))
                  {
                     urlSplitData[3] = mirrorDirMap[urlSplitData[3]];
                  }
                  _loc11_ = urlSplitData[0] + "_" + copySource + "_" + urlSplitData[2] + "_" + urlSplitData[3];
                  isToBmp[_loc11_] = 1;
                  _loc10_ = this.rawConfig[urlSplitData[0] + "_" + copySource];
                  if(_loc10_ == null)
                  {
					  triggleFatalERROR(url);
                     return;
                  }
                  if(_loc10_["actions"][urlSplitData[2]] == null)
                  {
					  triggleFatalERROR(url);
                     return;
                  }
                  _loc10_ = _loc10_["actions"][urlSplitData[2]]["frames"];
               }
               _loc17_ = this.loaded[url];
               _loc3_ = 1;
               var _loc22_:int = 0;
               var _loc21_:* = _loc17_;
               for each(var _loc14_ in _loc17_)
               {
                  _loc3_++;
               }
               _loc6_ = 0;
               while(_loc6_ < _loc3_)
               {
				   if (!_loc15_.hasOwnProperty(_loc7_[3]))
				   {
					   triggleFatalERROR(url);
					   
					   return;
				   }
				   
                  _loc18_ = _loc15_[_loc7_[3]][_loc3_ - _loc6_ - 1] as VtyAvatarFrameInfo;
                  _loc4_ = mirrorDirMap[_loc7_[3]];
				  
                  if(_loc13_ == 5 && _loc4_ > 0)
                  {
                     _loc20_ = _loc15_[_loc4_][_loc3_ - _loc6_ - 1];
                     _loc11_ = url.slice(0,url.length - 1) + _loc4_;
                  }
                  if(_loc10_)
                  {
                     _loc20_ = _loc10_[0][_loc3_ - _loc6_ - 1];
                  }
                  _loc19_ = this.loaded[url][_loc3_ - _loc6_ - 1];
				  
/*				  if (_loc18_ == null && _loc20_ == null)
				  {
					  errorCallback(url);
					  
					  return;
				  }*/
				  
                  if(_loc19_ != null)
                  {
                     this.restorer.restore(_loc19_,baRestoreDone2,false,true,[_loc18_,_loc20_,[url,_loc3_ - _loc6_ - 1,url,_loc11_]], analyzeErrorCallback, [url,_loc3_ - _loc6_ - 1,url,_loc11_]);
                  }
                  _loc19_ = null;
                  _loc20_ = null;
                  _loc6_++;
               }
               _loc17_ = null;
            }
            return;
         }
      }
	  
      
	  public function addGenerateCallback(key:String, callback:Function, fatalError:Function):void
	  {
		  callbackDic[key] = callback;
		  
		  fatalErrorDic[key] =  fatalError;
	  }
	  
	  private function triggleFatalERROR(url:String):void
	  {
		  if (fatalErrorDic[url] != null)
		  {
			  fatalErrorDic[url]();
			  
			  this.nowUrl = "";
		  }
	  }
	  
	  private var fatalErrorDic:Dictionary = new Dictionary();
	  
	  private var callbackDic:Dictionary = new Dictionary();
	  
	  public function clearnBa(key:String):void
	  {
		  this.destroyLoader2(key);
		  
		  this.loaded[key] = null;
		  
		  delete this.loaded[key];
		  
		  this.callbackDic[key] = null;
		  
		  delete this.callbackDic[key];
		  
		  callbackDic[key] = null;
		  
		  delete callbackDic[key];
	  }
	  
	  private function analyzeErrorCallback(param4:Array):void
	  {
		  errorCallback(param4[0]);
	  }
	  
      public function baRestoreDone2(param1:Bitmap, param2:VtyAvatarFrameInfo, param3:VtyAvatarFrameInfo, param4:Array) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(this.loaded[param4[0]] || param4.length == 4)
         {
            _loc5_ = param4[2];
            _loc6_ = param4[3];
            if(param2 == null || param1 == null)
            {
               return;
            }
			
			var callback:Function =  callbackDic[param4[0]];
			
			if (callback != null)
			{
				callback(param4[1], param1.bitmapData, param2.x, param2.y);
			}
			
			param1.bitmapData.dispose();
			param1.bitmapData = null;
//			trace(param4[0] + ":" + param4[1] + "complete");
			
			return;
         }
		 else if (param4 != null && param4.length == 3 && param4[1] == "first")
		 {
			 
			 var callback2:Function =  callbackDic[param4[0] + "_" + "first"];
			 
			 if (callback2 != null)
			 {
				 callback2(param4[2], param1.bitmapData, param2.x, param2.y);
			 }
		 }
         
		 param1 = null;
      }
      
      public function checkRestoreDirIsDone(param1:String) : Boolean
      {
         var _loc6_:* = null;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:Array = param1.split("_");
         _loc2_ = this.rawConfig[_loc4_[0] + "_" + _loc4_[1]];
         if(_loc2_ == null)
         {
            return false;
         }
         if(_loc2_["actions"][_loc4_[2]] == null)
         {
            return false;
         }
         _loc2_ = _loc2_["actions"][_loc4_[2]]["frames"];
         if(_loc2_ == null)
         {
            return false;
         }
         var _loc5_:Array = _loc2_[_loc4_[3]];
         while(_loc3_ < _loc5_.length)
         {
            _loc6_ = _loc5_[_loc3_];
            if(_loc6_.bitmapData == null)
            {
               return false;
            }
            _loc3_++;
         }
         toBmpDoneDic[param1] = 1;
         this.notify(param1);
         return true;
      }
      
      public function baRestoreDone(param1:Bitmap, param2:VtyAvatarFrameInfo, param3:VtyAvatarFrameInfo, param4:Array) : void
      {
         var _loc5_:* = null;
         if(this.loaded[param4[0]] || param4.length == 2)
         {
            if(param2 == null || param1 == null)
            {
               return;
            }
            param2.bitmapData = param1.bitmapData;
            if(param2.index < 0)
            {
               param2.index = -param2.index;
            }
            if(param3)
            {
               this.addFlipTask(param2,param3);
               if(param3.index < 0)
               {
                  param3.index = -param3.index;
               }
               param3.x = -(param2.bitmapData.width - Math.abs(param2.x));
               param3.y = param2.y;
            }
            toBmpDoneDic[_loc5_] = 1;
            this.notify(_loc5_);
            if(!(int(param4.length) - 3))
            {
               delLoaderFrame(param4[0],param4[1],param4[2]);
            }
         }
         param1 = null;
      }
      
      public function addFlipTask(param1:VtyAvatarFrameInfo, param2:VtyAvatarFrameInfo) : void
      {
         mFlipTaskList.push([param1,param2]);
      }
      
      private function checkFlipTask() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(mFlipTaskList.length > 0)
         {
            _loc1_ = mFlipTaskList.shift();
            _loc2_ = _loc1_[0];
            _loc3_ = _loc1_[1];
            if(_loc2_.bitmapData)
            {
               _loc3_.x = -_loc2_.x;
               _loc3_.scaleX = -1;
               _loc3_.bitmapData = _loc2_.bitmapData;
            }
         }
         else
         {
         }
      }
      
      public function flipHorizontal(param1:BitmapData, param2:Boolean = true, param3:uint = 0) : BitmapData
      {
         flipHorizontalMatrix.a = -1;
         flipHorizontalMatrix.tx = param1.width;
         var _loc4_:BitmapData = new BitmapData(param1.width,param1.height,param2,param3);
         _loc4_.draw(param1,flipHorizontalMatrix);
         return _loc4_;
      }
      
      public function drawShadow(param1:BitmapData) : BitmapData
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         _loc3_ = mMatrixRotate;
         _loc2_ = new BitmapData(param1.width + 200,param1.height,true,16777215);
         _loc2_.draw(param1,_loc3_);
         return _loc2_;
      }
      
      public function CheckToBmpDone(param1:String) : Boolean
      {
         if(toBmpDoneDic[param1])
         {
            return true;
         }
         return false;
      }
      
      private function checkIsMonsterResID(param1:int) : Boolean
      {
         return param1 >= 35000;
      }
      
      final function getOffP(param1:String, param2:int) : Point
      {
         var _loc3_:* = null;
         var _loc4_:Array = this.offsets[param1];
         if(null != _loc4_)
         {
            _loc3_ = _loc4_[param2];
            _loc3_ = _loc3_ || this.defaultP;
            return _loc3_;
         }
         return this.defaultP;
      }
      
      final function hasRes(param1:String) : Boolean
      {
         if(0 == param1.indexOf("weapon_0_"))
         {
            return true;
         }
         if(0 == param1.indexOf("avatar_6_"))
         {
            return true;
         }
         if(0 == param1.indexOf("avatar_7_"))
         {
            return true;
         }
         return null != this.loaded[param1];
      }
      
      private final function notify(param1:String) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:Dictionary = callbacks[param1];
         if(null != _loc3_)
         {
            var _loc5_:int = 0;
            var _loc4_:* = _loc3_;
            for(_loc2_ in _loc3_)
            {
               if(_loc2_ is Function)
               {
                  _loc2_();
               }
               delete _loc3_[_loc2_];
            }
         }
      }
   }
}
