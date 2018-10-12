package subGame.chiyue2.com.fio.display.loader.floader
{
   import subGame.chiyue2.com.fio.encrypt.FioEncrypt;
   import flash.utils.ByteArray;
   
   public class FEncryptLoader extends FSwfLibLoader
   {
       
      
      private var encrypter:FioEncrypt;
      
      public function FEncryptLoader()
      {
         super();
         encrypter = new FioEncrypt();
      }
      
      override protected function onComplete(param1:*) : void
      {
         var _loc2_:ByteArray = param1.data;
         if(_loc2_.length < 12)
         {
            trace("   [ERROR]",this,_url);
            onError();
            return;
         }
         bytesLoader.loadBytes(encrypter.decode(param1.data),context);
      }
      
      override public function unloadAndStop() : void
      {
         bytesLoader.unloadAndStop(false);
      }
   }
}
