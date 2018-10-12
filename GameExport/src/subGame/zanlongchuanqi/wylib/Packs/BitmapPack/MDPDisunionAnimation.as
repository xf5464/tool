package subGame.zanlongchuanqi.wylib.Packs.BitmapPack
{
   public class MDPDisunionAnimation extends MDPAnimation
   {
       
      
      protected var m_specialFrameEnable:Boolean = false;
      
      protected var m_vIntervals:Array;
      
      public function MDPDisunionAnimation()
      {
         super();
         this.m_vIntervals = [];
      }
      
      public function clearIntervals() : void
      {
         this.m_vIntervals.length = 0;
      }
      
      protected function getFrameTime(param1:int) : int
      {
         var _loc2_:int = this.m_vIntervals[param1];
         if(_loc2_ == 0)
         {
            _loc2_ = m_dwInterval;
         }
         return _loc2_;
      }
      
      public function get frameIntervals() : Array
      {
         return this.m_vIntervals;
      }
      
      override public function update(param1:uint) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:MDPBitmapData = null;
         var _loc6_:int = 0;
         if(!this.m_specialFrameEnable)
         {
            super.update(param1);
            return;
         }
         if(!m_Directory)
         {
            return;
         }
         var _loc2_:int = m_nFrameIndex;
         if(param1 >= m_dwNextFrameTime)
         {
            _loc3_ = m_nFrameEnd == -1?int(m_Directory.itemCount - 1):int(m_nFrameEnd);
            _loc4_ = this.getFrameTime(m_nFrameIndex);
            m_nFrameIndex++;
            if(m_dwInterval > 0)
            {
               _loc6_ = param1 - m_dwNextFrameTime;
               if(_loc6_ >= _loc4_)
               {
                  m_dwNextFrameTime = m_dwNextFrameTime + (_loc6_ + this.getFrameTime(m_nFrameIndex));
                  m_nFrameIndex = this.getNextFrameByTime(m_nFrameIndex,_loc3_,_loc6_);
               }
               else
               {
                  m_dwNextFrameTime = m_dwNextFrameTime + this.getFrameTime(m_nFrameIndex);
               }
            }
            if(m_nFrameIndex > _loc3_)
            {
               m_nFrameIndex = m_nFrameStart + (m_nFrameIndex - m_nFrameStart) % (_loc3_ - m_nFrameStart + 1);
            }
            if(m_nFrameIndex == _loc2_)
            {
               return;
            }
            _loc5_ = m_Directory.getItem(m_nFrameIndex) as MDPBitmapData;
            if(!_loc5_)
            {
               return;
            }
            bitmapData = _loc5_.bitmapData;
            setOffsetXY(_loc5_.offsetX,_loc5_.offsetY);
         }
      }
      
      public function set specialFrameEnable(param1:Boolean) : void
      {
         this.m_specialFrameEnable = param1;
      }
      
      protected function getNextFrameByTime(param1:int, param2:int, param3:int) : int
      {
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         do
         {
            _loc5_ = this.m_vIntervals[param1];
            if(_loc5_ == 0)
            {
               _loc5_ = m_dwInterval;
            }
            _loc4_ = _loc4_ + _loc5_;
            param1++;
            if(param1 >= m_nFrameEnd)
            {
               param1 = m_nFrameStart;
            }
         }
         while(_loc4_ < param3);
         
         return param1;
      }
      
      public function setFrameInterval(param1:int, param2:int) : void
      {
         this.m_vIntervals[param1] = param2;
      }
      
      protected function getFrameAreaTime(param1:int, param2:int) : int
      {
         var _loc7_:int = 0;
         var _loc3_:int = m_Directory.itemCount;
         if(param2 >= _loc3_ || param1 >= _loc3_)
         {
            return m_dwInterval;
         }
         var _loc4_:int = Math.abs(_loc3_ - param1 - (_loc3_ - param2));
         if(_loc4_ == 0)
         {
            _loc4_ = 1;
         }
         var _loc5_:int = 0;
         var _loc6_:int = param1;
         var _loc8_:int = 0;
         while(_loc8_ < _loc4_)
         {
            if(_loc6_ >= _loc3_)
            {
               _loc6_ = 0;
            }
            _loc7_ = this.m_vIntervals[_loc6_];
            if(_loc7_ == 0)
            {
               _loc5_ = _loc5_ + m_dwInterval;
            }
            else
            {
               _loc5_ = _loc5_ + _loc7_;
            }
            _loc6_++;
            _loc8_++;
         }
         return _loc5_;
      }
      
      override public function destruct() : void
      {
         super.destruct();
         this.m_vIntervals = null;
      }
      
      public function get specialFrameEnable() : Boolean
      {
         return this.m_specialFrameEnable;
      }
      
      public function getTotleTime() : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc1_:int = this.m_vIntervals.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_)
         {
            _loc3_ = this.m_vIntervals[_loc4_];
            if(_loc3_ == 0)
            {
               _loc2_ = _loc2_ + m_dwInterval;
            }
            else
            {
               _loc2_ = _loc2_ + _loc3_;
            }
            _loc4_++;
         }
         return _loc2_;
      }
   }
}
