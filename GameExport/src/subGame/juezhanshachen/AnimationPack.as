package engineplus.resmgr
{
   import engine.classbase.ObjectRecord;
   import engine.classbase.ZDictionary;
   import engineplus.sprite_cld.AnimationObj;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.Endian;
   
   public class AnimationPack extends EventDispatcher
   {
      
      public static const refList:ZDictionary = new ZDictionary();
      
      private static var GIDGETTER:int = 1;
      
      public static const EVENT_PARSE_COMPLETE:String = "event_parse_complete";
       
      
      private var _isDispose:Boolean = false;
      
      private var _url:String = null;
      
      private var _actionMap:ZDictionary;
      
      private var _dataResMap:ZDictionary;
      
      private var _isLoad:Boolean = false;
      
      private var _dataResMemorySize:uint = 0;
      
      private var _uid:int = 0;
      
      public function AnimationPack()
      {
         this._actionMap = new ZDictionary();
         this._dataResMap = new ZDictionary();
         super();
         ObjectRecord.rcd(this);
         this._uid = GIDGETTER++;
         refList[this._uid] = this;
      }
      
      public function get dataResMemorySize() : uint
      {
         return this._dataResMemorySize;
      }
      
      public function dispose(param1:Boolean = false) : void
      {
         var _loc2_:AnimationObj = null;
         this._isDispose = true;
         refList[this._uid] = null;
         delete refList[this._uid];
         for each(_loc2_ in this._actionMap)
         {
            _loc2_.dispose();
         }
         this._dataResMap = null;
         this._actionMap = null;
      }
      
      public function get actionMap() : Dictionary
      {
         return this._actionMap;
      }
      
      public function get isLoad() : Boolean
      {
         return this._isLoad;
      }
      
      public function set isLoad(param1:Boolean) : void
      {
         this._isLoad = param1;
      }
      
      public function get url() : String
      {
         return this._url;
      }
      
      public function set url(param1:String) : void
      {
         this._url = param1;
      }
      
      public function get useMemorySize() : int
      {
         var _loc2_:AnimationObj = null;
         var _loc1_:int = 0;
         for each(_loc2_ in this._actionMap)
         {
            _loc1_ = _loc1_ + _loc2_.useMemory;
         }
         return _loc1_;
      }
      
      public function parseData(param1:String, param2:ByteArray, param3:Dictionary) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc6_:ByteArray = null;
         var _loc7_:* = null;
         var _loc8_:Array = null;
         var _loc9_:String = null;
         var _loc10_:ByteArray = null;
         if(param2 == null)
         {
            throw new Error("AnimationPack parseData ( resData == null )");
         }
         if(param2.length == 0)
         {
            throw new Error("AnimationPack parseData ( resData.length == 0 )");
         }
         param2.position = 0;
         param2.endian = Endian.LITTLE_ENDIAN;
         while(param2.bytesAvailable > 0)
         {
            _loc4_ = param2.readInt();
            _loc5_ = param2.readUTFBytes(_loc4_);
            _loc4_ = param2.readUnsignedInt();
            _loc6_ = new ByteArray();
            param2.readBytes(_loc6_,0,_loc4_);
            if(this._dataResMap[_loc5_] != null)
            {
               throw new Error("动画资源包资源重复keyname:" + _loc5_ + " url:" + this._url);
            }
            this._dataResMap[_loc5_] = _loc6_;
            this._dataResMemorySize = this._dataResMemorySize + _loc6_.length;
         }
         try
         {
            if(param3 != null)
            {
               for(_loc7_ in param3)
               {
                  if(param1.indexOf(_loc7_) != -1)
                  {
                     _loc8_ = param3[_loc7_];
                     if(_loc8_.length >= 2)
                     {
                        _loc8_ = _loc8_.concat();
                        _loc9_ = _loc8_[0];
                        _loc8_.splice(0,1);
                        _loc10_ = this._dataResMap[_loc9_];
                        for each(_loc5_ in _loc8_)
                        {
                           if(this._dataResMap[_loc5_] == null)
                           {
                              _loc6_ = new ByteArray();
                              _loc10_.readBytes(_loc6_,0,_loc10_.length);
                              this._dataResMap[_loc5_] = _loc6_;
                              this._dataResMemorySize = this._dataResMemorySize + _loc6_.length;
                           }
                        }
                        break;
                     }
                  }
               }
            }
         }
         catch(error:Error)
         {
         }
         param2.clear();
         this._isLoad = true;
         dispatchEvent(new Event(EVENT_PARSE_COMPLETE));
         return true;
      }
      
      public function getActionData(param1:String) : AnimationObj
      {
         if(!this._isLoad)
         {
            return null;
         }
         var _loc2_:AnimationObj = this._actionMap[param1] as AnimationObj;
         if(_loc2_ != null)
         {
            return _loc2_;
         }
         var _loc3_:ByteArray = this._dataResMap[param1];
         if(_loc3_ == null)
         {
            return null;
         }
         _loc2_ = new AnimationObj();
         _loc2_.parseSpr(_loc3_,param1,this._url);
         this._actionMap[param1] = _loc2_;
         this._dataResMemorySize = this._dataResMemorySize - _loc3_.length;
         this._dataResMap[param1] = null;
         delete this._dataResMap[param1];
         return _loc2_;
      }
      
      public function getAllPackgeActionData(param1:String) : AnimationObj
      {
         if(!this._isLoad)
         {
            return null;
         }
         var _loc2_:AnimationObj = this._actionMap[param1] as AnimationObj;
         if(_loc2_ != null)
         {
            return _loc2_;
         }
         var _loc3_:ByteArray = this._dataResMap[param1];
         if(_loc3_ == null)
         {
            return null;
         }
         _loc2_ = new AnimationObj();
         _loc2_.parseSpr(_loc3_,param1,this._url);
         this._actionMap[param1] = _loc2_;
         this._dataResMemorySize = this._dataResMemorySize - _loc3_.length;
         this._dataResMap[param1] = null;
         delete this._dataResMap[param1];
         return _loc2_;
      }
      
      public function getMirrorActionData(param1:String, param2:int, param3:int) : AnimationObj
      {
         var _loc4_:AnimationObj = this.getActionData(param1 + "_" + param2);
         var _loc5_:AnimationObj = _loc4_.getMirrorObj(param1,param3,this._url);
         this._actionMap[param1 + "_" + param3] = _loc5_;
         return _loc5_;
      }
   }
}
