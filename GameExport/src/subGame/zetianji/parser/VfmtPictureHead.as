package subGame.zetianji.parser
{
   import flash.utils.ByteArray;
   
   public class VfmtPictureHead
   {
       
      
      public var name:String;
      
      public var crc32:int;
      
      public var Length:uint;
      
      public var dataoffset:uint;
	  
	  public var index:int;
      
      public function VfmtPictureHead(param1:ByteArray = null)
      {
         super();
         if(param1)
         {
            name = param1.readMultiByte(32,"gb2312");
            crc32 = param1.readInt();
            Length = param1.readUnsignedInt();
            dataoffset = param1.readUnsignedInt();
         }
      }
      
      public function write(param1:ByteArray) : void
      {
         var _loc2_:int = 0;
         if(param1)
         {
            _loc2_ = param1.position;
            param1.writeMultiByte(name,"gb2312");
            param1.position = _loc2_ + 32;
            param1.writeInt(crc32);
            param1.writeUnsignedInt(Length);
            param1.writeUnsignedInt(dataoffset);
         }
      }
      
      public function size() : int
      {
         return 44;
      }
   }
}
