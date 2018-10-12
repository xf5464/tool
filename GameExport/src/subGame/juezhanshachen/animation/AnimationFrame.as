package subGame.juezhanshachen.animation
{
   import flash.display.BitmapData;
   
   public class AnimationFrame
   {
       
      
      private var _offsetX:int = 0;
      
      private var _offsetY:int = 0;
      
      private var _width:int = 0;
      
      private var _height:int = 0;
      
      private var _bmpWidth:int = 0;
      
      private var _bmpHeight:int = 0;
      
      private var _interval:int = 0;
      
      private var _bmp:BitmapData = null;
      
      public var _asynBitmapdata:ASyncBitmapData;
      
      public function AnimationFrame()
      {
         super();
         ObjectRecord.rcd(this);
      }
      
      public function dispose() : void
      {
         this._offsetX = 0;
         this._offsetY = 0;
         this._width = 0;
         this._height = 0;
         this._bmpHeight = 0;
         this._bmpWidth = 0;
         if(this._bmp != null)
         {
            this._bmp.dispose();
            this._bmp = null;
         }
         if(this._asynBitmapdata != null)
         {
            this._asynBitmapdata.dispose();
            this._asynBitmapdata = null;
         }
      }
      
      public function clone() : AnimationFrame
      {
         var _loc1_:AnimationFrame = new AnimationFrame();
         _loc1_.offsetX = this.offsetX;
         _loc1_.offsetY = this.offsetY;
         _loc1_.width = this.width;
         _loc1_.height = this.height;
         _loc1_.bmpWidth = this.bmpWidth;
         _loc1_.bmpHeight = this.bmpHeight;
         _loc1_.interval = this.interval;
         return _loc1_;
      }
      
      public function get bmp() : BitmapData
      {
         return this._bmp;
      }
      
      public function set bmp(param1:BitmapData) : void
      {
         this._bmp = param1;
      }
      
      public function get interval() : int
      {
         return this._interval;
      }
      
      public function set interval(param1:int) : void
      {
         this._interval = param1;
      }
      
      public function get bmpHeight() : int
      {
         return this._bmpHeight;
      }
      
      public function set bmpHeight(param1:int) : void
      {
         this._bmpHeight = param1;
      }
      
      public function get bmpWidth() : int
      {
         return this._bmpWidth;
      }
      
      public function set bmpWidth(param1:int) : void
      {
         this._bmpWidth = param1;
      }
      
      public function get height() : int
      {
         return this._height;
      }
      
      public function set height(param1:int) : void
      {
         this._height = param1;
      }
      
      public function get width() : int
      {
         return this._width;
      }
      
      public function set width(param1:int) : void
      {
         this._width = param1;
      }
      
      public function get offsetY() : int
      {
         return this._offsetY;
      }
      
      public function set offsetY(param1:int) : void
      {
         this._offsetY = param1;
      }
      
      public function get offsetX() : int
      {
         return this._offsetX;
      }
      
      public function set offsetX(param1:int) : void
      {
         this._offsetX = param1;
      }
   }
}
