package  subGame.chiyue2
{
   import flash.utils.ByteArray;
   
   public class CloneUtil
   {
      
      private static var byteArray:ByteArray = new ByteArray();
       
      
      public function CloneUtil()
      {
         super();
      }
      
      public static function copyDynamicObject(param1:Object, param2:Object) : *
      {
         if(param1 == null || param2 == null)
         {
            return null;
         }
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for(var _loc3_ in param1)
         {
            param2[_loc3_] = param1[_loc3_];
         }
         return param2;
      }
      
      public static function shallowClone(param1:Object) : *
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return null;
         }
         _loc3_ = {};
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for(var _loc2_ in param1)
         {
            _loc3_[_loc2_] = param1[_loc2_];
         }
         return _loc3_;
      }
      
      public static function deepClone(param1:Object) : *
      {
         if(param1 == null)
         {
            return null;
         }
         byteArray.position = 0;
         byteArray.writeObject(param1);
         byteArray.position = 0;
         return byteArray.readObject();
      }
   }
}
