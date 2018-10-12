package subGame.zetianji.parser
{
   import flash.utils.ByteArray;
   
   public class VfmtPictureInfo
   {
       
      
      public var name:String = "";
      
      public var bByte:int = 0;
      
      public var Width:int;
      
      public var Height:int;
      
      public var offx:int;
      
      public var offy:int;
      
      public var truewidth:int;
      
      public var trueheight:int;
      
      public var imageData:ByteArray;
      
      public function VfmtPictureInfo(param1:ByteArray)
      {
         super();
         if(param1)
         {
            bByte = param1.readUnsignedByte();
            Width = param1.readUnsignedShort();
            Height = param1.readUnsignedShort();
            offx = param1.readUnsignedShort();
            offy = param1.readUnsignedShort();
            truewidth = param1.readUnsignedShort();
            trueheight = param1.readUnsignedShort();
         }
      }
      
      public static function size() : int
      {
         return 13;
      }
      
      public function write(param1:ByteArray) : void
      {
         param1.writeByte(bByte);
         param1.writeShort(Width);
         param1.writeShort(Height);
         param1.writeShort(offx);
         param1.writeShort(offy);
         param1.writeShort(truewidth);
         param1.writeShort(trueheight);
      }
   }
}
