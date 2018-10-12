package subGame.chiyue2.com.fio.utils
{
   import flash.utils.Dictionary;
   
   public class FioNotify
   {
       
      
      private var eventDic:Dictionary;
      
      public function FioNotify()
      {
         this.eventDic = new Dictionary();
         super();
      }
      
      public final function getEvents() : Array
      {
         var _loc2_:String = null;
         var _loc1_:Array = [];
         for(_loc1_[_loc1_.length] in this.eventDic)
         {
         }
         return _loc1_;
      }
      
      public final function reset() : void
      {
         this.destory();
         this.eventDic = new Dictionary();
      }
      
      public final function destory() : void
      {
         var _loc1_:* = null;
         for(_loc1_ in this.eventDic)
         {
            this.removeEvent(_loc1_);
         }
      }
      
      public final function regist(param1:String, param2:Function) : void
      {
         var _loc3_:Array = this.eventDic[param1];
         _loc3_ = _loc3_ || [];
         _loc3_[_loc3_.length] = param2;
         this.eventDic[param1] = _loc3_;
      }
      
      public final function remove(param1:String, param2:Function) : void
      {
         var _loc4_:int = 0;
         var _loc3_:Array = this.eventDic[param1];
         if(null != _loc3_)
         {
            _loc4_ = _loc3_.indexOf(param2);
            if(_loc4_ > -1)
            {
               _loc3_.splice(_loc4_,1)[0] = null;
            }
            if(0 == _loc3_.length)
            {
               delete this.eventDic[param1];
            }
         }
      }
      
      public final function notifyEvent(param1:String, ... rest) : void
      {
         var _loc4_:Function = null;
         var _loc3_:Array = this.eventDic[param1];
         if(null != _loc3_)
         {
            for each(_loc4_ in _loc3_)
            {
               if(_loc4_ is Function)
               {
                  _loc4_.apply(null,rest);
               }
               _loc4_ = null;
            }
         }
      }
      
      public final function registEvents(param1:Function, param2:String, param3:String, ... rest) : void
      {
         rest.unshift(param3);
         rest.unshift(param2);
         var _loc5_:int = 0;
         var _loc6_:int = rest.length;
         while(_loc5_ < _loc6_)
         {
            this.regist(rest.shift(),param1);
            _loc5_++;
         }
      }
      
      public final function registCallbacks(param1:String, param2:Function, param3:Function, ... rest) : void
      {
         rest.unshift(param2);
         rest.unshift(param3);
         var _loc5_:int = 0;
         var _loc6_:int = rest.length;
         while(_loc5_ < _loc6_)
         {
            this.regist(param1,rest.shift());
            _loc5_++;
         }
      }
      
      public final function removeEvents(param1:Function, param2:String, param3:String, ... rest) : void
      {
         rest.unshift(param3);
         rest.unshift(param2);
         var _loc5_:int = 0;
         var _loc6_:int = rest.length;
         while(_loc5_ < _loc6_)
         {
            this.remove(rest.shift(),param1);
            _loc5_++;
         }
      }
      
      public final function removeEvent(param1:String) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Function = null;
         var _loc2_:Array = this.eventDic[param1];
         if(null != _loc2_)
         {
            _loc3_ = 0;
            _loc4_ = _loc2_.length;
            while(_loc3_ < _loc4_)
            {
               _loc5_ = _loc2_.shift();
               _loc5_ = null;
               _loc3_++;
            }
            this.eventDic[param1] = null;
            delete this.eventDic[param1];
         }
         _loc2_ = null;
      }
      
      public final function removeCallbacks(param1:String, param2:Function, param3:Function, ... rest) : void
      {
         rest.unshift(param2);
         rest.unshift(param3);
         var _loc5_:int = 0;
         var _loc6_:int = rest.length;
         while(_loc5_ < _loc6_)
         {
            this.remove(param1,rest.shift());
            _loc5_++;
         }
      }
   }
}
