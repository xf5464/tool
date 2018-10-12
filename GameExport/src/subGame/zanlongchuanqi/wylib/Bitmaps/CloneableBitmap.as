package subGame.zanlongchuanqi.wylib.Bitmaps
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class CloneableBitmap extends Bitmap
   {
       
      
      public function CloneableBitmap()
      {
         super();
      }
      
      private function sourceLoadComplete(param1:Event) : void
      {
         var _loc2_:CloneableBitmap = CloneableBitmap(param1.target);
         _loc2_.removeEventListener(param1.type,this.sourceLoadComplete);
         this.bitmapData = _loc2_.bitmapData;
      }
      
      override public function set bitmapData(param1:BitmapData) : void
      {
         super.bitmapData = param1;
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function clone() : CloneableBitmap
      {
         var _loc1_:CloneableBitmap = new CloneableBitmap();
         if(bitmapData)
         {
            _loc1_.bitmapData = bitmapData;
         }
         else
         {
            addEventListener(Event.CHANGE,_loc1_.sourceLoadComplete);
         }
         return _loc1_;
      }
      
      protected function loadComplete(param1:Object, param2:Bitmap) : void
      {
         if(param2)
         {
            this.bitmapData = param2.bitmapData;
         }
      }
   }
}
