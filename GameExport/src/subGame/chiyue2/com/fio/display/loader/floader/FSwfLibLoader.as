package subGame.chiyue2.com.fio.display.loader.floader
{
   import flash.display.Loader;
   import flash.events.Event;
   import flash.utils.ByteArray;
   
   public class FSwfLibLoader extends FBytesLoader
   {
       
      
      protected var bytesLoader:Loader;
      
      public function FSwfLibLoader()
      {
         super();
         bytesLoader = new Loader();
         bytesLoader.contentLoaderInfo.addEventListener("complete",restoreDone);
      }
      
      override public function destory() : void
      {
         super.destory();
         loader = null;
         bytesLoader.contentLoaderInfo.removeEventListener("complete",restoreDone);
         try
         {
            bytesLoader.close();
         }
         catch(err:*)
         {
         }
         bytesLoader = null;
      }
      
      override protected function doLoad(param1:String) : void
      {
         loader.load(_request);
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
         bytesLoader.loadBytes(param1.data,context);
      }
      
      protected function restoreDone(param1:Event) : void
      {
         if(_isSwfLib)
         {
            bytesLoader.unloadAndStop(false);
         }
         if(comFun is Function)
         {
            comFun(this,!!_isSwfLib?null:param1.target.content);
         }
      }
      
      override public function unloadAndStop() : void
      {
         bytesLoader.unloadAndStop(false);
      }
   }
}
