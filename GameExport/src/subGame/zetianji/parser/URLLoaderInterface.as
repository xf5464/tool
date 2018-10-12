package  subGame.zetianji.parser
{
   import flash.utils.ByteArray;
   
   public interface URLLoaderInterface
   {
       
      
      function set m_boloaded(param1:Boolean) : void;
      
      function get m_boloaded() : Boolean;
      
      function loadbytes(param1:ByteArray) : void;
   }
}
