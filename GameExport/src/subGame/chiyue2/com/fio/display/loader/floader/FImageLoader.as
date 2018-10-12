package subGame.chiyue2.com.fio.display.loader.floader
{
   import flash.display.Loader;
   
   public class FImageLoader extends _BaseLoader
   {
       
      
      private var loader:Loader;
      
      public function FImageLoader()
      {
         DELAY_TIME = 20000;
         loader = new Loader();
         super(loader.contentLoaderInfo);
      }
      
      override public function destory() : void
      {
         super.destory();
         loader = null;
      }
      
      override protected function doLoad(param1:String) : void
      {
         loader.load(_request,context);
      }
      
      override protected function onComplete(param1:*) : void
      {
         if(_isSwfLib)
         {
            loader.unloadAndStop();
         }
         super.onComplete(param1);
      }
      
      override protected function close() : void
      {
         try
         {
            loader.close();
            return;
         }
         catch(err:*)
         {
            return;
         }
      }
      
      override public function unloadAndStop() : void
      {
         loader.unloadAndStop(false);
      }
   }
}
