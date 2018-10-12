package subGame.zetianji.parser
{
   import flash.utils.ByteArray;
   
   public class VfmtStruct
   {
       
      
      public var name:String = "VFMT";
      
      public var ver:int = 0;
      
      public var count:int = 0;
      
      public var headsize:int = 0;
      
      public function VfmtStruct(param1:ByteArray)
      {
         super();
         read(param1);
      }
      
      public function read(param1:ByteArray) : void
      {
         if(param1)
         {
            name = param1.readMultiByte(4,"gb2312");
            ver = param1.readUnsignedByte();
            count = param1.readUnsignedInt();
            headsize = param1.readUnsignedInt();
         }
      }
      
      public function write(param1:ByteArray) : void
      {
         if(param1)
         {
            param1.writeMultiByte(name,"gb2312");
            param1.writeByte(ver);
            param1.writeUnsignedInt(count);
            param1.writeUnsignedInt(headsize);
         }
      }
      
      public function size() : int
      {
         return 13;
      }
   }
}
