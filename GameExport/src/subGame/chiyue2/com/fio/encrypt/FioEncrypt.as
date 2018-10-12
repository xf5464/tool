package subGame.chiyue2.com.fio.encrypt
{
   import flash.utils.ByteArray;
   
   public class FioEncrypt
   {
       
      
      private const BIT_MIN:int = 4;
      
      private const BIT_MAX:int = 32;
      
      private const endian:String = "littleEndian";
      
      public function FioEncrypt()
      {
         super();
      }
      
      public final function encode(param1:int, param2:ByteArray) : ByteArray
      {
         if(0 == param1)
         {
            param1 = Math.random() * (32 - 4) + 4 >> 0;
         }
         if(param1 < 4)
         {
            param1 = 4;
         }
         if(param1 > 32)
         {
            param1 = 32;
         }
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.endian = "littleEndian";
         _loc3_.writeByte(param1);
         var _loc4_:uint = param2.length;
         _loc3_.writeUnsignedInt(_loc4_);
         param2.position = 0;
         var _loc5_:Vector.<ByteArray> = new Vector.<ByteArray>(param1);
         var _loc6_:int = 0;
         _loc6_;
         while(_loc6_ < param1)
         {
            _loc5_[_loc6_] = new ByteArray();
            _loc6_++;
         }
         _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            _loc5_[_loc6_ % param1].writeByte(param2.readByte());
            _loc6_++;
         }
         _loc6_ = 0;
         while(_loc6_ < param1)
         {
            _loc3_.writeUnsignedInt(_loc5_[_loc6_].length);
            _loc3_.writeBytes(_loc5_[_loc6_]);
            _loc6_++;
         }
         _loc3_.position = 0;
         _loc3_.compress();
         return _loc3_;
      }
      
      public final function decode(param1:ByteArray) : ByteArray
      {
         var _loc8_:int = 0;
         var _loc5_:* = 0;
         var _loc7_:int = 0;
         var _loc3_:* = 0;
         var _loc4_:* = undefined;
         var _loc2_:* = null;
         var _loc6_:* = null;
         if(null != param1)
         {
            param1.position = 0;
            param1.endian = "littleEndian";
            param1.uncompress();
            _loc8_ = param1.readByte();
            _loc5_ = uint(param1.readUnsignedInt());
            _loc7_ = 0;
            _loc4_ = new Vector.<ByteArray>(_loc8_);
            _loc7_ = 0;
            while(_loc7_ < _loc8_)
            {
               _loc4_[_loc7_] = new ByteArray();
               _loc3_ = uint(param1.readUnsignedInt());
               param1.readBytes(_loc4_[_loc7_],0,_loc3_);
               _loc4_[_loc7_].position = 0;
               _loc7_++;
            }
            _loc2_ = new ByteArray();
            _loc2_.endian = "littleEndian";
            _loc7_ = 0;
            while(_loc7_ < _loc5_)
            {
               _loc6_ = _loc4_[_loc7_ % _loc8_];
               if(_loc6_.bytesAvailable)
               {
                  _loc2_.writeByte(_loc6_.readByte());
               }
               _loc7_++;
            }
            _loc4_.length = 0;
            return _loc2_;
         }
         return null;
      }
   }
}
