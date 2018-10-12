package subGame.zetianji.parser
{
   import flash.utils.ByteArray;
   
   public class Png8PictureInfo
   {
       
      
      public var name:String = "";
      
      public var Width:int;
      
      public var Height:int;
      
      public var offx:int;
      
      public var offy:int;
      
      public var truewidth:int;
      
      public var trueheight:int;
      
      public var imageData:ByteArray;
      
      public function Png8PictureInfo(param1:ByteArray = null)
      {
         super();
         if(param1)
         {
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
         return 12;
      }
   }
}
