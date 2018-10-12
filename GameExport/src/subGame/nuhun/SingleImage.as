package subGame.nuhun
{
   import flash.display.BitmapData;
   
   public class SingleImage
   {
       
      
      public var bitmapData:BitmapData;
      
      public var width:Number = 0;
      
      public var height:Number = 0;
      
      public var offsetX:Number = 0;
      
      public var offsetY:Number = 0;
      
      public var frameNum:int;
      
      public var imageName:String;
      
      public var delayTime:int = 0;
      
//      public var animator:Animator;
      
      protected var _isDispose:Boolean = false;
      
      public function SingleImage(param1:BitmapData = null)
      {
         super();
         this.bitmapData = param1;
         if(this.bitmapData)
         {
            this.width = this.bitmapData.width;
            this.height = this.bitmapData.height;
         }
      }
      
      public function get isDispose() : Boolean
      {
         return this._isDispose;
      }
      
      public function dispose() : void
      {
         if(this.bitmapData)
         {
            this.bitmapData.dispose();
         }
         this.bitmapData = null;
         this.width = 0;
         this.height = 0;
         this.offsetX = 0;
         this.offsetY = 0;
         this.frameNum = 0;
         this.imageName = "";
//         this.animator = null;
         this._isDispose = true;
      }
   }
}
