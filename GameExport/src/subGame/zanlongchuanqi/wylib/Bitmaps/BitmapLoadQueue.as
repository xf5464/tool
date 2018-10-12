package subGame.zanlongchuanqi.wylib.Bitmaps
{
   import flash.display.Bitmap;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.utils.ByteArray;
   
   public class BitmapLoadQueue extends Array
   {
       
      
      private var IdleLoaderList:Array;
      
      public function BitmapLoadQueue(param1:int = 2)
      {
         var _loc2_:int = 0;
         var _loc3_:BitmapDataLoader = null;
         super();
         this.IdleLoaderList = new Array();
         _loc2_ = 0;
         while(_loc2_ < param1)
         {
            _loc3_ = new BitmapDataLoader();
            _loc3_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.loadBitmapDataComplete);
            this.IdleLoaderList.push(_loc3_);
            _loc2_++;
         }
      }
      
      private function loadBitmapDataComplete(param1:Event) : void
      {
         var e:Event = param1;
         var ldi:LoaderInfo = LoaderInfo(e.currentTarget);
         var ldr:BitmapDataLoader = BitmapDataLoader(ldi.loader);
         var info:BmpLoadDataContext = ldr.CurrentLoadInfo;
         var bmp:Bitmap = Bitmap(ldi.content);
         try
         {
            info.CallBack(info.Content,bmp);
            return;
         }
         finally
         {
            ldr.unload();
            bmp.bitmapData = null;
            info.Stream = null;
            info.CallBack = null;
            info.Content = null;
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
      
      public function requestLoadBitmapData(param1:Object, param2:ByteArray, param3:Function) : void
      {
         var _loc4_:int = 0;
         var _loc5_:BitmapDataLoader = null;
         var _loc6_:BmpLoadDataContext = new BmpLoadDataContext#38();
         _loc6_.Content = param1;
         _loc6_.CallBack = param3;
         _loc6_.Stream = param2;
         if(this.IdleLoaderList.length)
         {
            _loc5_ = this.IdleLoaderList.pop();
            _loc5_.loadNextRequest(_loc6_);
            return;
         }
         push(_loc6_);
      }
   }
}

import flash.display.Loader;
import flash.utils.ByteArray;

class BitmapDataLoader extends Loader
{
    
   
   private var Stream:ByteArray;
   
   public var CurrentLoadInfo:BmpLoadDataContext#38;
   
   function BitmapDataLoader()
   {
      super();
      this.Stream = new ByteArray();
   }
   
   public function loadNextRequest(param1:BmpLoadDataContext#38) : void
   {
      this.CurrentLoadInfo = param1;
      this.Stream.length = 0;
      this.Stream.writeBytes(param1.Stream);
      loadBytes(this.Stream);
      param1.Stream = null;
   }
}

import flash.utils.ByteArray;

class BmpLoadDataContext#38
{
    
   
   public var Stream:ByteArray;
   
   public var CallBack:Function;
   
   public var Content:Object;
   
   function BmpLoadDataContext#38()
   {
      super();
   }
}
