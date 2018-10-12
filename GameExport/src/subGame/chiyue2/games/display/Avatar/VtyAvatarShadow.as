package subGame.chiyue2.games.display.Avatar
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class VtyAvatarShadow extends Sprite
   {
      
      private static const mMatrixOffset:Matrix = new Matrix(1,0,0,1,0,0);
      
      private static const mMatrixRotate:Matrix = new Matrix(1,0,0.5,0.5,0,0);
      
      private static const mColorMatrixFilter:ColorMatrixFilter = new ColorMatrixFilter([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.5,0]);
      
      private static const mPoint:Point = new Point(0,0);
       
      
      private var bmpd:BitmapData;
      
      private var delay:int;
      
      private var mShadowBmp:Bitmap;
      
      private var mDir:int;
      
      private var mActionName:String;
      
      private var mFrame:int;
      
      private var mStyle:String;
      
      public function VtyAvatarShadow()
      {
         super();
         this.mouseChildren = false;
         this.mouseEnabled = false;
         mShadowBmp = new Bitmap();
         addChild(mShadowBmp);
      }
      
      public function render(param1:VtyMovieBody, param2:*, param3:Boolean = false) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         VtyAvatarShadowManager.mIsStopCreateShadow = true;
         if(VtyAvatarShadowManager.mIsStopCreateShadow)
         {
            if(mShadowBmp.bitmapData == null || this.x != -33 && this.y != -20)
            {
               mShadowBmp.bitmapData = VtyAvatarShadowManager.getDefaultShadow();
               if(mShadowBmp.bitmapData == null)
               {
                  App.timer.doOnce(60,render,[param1,param2]);
               }
               if(mShadowBmp.bitmapData)
               {
                  mShadowBmp.cacheAsBitmap = true;
               }
               this.x = -33;
               this.y = -20;
            }
            return;
         }
         if(delay <= 0)
         {
            this.delay = 1;
            _loc5_ = param1.width;
            _loc6_ = param1.height;
            if(param3)
            {
               VtyAvatarShadowManager.addResUse(param2);
            }
            if(_loc5_ > 0 && _loc6_ > 0)
            {
               mStyle = param2;
               mDir = param1.getDir();
               mActionName = param1.getActionName();
               mFrame = param1.getFrameID();
               if(checkChange(_loc5_,_loc6_))
               {
                  this.bmpd = getFrame[1];
                  _loc4_ = getFrame[0];
                  this.x = _loc4_.x;
                  this.y = _loc4_.y;
                  this.mShadowBmp.bitmapData = bmpd;
               }
               else
               {
                  this.update(param1,mActionName != "dead");
               }
            }
         }
         else
         {
            this.delay--;
         }
      }
      
      private function update(param1:DisplayObject, param2:Boolean = true) : void
      {
         var _loc5_:* = null;
         var _loc4_:Number = NaN;
         var _loc3_:Rectangle = param1.getRect(param1);
         _loc3_.x = _loc3_.x - (_loc3_.width + 30);
         _loc3_.width = _loc3_.width + (_loc3_.width + 30);
         if(_loc3_.width > 0 && _loc3_.height > 0)
         {
            _loc4_ = _loc3_.height;
            _loc5_ = !!param2?mMatrixRotate:mMatrixOffset;
            _loc5_.tx = -_loc3_.x;
            _loc5_.ty = -_loc3_.y;
            if(param2 == false)
            {
               _loc5_.tx = _loc5_.tx - 3;
               _loc5_.ty = _loc5_.ty - 3;
            }
            this.bmpd = new BitmapData(_loc3_.width,_loc3_.height,true,16777215);
            this.bmpd.lock();
            this.bmpd.draw(param1,_loc5_);
            this.bmpd.applyFilter(this.bmpd,bmpd.rect,mPoint,mColorMatrixFilter);
            this.bmpd.unlock();
            this.x = _loc3_.x;
            this.y = _loc3_.y;
            this.mShadowBmp.bitmapData = bmpd;
            this.getFrame[0] = _loc3_;
            this.getFrame[1] = bmpd;
            this.getFrame[2] = param1.width;
            this.getFrame[3] = param1.height;
         }
      }
      
      private function checkChange(param1:int, param2:int) : Boolean
      {
         if(getFrame.length == 0)
         {
            return false;
         }
         if(getFrame[2] != param1 || getFrame[3] != param2)
         {
            return false;
         }
         return true;
      }
      
      private function get getFrame() : Array
      {
         return VtyAvatarShadowManager.getShadow(this.mStyle,this.mActionName,this.mDir,this.mFrame);
      }
      
      public function recycle() : void
      {
         VtyAvatarShadowManager.decResUse(mStyle);
         VtyAvatarShadowManager.delMonsterShadow(mStyle);
      }
   }
}
