package subGame.juezhanshachen.animation
{
   public class AnimationDirection
   {
      
      public static const UP:int = 0;
      
      public static const RIGHT_UP:int = 1;
      
      public static const RIGHT:int = 2;
      
      public static const RIGHT_DOWN:int = 3;
      
      public static const DOWN:int = 4;
      
      public static const LEFT_DOWN:int = 5;
      
      public static const LEFT:int = 6;
      
      public static const LEFT_UP:int = 7;
       
      
      private var _dirID:int = 0;
      
      private var _keyFrames:int = 0;
      
      private var _depth:int = 0;
      
      private var _frames:Vector.<AnimationFrame>;
      
      public function AnimationDirection()
      {
         this._frames = new Vector.<AnimationFrame>();
         super();
         ObjectRecord.rcd(this);
      }
      
      public function dispose() : void
      {
         var _loc1_:AnimationFrame = null;
         for each(_loc1_ in this._frames)
         {
            _loc1_.dispose();
         }
         this._frames = null;
      }
      
      public function clone() : AnimationDirection
      {
         var _loc3_:AnimationFrame = null;
         var _loc1_:AnimationDirection = new AnimationDirection();
         _loc1_.dirID = this.dirID;
         _loc1_.keyFrames = this.keyFrames;
         _loc1_.depth = this.depth;
         var _loc2_:int = 0;
         while(_loc2_ < this._frames.length)
         {
            _loc3_ = this._frames[_loc2_];
            _loc1_.frames.push(_loc3_.clone());
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function get frames() : Vector.<AnimationFrame>
      {
         return this._frames;
      }
      
      public function set frames(param1:Vector.<AnimationFrame>) : void
      {
         this._frames = param1;
      }
      
      public function get depth() : int
      {
         return this._depth;
      }
      
      public function set depth(param1:int) : void
      {
         this._depth = param1;
      }
      
      public function get keyFrames() : int
      {
         return this._keyFrames;
      }
      
      public function set keyFrames(param1:int) : void
      {
         this._keyFrames = param1;
      }
      
      public function get dirID() : int
      {
         return this._dirID;
      }
      
      public function set dirID(param1:int) : void
      {
         this._dirID = param1;
      }
   }
}
