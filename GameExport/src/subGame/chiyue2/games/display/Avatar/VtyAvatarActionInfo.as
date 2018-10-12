package subGame.chiyue2.games.display.Avatar
{
   import subGame.chiyue2.com.fio.utils.FioBaseInfo;
   
   public class VtyAvatarActionInfo extends FioBaseInfo
   {
       
      
      public var actionName:String;
      
      public var useTime:int;
      
      public var delay:int;
      
      public var dirNum:int;
      
      public var isLoop:Boolean;
      
      public var frameNum:int;
      
      public var frames:Object = null;
      
      public function VtyAvatarActionInfo()
      {
         super();
      }
      
      override public function destory() : void
      {
         super.destory();
         this.actionName = "";
         var _loc1_:* = 0;
         this.frameNum = _loc1_;
         _loc1_ = _loc1_;
         this.delay = _loc1_;
         _loc1_ = _loc1_;
         this.dirNum = _loc1_;
         this.useTime = _loc1_;
         this.frames = null;
      }
   }
}
