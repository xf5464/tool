package subGame.chiyue2.utils
{
   import flash.display.Stage;
   import flash.events.Event;
   
   public class MethodTool
   {
      
      public static var enable:Boolean = true;
      
      private static var _instance:MethodTool;
      
      private static var isBehind:Boolean = false;
       
      
      private var _methodList:Vector.<MethodItem>;
      
      private var _methodListMuti:Vector.<MethodItem>;
      
      private var _cout:int;
      
      private var _sceneCout:int;
      
      private var _lastTick:int;
      
      private var pool:Array;
      
      public function MethodTool()
      {
         super();
         _methodList = new Vector.<MethodItem>();
         _methodListMuti = new Vector.<MethodItem>();
         _cout = 0;
         _sceneCout = 0;
         pool = [];
      }
      
      public static function init(param1:Stage) : void
      {
         if(!_instance)
         {
            _instance = new MethodTool();
            param1.addEventListener("enterFrame",_instance.onEnterFrame);
            param1.addEventListener("activate",activeteEvent);
            param1.addEventListener("deactivate",activeteEvent);
         }
      }
      
      protected static function activeteEvent(param1:Event) : void
      {
         isBehind = param1.type == "deactivate";
      }
      
      public static function add(param1:Function, param2:Boolean, ... rest) : void
      {
         if(enable)
         {
            _instance.add(param1,param2,rest);
         }
         else
         {
            param1.apply(null,rest);
         }
      }
      
      public static function add2(param1:Function, param2:Boolean, param3:Array) : void
      {
         _instance.add(param1,param2,param3);
      }
      
      private function recycle(param1:MethodItem) : void
      {
         param1.dispose();
         pool.push(param1);
      }
      
      private function getItem() : MethodItem
      {
         if(pool.length)
         {
            return pool.pop();
         }
         return new MethodItem();
      }
      
      private function add(param1:Function, param2:Boolean, param3:Array) : void
      {
         var _loc4_:MethodItem = getItem();
         _loc4_.fun = param1;
         _loc4_.params = param3;
         if(param2)
         {
            _methodListMuti.unshift(_loc4_);
         }
         else
         {
            _methodList.unshift(_loc4_);
         }
         _cout = _cout + 1;
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 5;
         if(_cout > 0)
         {
            while(_loc3_ > 0)
            {
               if(_methodListMuti.length > 0)
               {
                  _loc2_ = _methodListMuti.pop();
                  _cout = _cout - 1;
                  _loc2_.fun.apply(null,_loc2_.params);
                  recycle(_loc2_);
                  _loc3_--;
                  continue;
               }
               break;
            }
            if(_methodList.length > 0)
            {
               _loc2_ = _methodList.pop();
               _cout = _cout - 1;
               _loc2_.fun.apply(null,_loc2_.params);
               recycle(_loc2_);
               _loc3_--;
            }
         }
      }
   }
}

class MethodItem
{
    
   
   public var fun:Function;
   
   public var params:Array;
   
   function MethodItem()
   {
      super();
   }
   
   public function dispose() : void
   {
      fun = null;
      params = null;
   }
}
