package subGame.zetianji.parser
{
   import flash.utils.ByteArray;
   
   public class Png8PictureHead
   {
       
      
      public var name:String;
      
      public var dataoffset:uint;
	  
	  public var index:int = 0;
      
      public function Png8PictureHead(param1:ByteArray = null)
      {
         super();
         if(param1)
         {
            name = param1.readMultiByte(32,"gb2312");
            dataoffset = param1.readUnsignedInt();
         }
      }
   }
}
