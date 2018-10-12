package subGame.sanrenchuanqi.wylib.Packs.BitmapPack.Internal
{
   import flash.display.Bitmap;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.utils.ByteArray;
   
   public dynamic class MDPBitmapDataLoadQueue extends Array
   {
       
      
      private var IdleLoaderList:Array;
      
      public function MDPBitmapDataLoadQueue(param1:int = 2)
      {
         var _loc2_:int = 0;
         var _loc3_:MDPBitmapDataLoader = null;
         super();
         this.IdleLoaderList = new Array();
         _loc2_ = 0;
         while(_loc2_ < param1)
         {
            _loc3_ = new MDPBitmapDataLoader();
            _loc3_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.loadBitmapDataComplete);
            this.IdleLoaderList.push(_loc3_);
            _loc2_++;
         }
      }
      
      private function loadBitmapDataComplete(param1:Event) : void
      {
         var info:MDPLoadBitmapDataInfo = null;
         var e:Event = param1;
         var ldi:LoaderInfo = LoaderInfo(e.currentTarget);
         var ldr:MDPBitmapDataLoader = MDPBitmapDataLoader(ldi.loader);
         info = ldr.CurrentLoadInfo;
         var bmp:Bitmap = Bitmap(ldi.content);
         try
         {
            info.CallBack(bmp.bitmapData);
            return;
         }
         finally
         {
            ldr.unload();
            bmp.bitmapData = null;
            info.Stream = null;
            info.CallBack = null;
            if(length > 0)
            {
               ldr.loadNextRequest(pop());
            }
            else
            {
               ldr.CurrentLoadInfo = null;
               this.IdleLoaderList.push(ldr);
            }
         }
      }
      
      public function requestLoadBitmapData(param1:ByteArray, param2:int, param3:int, param4:Function) : void
      {
         var _loc5_:int = 0;
         var _loc6_:MDPBitmapDataLoader = null;
         var _loc7_:MDPLoadBitmapDataInfo = new MDPLoadBitmapDataInfo();
         _loc7_.CallBack = param4;
         _loc7_.Position = param2;
         _loc7_.Size = param3;
         _loc7_.Stream = param1;
         if(this.IdleLoaderList.length)
         {
            _loc6_ = this.IdleLoaderList.pop();
            _loc6_.loadNextRequest(_loc7_);
            return;
         }
         push(_loc7_);
      }
   }
}

import flash.display.Loader;
import flash.utils.ByteArray;

class MDPBitmapDataLoader extends Loader
{
    
   
   private var Stream:ByteArray;
   
   public var CurrentLoadInfo:MDPLoadBitmapDataInfo;
   
   function MDPBitmapDataLoader()
   {
      super();
      this.Stream = new ByteArray();
   }
   
   public function loadNextRequest(param1:MDPLoadBitmapDataInfo) : void
   {
      this.CurrentLoadInfo = param1;
      this.Stream.length = 0;
      this.Stream.writeBytes(param1.Stream,param1.Position,param1.Size);
      loadBytes(this.Stream);
      param1.Stream = null;
   }
}

import flash.utils.ByteArray;

class MDPLoadBitmapDataInfo
{
    
   
   public var Stream:ByteArray;
   
   public var Size:int;
   
   public var CallBack:Function;
   
   public var Position:int;
   
   function MDPLoadBitmapDataInfo()
   {
      super();
   }
}
