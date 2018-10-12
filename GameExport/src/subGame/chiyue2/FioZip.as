package subGame.chiyue2
{
   import flash.display.Loader;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   
   public class FioZip
   {
       
      
      private const reg:RegExp = /.*?(\.swf)$/gi;
      
      private var queue:Array;
      
      private var _allDoneFun:Function;
      
      private var _parseFun:Function;
      
      private var _isUseOnce:Boolean;
      
      private var _isSwfing:Boolean;
      
      private var _isLast:Boolean;
      
      private var swfLoader:Loader;
      
      private var vecSwfBytes:Vector.<ByteArray>;
      
      private var ldContext:LoaderContext;
      
      private var internalid:uint;
      
      public function FioZip(param1:Function, param2:Function, param3:Boolean = true)
      {
         super();
         _allDoneFun = param1;
         _parseFun = param2;
         _isUseOnce = param3;
      }
      
      public final function destory() : void
      {
         if(internalid > 0)
         {
            clearInterval(internalid);
         }
         internalid = 0;
         queue = null;
         _allDoneFun = null;
         _parseFun = null;
         if(null != swfLoader)
         {
            swfLoader.contentLoaderInfo.removeEventListener("complete",checkSwfQueue);
            swfLoader.unloadAndStop();
         }
         swfLoader = null;
         vecSwfBytes = null;
         ldContext = null;
      }
      
      public final function uncompress(param1:ByteArray) : void
      {
         param1.endian = "littleEndian";
         param1.uncompress();
         queue = param1.readObject();
         param1.clear();
         if(0 == internalid)
         {
            internalid = setInterval(parseQueue,20);
         }
      }
      
      private final function parseQueue(... rest) : void
      {
         var _loc2_:* = null;
         if(null != queue && queue.length > 0)
         {
            if(false == _isSwfing)
            {
               _loc2_ = queue.shift();
               if(1 == _loc2_[0].match(reg).length)
               {
                  if(null == swfLoader)
                  {
                     vecSwfBytes = new Vector.<ByteArray>();
                     ldContext = new LoaderContext();
                     ldContext.applicationDomain = ApplicationDomain.currentDomain;
                     ldContext.allowCodeImport = true;
                     swfLoader = new Loader();
                     swfLoader.contentLoaderInfo.addEventListener("complete",checkSwfQueue);
                  }
                  vecSwfBytes[vecSwfBytes.length] = _loc2_[1];
                  checkSwfQueue();
               }
               else if(_parseFun is Function)
               {
                  _parseFun.apply(null,_loc2_);
               }
            }
         }
         else
         {
            if(!_isLast)
            {
               _isLast = true;
               return;
            }
            if(_allDoneFun is Function)
            {
               _allDoneFun();
            }
            if(_isUseOnce)
            {
               destory();
            }
         }
      }
      
      private final function checkSwfQueue(... rest) : void
      {
         if(null != swfLoader)
         {
            swfLoader.unloadAndStop();
         }
         if(null != vecSwfBytes && vecSwfBytes.length > 0)
         {
            _isSwfing = true;
            swfLoader.loadBytes(vecSwfBytes.shift(),ldContext);
         }
         else
         {
            _isSwfing = false;
         }
      }
      
      private final function log(param1:String) : void
      {
      }
   }
}
