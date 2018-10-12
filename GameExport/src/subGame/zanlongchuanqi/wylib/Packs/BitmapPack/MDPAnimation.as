package subGame.zanlongchuanqi.wylib.Packs.BitmapPack
{
   import flash.display.Bitmap;
   import flash.geom.Point;
   import flash.utils.getTimer;
   import subGame.zanlongchuanqi.wylib.Packs.MDPackDirectory;
   
   public class MDPAnimation extends Bitmap
   {
       
      
      protected var m_dwNextFrameTime:uint;
      
      protected var m_dwInterval:uint;
      
      protected var m_nFrameIndex:int;
      
      protected var m_nFrameStart:int;
      
      protected var m_nFrameEnd:int;
      
      protected var m_Directory:MDPackDirectory;
      
      public function MDPAnimation()
      {
         super();
         this.m_nFrameIndex = -1;
         this.m_dwInterval = 240;
         this.m_nFrameEnd = -1;
      }
      
      public function get interval() : uint
      {
         return this.m_dwInterval;
      }
      
      public function getFrameOffset(param1:int) : Point
      {
         if(!this.m_Directory || this.m_Directory.itemCount <= param1)
         {
            return null;
         }
         var _loc2_:MDPBitmapData = MDPBitmapData(this.m_Directory.getItem(param1));
         return new Point(_loc2_.offsetX,_loc2_.offsetY);
      }
      
      protected function getTimer() : int
      {
         return getTimer();
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:int = 0;
         var _loc3_:MDPBitmapData = null;
         var _loc4_:int = 0;
         if(!this.m_Directory)
         {
            return;
         }
         if(param1 >= this.m_dwNextFrameTime)
         {
            _loc2_ = this.m_nFrameEnd == -1?int(this.m_Directory.itemCount - 1):int(this.m_nFrameEnd);
            this.m_nFrameIndex++;
            if(this.m_dwInterval > 0)
            {
               _loc4_ = param1 - this.m_dwNextFrameTime;
               if(_loc4_ >= this.m_dwInterval)
               {
                  _loc4_ = _loc4_ / this.m_dwInterval;
                  this.m_nFrameIndex = this.m_nFrameIndex + _loc4_;
                  this.m_dwNextFrameTime = this.m_dwNextFrameTime + this.m_dwInterval * (_loc4_ + 1);
               }
               else
               {
                  this.m_dwNextFrameTime = this.m_dwNextFrameTime + this.m_dwInterval;
               }
            }
            if(this.m_nFrameIndex > _loc2_)
            {
               this.m_nFrameIndex = this.m_nFrameStart + (this.m_nFrameIndex - this.m_nFrameStart) % (_loc2_ - this.m_nFrameStart + 1);
            }
            _loc3_ = this.m_Directory.getItem(this.m_nFrameIndex) as MDPBitmapData;
            if(!_loc3_)
            {
               return;
            }
            bitmapData = _loc3_.bitmapData;
            this.setOffsetXY(_loc3_.offsetX,_loc3_.offsetY);
         }
      }
      
      public function set interval(param1:uint) : void
      {
         this.m_dwInterval = param1;
      }
      
      public function setFrameRange(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         this.m_nFrameStart = param1;
         if(param2 != -1)
         {
            this.m_nFrameEnd = param1 + param2 - 1;
         }
         else
         {
            this.m_nFrameEnd = -1;
         }
         if(this.m_Directory)
         {
            _loc3_ = this.m_Directory.itemCount;
            if(this.m_nFrameStart >= _loc3_)
            {
               this.m_nFrameStart = _loc3_ - 1;
            }
            if(_loc3_ <= this.m_nFrameEnd)
            {
               this.m_nFrameEnd = _loc3_ - 1;
            }
         }
      }
      
      public function destruct() : void
      {
         this.bitmapData = null;
         this.m_Directory = null;
      }
      
      public function getFrameSize(param1:int) : Point
      {
         if(!this.m_Directory || this.m_Directory.itemCount <= param1)
         {
            return null;
         }
         var _loc2_:MDPBitmapData = MDPBitmapData(this.m_Directory.getItem(this.m_nFrameIndex));
         if(!_loc2_.bitmapData)
         {
            return null;
         }
         return new Point(_loc2_.bitmapData.width,_loc2_.bitmapData.height);
      }
      
      public function set frameIndex(param1:int) : void
      {
         var _loc2_:MDPBitmapData = null;
         this.m_nFrameIndex = param1;
         if(this.m_Directory)
         {
            _loc2_ = MDPBitmapData(this.m_Directory.getItem(this.m_nFrameIndex));
            if(_loc2_)
            {
               bitmapData = _loc2_.bitmapData;
               this.setOffsetXY(_loc2_.offsetX,_loc2_.offsetY);
            }
         }
         this.m_dwNextFrameTime = this.getTimer() + this.m_dwInterval;
      }
      
      public function set directory(param1:MDPackDirectory) : void
      {
         this.m_Directory = param1;
         if(!param1 || this.m_nFrameIndex >= param1.itemCount)
         {
            this.m_nFrameIndex = 0;
            bitmapData = null;
         }
      }
      
      public function set frameEnd(param1:int) : void
      {
         this.m_nFrameEnd = param1;
         this.setFrameRange(this.m_nFrameStart,param1 != -1?int(param1 - this.m_nFrameStart):int(param1));
      }
      
      protected function setOffsetXY(param1:int, param2:int) : void
      {
         if(rotationY == 0)
         {
            super.x = param1;
         }
         else
         {
            super.x = -param1;
         }
         super.y = param2;
      }
      
      public function get frameIndex() : int
      {
         return this.m_nFrameIndex;
      }
      
      public function get frameCount() : int
      {
         return !!this.m_Directory?int(this.m_Directory.itemCount):0;
      }
      
      public function set frameStart(param1:int) : void
      {
         this.setFrameRange(param1,param1 - this.m_nFrameStart);
      }
      
      public function get directory() : MDPackDirectory
      {
         return this.m_Directory;
      }
      
      public function get frameEnd() : int
      {
         return this.m_nFrameEnd;
      }
      
      public function get frameStart() : int
      {
         return this.m_nFrameStart;
      }
   }
}
