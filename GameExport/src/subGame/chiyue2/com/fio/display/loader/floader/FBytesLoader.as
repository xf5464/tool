package subGame.chiyue2.com.fio.display.loader.floader
{
   import flash.net.URLLoader;
   
   public class FBytesLoader extends _BaseLoader
   {
       
      
      protected var loader:URLLoader;
      
      public function FBytesLoader()
      {
         loader = new URLLoader();
         loader.dataFormat = "binary";
         super(loader);
      }
      
      override public function destory() : void
      {
         super.destory();
         loader = null;
      }
      
      override protected function doLoad(param1:String) : void
      {
         loader.load(_request);
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
      
      override protected function onComplete(param1:*) : void
      {
         if(comFun is Function)
         {
            try
            {
               comFun(this,param1.data);
               return;
            }
            catch(err:*)
            {
               trace(this,"Complete Error:",err);
               return;
            }
         }
      }
      
      override public function unloadAndStop() : void
      {
         loader.close();
      }
   }
}
