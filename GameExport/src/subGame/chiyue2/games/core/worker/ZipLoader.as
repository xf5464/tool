package subGame.chiyue2.games.core.worker
{
   import subGame.chiyue2.com.fio.display.loader.zip.ZipReader;
   import flash.display.Loader;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   import subGame.chiyue2.games.core.worker.nochump.util.zip.ZipEntry;
   import subGame.chiyue2.games.core.worker.nochump.util.zip.ZipFile;
   
   public class ZipLoader
   {
       
      
      public var restorXmlFun:Function;
      
      public var restorOtherFun:Function;
      
      private var loader:ByteLoader;
      
      private var comFun:Function;
      
      private var errFun:Function;
      
      private var swfLoader:Loader;
      
      private var swfs:Array;
      
      private var bytec:LoaderContext;
      
      public function ZipLoader()
      {
         super();
         this.bytec = new LoaderContext();
         this.bytec.applicationDomain = ApplicationDomain.currentDomain;
         this.loader = new ByteLoader();
         this.swfLoader = new Loader();
         this.swfLoader.contentLoaderInfo.addEventListener("complete",this.checkSwfQueue);
      }
      
      private final function destory() : void
      {
         if(this.loader)
         {
            this.loader.destory();
         }
         this.loader = null;
         this.restorXmlFun = null;
         this.restorOtherFun = null;
         this.comFun = null;
         this.errFun = null;
         this.swfLoader.contentLoaderInfo.removeEventListener("complete",this.checkSwfQueue);
         this.swfLoader = null;
         this.swfs = null;
      }
      
      public final function load(param1:String, param2:Function, param3:Function = null, param4:Function = null) : void
      {
         if(null == this.loader)
         {
            return;
         }
         this.comFun = param2;
         this.errFun = param4;
         param2 = null;
         param3 = null;
         param4 = null;
      }
      
      private final function loadError(... rest) : void
      {
         this.callback(this.errFun);
         this.destory();
      }
      
      public final function restorFile2(param1:ByteArray, param2:Function = null) : void
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc7_:* = null;
         var _loc4_:int = 0;
         var _loc8_:ZipFile = new ZipFile(param1);
         var _loc6_:Array = [];
         this.swfs = [];
         _loc4_ = 0;
         while(_loc4_ < _loc8_.entries.length)
         {
            _loc3_ = _loc8_.entries[_loc4_];
            _loc5_ = _loc8_.getInput(_loc3_);
            _loc7_ = _loc3_.name.split(".")[1];
            if(_loc7_ == "swf")
            {
               trace("text",_loc3_.name);
               this.swfs.push(_loc5_);
            }
            else if(_loc7_ == "res")
            {
               this.restorOther(_loc3_.name.split(".")[0],_loc5_);
            }
            else if(_loc7_ == "xml")
            {
               this.restorXml(_loc3_.name.split(".")[0],_loc5_.toString());
            }
            else
            {
               this.restorOther(_loc3_.name.split(".")[0],_loc5_);
            }
            _loc4_++;
         }
         if(param2 is Function)
         {
            this.comFun = param2;
            this.loader.destory();
            this.loader = null;
         }
         this.checkSwfQueue();
         param1.clear();
         param1 = null;
      }
      
      public final function restorFile(param1:ByteArray, param2:Function = null) : void
      {
         var _loc3_:* = null;
         var _loc7_:int = 0;
         var _loc6_:int = 0;
         var _loc4_:* = null;
         var _loc8_:* = null;
         var _loc5_:* = null;
         if(param1)
         {
            _loc3_ = new ZipReader(param1);
            _loc6_ = _loc3_.names.length;
            this.swfs = [];
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc4_ = _loc3_.names[_loc7_];
               _loc8_ = _loc4_.split(".")[1];
               _loc5_ = _loc3_.getFile(_loc4_);
               if(_loc8_ == "swf")
               {
                  this.swfs.push(_loc5_);
               }
               else if(_loc8_ == "res")
               {
                  this.restorOther(_loc4_.split(".")[0],_loc5_);
               }
               else if(_loc8_ == "xml")
               {
                  this.restorXml(_loc4_.split(".")[0],_loc5_.toString());
               }
               else
               {
                  this.restorOther(_loc4_.split(".")[0],_loc5_);
               }
               _loc5_ = null;
               _loc7_++;
            }
            _loc3_ = null;
            if(param2 is Function)
            {
               this.comFun = param2;
               this.loader.destory();
               this.loader = null;
            }
            this.checkSwfQueue();
         }
         else
         {
            this.callback(this.comFun);
            this.destory();
         }
         param1.clear();
         param1 = null;
      }
      
      private final function callback(param1:Function, ... rest) : void
      {
         var _loc3_:* = null;
         if(param1 is Function)
         {
            param1.apply(null,rest);
         }
         param1 = null;
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
            this.swfLoader.unloadAndStop(true);
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
      
      public function unloadAndStop() : void
      {
         if(this.loader)
         {
            this.loader.destory();
         }
         if(this.swfLoader)
         {
            this.swfLoader.unloadAndStop(true);
         }
      }
   }
}
