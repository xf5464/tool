package subGame.zanlongchuanqi.wylib.Bitmaps
{
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.sampler.getSize;
   import flash.utils.ByteArray;
   import flash.utils.clearTimeout;
   
   import subGame.zanlongchuanqi.wylib.Loaders.BmpLoaderQueue;
   
   public class BitmapGroup
   {
      
      private static var BitmapDataLoadQueue:BitmapLoadQueue = new BitmapLoadQueue(12);
       
      
      private var m_sDefaultExt:String;
      
      private var m_Loader:BmpLoaderQueue;
      
      private var m_loadTimeoutList:Vector.<uint>;
      
      private var m_sGroupName:String;
      
      private var m_BitmapClass:Class;
      
      private var m_Bitmaps:Array;
      
      public function BitmapGroup(param1:BmpLoaderQueue, param2:String = "", param3:String = ".png", param4:Class = null)
      {
         super();
         this.m_Loader = param1;
         this.m_sGroupName = param2;
         this.m_sDefaultExt = param3;
         this.m_Bitmaps = new Array();
         this.m_BitmapClass = !!param4?param4:CloneableBitmap;
         this.m_loadTimeoutList = new Vector.<uint>();
      }
      
      private function loaderLater(param1:String, param2:DisplayObject, param3:Function) : void
      {
         clearTimeout(this.m_loadTimeoutList.shift());
         if(this.m_Loader)
         {
            this.m_Loader.requestLoad(param1,param2,param3);
         }
      }
      
      protected function getLoadBitmap(param1:String, param2:int, param3:String = null) : CloneableBitmap
      {
         var _loc4_:CloneableBitmap = null;
         _loc4_ = new this.m_BitmapClass();
         this.m_Bitmaps[param2] = _loc4_;
         this.m_Loader.requestLoad(param1,_loc4_,this.loadBitmapComplete);
         return !!_loc4_?_loc4_.clone():null;
      }
      
      public function getBitmap(param1:int, param2:String = null, param3:String = "", param4:Boolean = false, param5:Boolean = false, param6:int = -1) : CloneableBitmap
      {
         if(param1 < 0)
         {
            throw new Error("从图片组中获取图片时传递了无效的索引参数(" + param1 + ")");
         }
         var _loc7_:CloneableBitmap = this.m_Bitmaps[param1];
         if(_loc7_)
         {
            return _loc7_.clone();
         }
         var _loc8_:String = param1.toString();
         while(_loc8_.length < 5)
         {
            _loc8_ = "0" + _loc8_;
         }
         if(this.m_sGroupName == "tiles")
         {
            _loc8_ = String(int(param1 / 10000)) + "/" + String(int(param1 % 10000 / 1000)) + "/" + _loc8_;
         }
         _loc8_ = this.m_sGroupName + "/" + _loc8_;
         if(param2)
         {
            _loc8_ = _loc8_ + param2;
         }
         else
         {
            _loc8_ = _loc8_ + this.m_sDefaultExt;
         }
         if(param4 && AssetsSocketInfo.Assets_Socket.socketStatus == SocketStatus.COMMUNICATION)
         {
            return this.getSocketBitmap(_loc8_,param1,param2,param3,param5,param6);
         }
         return this.getLoadBitmap(_loc8_,param1,param2);
      }
      
      public function doSocketDataBack(param1:int, param2:ByteArray) : void
      {
         var _loc3_:CloneableBitmap = this.m_Bitmaps[param1];
         if(!_loc3_)
         {
            return;
         }
         BitmapDataLoadQueue.requestLoadBitmapData(_loc3_,param2,this.loadBitmapComplete);
      }
      
      public function get groupName() : String
      {
         return this.m_sGroupName;
      }
      
      public function destruct() : void
      {
         this.m_Bitmaps.splice(0,this.m_Bitmaps.length);
         this.m_Bitmaps = null;
         this.m_Loader = null;
      }
      
      protected function getSocketBitmap(param1:String, param2:int, param3:String = null, param4:String = null, param5:Boolean = false, param6:int = -1) : CloneableBitmap
      {
         var _loc7_:CloneableBitmap = null;
         _loc7_ = new this.m_BitmapClass();
         this.m_Bitmaps[param2] = _loc7_;
         this.m_Loader.requestSocketLoad(param2,param4,param1,param5,param6);
         return !!_loc7_?_loc7_.clone():null;
      }
      
      private function loadBitmapComplete(param1:CloneableBitmap, param2:Bitmap) : void
      {
         if(param2)
         {
            param1.bitmapData = param2.bitmapData;
         }
      }
      
      public function disposeAllBitmap() : void
      {
         var _loc1_:Bitmap = null;
         var _loc2_:int = this.m_Bitmaps.length;
         while(_loc2_ > -1)
         {
            _loc1_ = this.m_Bitmaps[_loc2_];
            if(_loc1_ && _loc1_.bitmapData)
            {
               _loc1_.bitmapData.dispose();
               _loc1_.bitmapData = null;
               this.m_Bitmaps[_loc2_] = null;
            }
            _loc2_--;
         }
         this.m_Bitmaps.length = 0;
      }
      
      public function getMemorySize() : int
      {
         var _loc2_:Bitmap = null;
         var _loc1_:int = 0;
         for each(_loc2_ in this.m_Bitmaps)
         {
            if(_loc2_)
            {
               _loc1_ = _loc1_ + getSize(_loc2_);
            }
         }
         return _loc1_;
      }
   }
}
