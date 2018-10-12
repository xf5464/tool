package subGame.juezhanshachen.animation
{
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class CFrame
   {
       
      
      private var _rectBitmap:ASyncBitmapData = null;
      
      private var _offsetX:int;
      
      private var _offsetY:int;
      
      public var realOffsetX:int;
      
      public var realOffsetY:int;
      
      private var _frameWidth:int;
      
      private var _frameHeight:int;
      
      private var _interval:int = 0;
      
      private var _copyRect:Rectangle;
      
      private var destPos:Point;
      
      private var _key:String;
      
      private var _offsetLevel:int;
      
      private var _offsetVal:int;
      
      private var _isTurn:Boolean;
      
      private var _width:int;
      
      private var _height:int;
      
      public var isCopy:Boolean = false;
      
      public function CFrame(param1:String, param2:ASyncBitmapData, param3:int, param4:int, param5:int, param6:int, param7:Boolean = false, param8:int = 80)
      {
         super();
         this._rectBitmap = param2;
         this._offsetX = param3;
         this._offsetY = param4;
         this._frameWidth = param5;
         this._frameHeight = param6;
         this.realOffsetX = param3 - (this._frameWidth >> 1);
         this.realOffsetY = param4 - (this._frameHeight >> 1);
         this._interval = param8;
         this._key = param1;
         this._isTurn = param7;
         this._copyRect = new Rectangle(0,0,this._rectBitmap.bmpWidth,this._rectBitmap.bmpHeight);
         this.destPos = new Point(0,0);
         this._width = param5;
         this._height = param6;
         if(param5 == 512 || param5 == 1024 || param5 == 2048)
         {
            this._offsetLevel = param5 / 512;
            this._offsetVal = 256;
         }
         else
         {
            this._offsetLevel = 1;
            this._offsetVal = 0;
         }
      }
      
      public static function realloc(param1:CFrame, param2:String, param3:ASyncBitmapData, param4:int, param5:int, param6:int, param7:int, param8:Boolean = false, param9:int = 80) : void
      {
         param1._rectBitmap = param3;
         param1._offsetX = param4;
         param1._offsetY = param5;
         param1._frameWidth = param6;
         param1._frameHeight = param7;
         param1.realOffsetX = param4 - (param6 >> 1);
         param1.realOffsetY = param5 - (param7 >> 1);
         param1._interval = param9;
         param1._key = param2;
         param1._isTurn = param8;
         param1._width = param6;
         param1._height = param7;
         if(param6 == 512 || param6 == 1024 || param6 == 2048)
         {
            param1._offsetLevel = param6 / 512;
            param1._offsetVal = 256;
         }
         else
         {
            param1._offsetLevel = 1;
            param1._offsetVal = 0;
         }
         param1.isCopy = false;
      }
      
      public function get width() : int
      {
         return this._width;
      }
      
      public function get height() : int
      {
         return this._height;
      }
      
      public function get rectBitmap() : ASyncBitmapData
      {
         return this._rectBitmap;
      }
      
      public function get isTurn() : Boolean
      {
         return this._isTurn;
      }
      
      public function get offsetLevel() : int
      {
         return this._offsetLevel;
      }
      
      public function get key() : String
      {
         return this._key;
      }
      
      public function get copyRect() : Rectangle
      {
         return this._copyRect;
      }
      
      public function get bitmapWidth() : Number
      {
         return this._rectBitmap.bmpWidth;
      }
      
      public function get bitmapHeight() : Number
      {
         return this._rectBitmap.bmpHeight;
      }
      
      public function get frameHeight() : int
      {
         return this._frameHeight;
      }
      
      public function get frameWidth() : int
      {
         return this._frameWidth;
      }
      
      public function get interval() : int
      {
         return this._interval;
      }
      
      public function getOffsetY(param1:int = 1) : int
      {
         if(this._offsetX == 0 && this._offsetY == 0)
         {
            return param1 * this._offsetVal;
         }
         return param1 > this._offsetLevel?int(this._offsetY + this._offsetVal * (param1 - 1)):int(this._offsetY);
      }
      
      public function getOffsetX(param1:int = 1) : int
      {
         if(this._offsetX == 0 && this._offsetY == 0)
         {
            return param1 * this._offsetVal;
         }
         return param1 > this._offsetLevel?int(this._offsetX + this._offsetVal * (param1 - 1)):int(this._offsetX);
      }
      
      public function render(param1:BitmapData) : void
      {
         param1.copyPixels(this._rectBitmap.bitmapData,this._copyRect,this.destPos,null,null,true);
      }
      
      public function dispose() : void
      {
         if(this._rectBitmap != null)
         {
            this._rectBitmap.dispose();
         }
         this._rectBitmap = null;
      }
   }
}
