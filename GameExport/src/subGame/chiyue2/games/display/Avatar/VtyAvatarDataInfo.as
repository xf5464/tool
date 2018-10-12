package subGame.chiyue2.games.display.Avatar
{
   import subGame.chiyue2.com.fio.utils.FioBaseInfo;
   import flash.geom.Rectangle;
   
   public class VtyAvatarDataInfo extends FioBaseInfo
   {
       
      
      public var topy:int;
      
      public var actions:Object = null;
      
      public var hitRect:Rectangle;
      
      public var offsetX:int;
      
      public var offsetY:int;
      
      public var copySource:String = "";
      
      public var mirrorID:int = 0;
      
      public function VtyAvatarDataInfo()
      {
         super();
      }
      
      public final function getRect() : Rectangle
      {
         return this.hitRect;
      }
      
      public final function setRect(param1:String) : void
      {
         var _loc2_:Array = param1.split(",");
         if(4 == _loc2_.length)
         {
            this.hitRect = new Rectangle(int(_loc2_[0]),int(_loc2_[1]),int(_loc2_[2]),int(_loc2_[3]));
         }
      }
      
      override public function destory() : void
      {
         super.destory();
         var _loc1_:* = 0;
         this.offsetY = _loc1_;
         _loc1_ = _loc1_;
         this.offsetX = _loc1_;
         this.topy = _loc1_;
         this.hitRect = null;
         this.actions = null;
      }
   }
}
