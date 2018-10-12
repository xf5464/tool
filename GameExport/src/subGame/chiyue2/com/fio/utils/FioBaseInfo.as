package subGame.chiyue2.com.fio.utils
{
   import flash.utils.describeType;
   
   public class FioBaseInfo
   {
       
      
      private var _proNames:Array;
      
      private var _className:String;
      
      public function FioBaseInfo()
      {
         super();
      }
      
      public function destory() : void
      {
      }
      
      private final function analyzePorperties() : void
      {
         var _loc1_:XML = describeType(this);
         this._className = _loc1_.@name;
         this._className = this._className.split("::")[1];
         this._proNames = [];
         var _loc2_:XMLList = _loc1_.variable;
         var _loc3_:int = 0;
         var _loc4_:int = _loc2_.length();
         while(_loc3_ < _loc4_)
         {
            this._proNames.push(String(_loc2_[_loc3_].@name));
            _loc3_++;
         }
         this._proNames.sort();
         _loc2_ = null;
         _loc1_ = null;
      }
      
      public final function toString() : String
      {
         var _loc4_:String = null;
         if(null == this._proNames)
         {
            this.analyzePorperties();
         }
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         var _loc3_:int = this._proNames.length;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this._proNames[_loc2_];
            if(hasOwnProperty(_loc4_))
            {
               _loc1_.push(_loc4_ + ":" + this[_loc4_]);
            }
            _loc2_++;
         }
         var _loc5_:String = "";
         if(_loc1_.length)
         {
            _loc5_ = "{" + _loc1_.join(", ") + "}";
         }
         _loc4_ = null;
         _loc1_ = null;
         return "[" + this._className + "]" + _loc5_;
      }
      
      public function parse(param1:Object) : void
      {
         var _loc2_:* = null;
         for(_loc2_ in param1)
         {
            if(hasOwnProperty(_loc2_))
            {
               this[_loc2_] = param1[_loc2_];
            }
         }
         param1 = null;
      }
      
      public final function setAttributesByXml(param1:XML, param2:Object, param3:Boolean = true) : Object
      {
         var _loc4_:Object = null;
         var _loc5_:String = null;
         for each(_loc4_ in param1.attributes())
         {
            _loc5_ = _loc4_.name();
            if(param3)
            {
               if(false == param2.hasOwnProperty(_loc5_))
               {
                  continue;
               }
            }
            param2[_loc5_] = _loc4_;
         }
         return param2;
      }
   }
}
