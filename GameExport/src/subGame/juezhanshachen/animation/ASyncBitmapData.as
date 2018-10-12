package subGame.juezhanshachen.animation
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   
   public class ASyncBitmapData
   {
       
      
      private var width:Number;
      
      private var height:Number;
      
      private var bitmapdata:BitmapData;
      
      public var imgData:ByteArray;
      
      private var loader:Loader;
      
      private var lastUseTime:int;
      
      private var _isAync:Boolean = false;
      
      public function ASyncBitmapData(param1:Number, param2:Number, param3:ByteArray, param4:BitmapData = null, param5:Boolean = false)
      {
         super();
         this.width = param1;
         this.height = param2;
         this.imgData = param3;
         this._isAync = param5;
         this.bitmapdata = param4;
         if(this.bitmapdata != null)
         {
//            this.imgData = null;
         }
      }
      
      public static function realloc(param1:ASyncBitmapData, param2:Number, param3:Number, param4:ByteArray, param5:BitmapData = null, param6:Boolean = false) : void
      {
		  return;
         param1.width = param2;
         param1.height = param3;
         param1.imgData = param4;
         param1._isAync = param6;
         param1.bitmapdata = param5;
         if(param1.bitmapdata != null)
         {
            param1.imgData = null;
         }
      }
      
      public function get bmpHeight() : Number
      {
         if(this.bitmapdata != null)
         {
            return this.bitmapdata.height;
         }
         return this.height;
      }
      
      public function get bmpWidth() : Number
      {
         if(this.bitmapdata != null)
         {
            return this.bitmapdata.width;
         }
         return this.width;
      }
      
      public function get bitmapData() : BitmapData
      {
         if(this.bitmapdata == null)
         {
            this.decodeBmd();
         }
         return this.bitmapdata;
      }
      
      public function decodeBmd() : void
      {
		  return;
         var _loc1_:LoaderContext = null;
         var _loc2_:Rectangle = null;
         if(this.imgData != null)
         {
            if(this._isAync)
            {
               this.imgData.position = 0;
               this.loader = new Loader();
               _loc1_ = new LoaderContext();
               if(_loc1_.hasOwnProperty("imageDecodingPolicy"))
               {
                  _loc1_["imageDecodingPolicy"] = "onLoad";
               }
               this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.loadCompleteHandler,false,0,true);
               this.loader.loadBytes(this.imgData,_loc1_);
            }
            else
            {
               this.bitmapdata = new BitmapData(this.width,this.height,true,16711680);
               this.imgData.uncompress();
               this.imgData.position = 0;
               if(this.imgData.length > 0)
               {
                  _loc2_ = new Rectangle(0,0,this.width,this.height);
                  this.bitmapdata.setPixels(_loc2_,this.imgData);
               }
            }
            this.imgData = null;
         }
      }
      
      protected function loadCompleteHandler(param1:Event) : void
      {
         this.bitmapdata = ((param1.target as LoaderInfo).content as Bitmap).bitmapData;
         this.bitmapdata.getPixel(0,0);
         this.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.loadCompleteHandler);
         this.loader.unload();
         this.loader = null;
      }
      
      public function dispose() : void
      {
         if(this.imgData != null)
         {
            this.imgData.clear();
         }
         this.imgData = null;
         if(this.loader != null)
         {
            this.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.loadCompleteHandler);
            this.loader.unloadAndStop();
         }
         this.loader = null;
         if(this.bitmapdata != null)
         {
            this.bitmapdata.dispose();
         }
         this.bitmapdata = null;
      }
   }
}
