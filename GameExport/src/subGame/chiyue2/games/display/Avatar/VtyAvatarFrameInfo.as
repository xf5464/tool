package subGame.chiyue2.games.display.Avatar
{
   import subGame.chiyue2.com.fio.utils.FioBaseInfo;
   import flash.display.BitmapData;
   
   public class VtyAvatarFrameInfo extends FioBaseInfo
   {
       
      
      public var index:int;
      
      public var x:int;
      
      public var y:int;
      
      public var bitmapData:BitmapData;
      
      public var i:int;
      
      public var dir:int;
      
      public var scaleX:int = 1;
      
      public function VtyAvatarFrameInfo()
      {
         super();
      }
      
      override public function destory() : void
      {
         super.destory();
         if(null != this.bitmapData)
         {
            this.bitmapData.dispose();
         }
         this.bitmapData = null;
      }
   }
}
