package subGame.chiyue2.com.fio.display.loader.zip
{
   import flash.errors.IOError;
   
   public class ZipError extends IOError
   {
       
      
      public function ZipError(param1:String = "", param2:int = 0)
      {
         super(param1,param2);
      }
   }
}
