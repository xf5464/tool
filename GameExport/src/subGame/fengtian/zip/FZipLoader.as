package subGame.fengtian.zip
{
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   
   public class FZipLoader
   {
       
      
      public var restorXmlFun:Function;
      
      public var restorOtherFun:Function;
      
      public var restorCacheFun:Function;
      
      public var restorLYTFun:Function;
      
      public var restorAnalyzeFun:Function;
      
      private var comFun:Function;
      
      private var errFun:Function;
      
      private var swfLoader:Loader;
      
      private var swfs:Array;
      
      private var bytec:LoaderContext;
      
      public function FZipLoader()
      {
         super();
         this.bytec = new LoaderContext();
         this.bytec.applicationDomain = ApplicationDomain.currentDomain;
         this.swfLoader = new Loader();
         this.swfLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.onError);
         this.swfLoader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onError);
         this.swfLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.checkSwfQueue);
      }
      
      protected function onError(param1:Event) : void
      {
      }
      
      private final function destory() : void
      {
         this.restorXmlFun = null;
         this.restorOtherFun = null;
         this.restorCacheFun = null;
         this.comFun = null;
         this.errFun = null;
         this.swfLoader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.onError);
         this.swfLoader.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onError);
         this.swfLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.checkSwfQueue);
         this.swfLoader = null;
         this.swfs = null;
      }
      
      private final function loadError(... rest) : void
      {
         this.callback(this.errFun);
         this.destory();
      }
      
      public final function restorFile(param1:ByteArray, param2:Function = null, param3:Array = null) : void
      {
         var _loc4_:ZipReader = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:ByteArray = null;
         if(param1)
         {
            _loc4_ = new ZipReader(param1);
            _loc6_ = _loc4_.names.length;
            if(param3 == null)
            {
               this.swfs = [];
            }
            else
            {
               this.swfs = param3;
            }
            _loc5_ = 0;
            while(_loc5_ < _loc6_)
            {
               _loc7_ = _loc4_.names[_loc5_];
               _loc8_ = _loc7_.split(".")[1];
               _loc9_ = _loc4_.getFile(_loc7_);
               if(_loc8_ == "swf")
               {
//                  this.swfs.push(_loc9_);
               }
               else if(_loc8_ == "xml")
               {
//                  this.restorXml(_loc7_.split(".")[0],_loc9_.toString());
               }
               else if(_loc8_ == "bak")
               {
//                  this.callback(this.restorCacheFun,_loc7_.split(".")[0],_loc9_);
               }
               else if(_loc8_ == "lyt")
               {
//                  this.callback(this.restorLYTFun,_loc7_.split(".")[0],_loc9_);
               }
               else if(_loc8_ == "rs")
               {
//                  this.callback(this.restorAnalyzeFun,_loc7_.split(".")[0],_loc9_);
               }
               else
               {
                  this.restorOther(_loc7_.split(".")[0],_loc9_);
               }
               _loc9_ = null;
               _loc5_++;
            }
            _loc4_ = null;
            if(param2 is Function)
            {
               this.comFun = param2;
            }
            this.checkSwfQueue();
         }
         else
         {
            this.callback(this.comFun);
            this.destory();
         }
         param1 = null;
      }
      
      private final function callback(param1:Function, ... rest) : void
      {
         if(param1 is Function)
         {
            param1.apply(null,rest);
         }
         param1 = null;
         rest = null;
      }
      
      private final function restorOther(param1:String, param2:ByteArray) : void
      {
         this.callback(this.restorOtherFun,param1,param2);
         param2 = null;
      }
      
      private final function restorXml(param1:String, param2:String) : void
      {
         this.callback(this.restorXmlFun,param1,param2);
         param2 = null;
      }
      
      private final function checkSwfQueue(... rest) : void
      {
         if(this.swfLoader)
         {
            this.swfLoader.unloadAndStop();
         }
         if(this.swfs && this.swfs.length > 0)
         {
            this.swfLoader.loadBytes(this.swfs.shift(),this.bytec);
         }
         else
         {
            this.callback(this.comFun);
            this.destory();
         }
      }
   }
}
