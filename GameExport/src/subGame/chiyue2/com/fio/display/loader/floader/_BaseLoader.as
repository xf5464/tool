package subGame.chiyue2.com.fio.display.loader.floader
{
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   class _BaseLoader
   {
      
      protected static const context:LoaderContext = new LoaderContext(false,ApplicationDomain.currentDomain);
      
      private static const sp:Sprite = new Sprite();
      
      private static const funDic:Vector.<Function> = new Vector.<Function>();
      
      {
         context.allowCodeImport = true;
         sp.addEventListener("exitFrame",onCheck);
      }
      
      protected var DELAY_TIME:int = 30000;
      
      public var errFun:Function;
      
      public var comFun:Function;
      
      public var proFun:Function;
      
      public var isLoading:Boolean = false;
      
      public var key = null;
      
      protected var _isDestoried:Boolean = false;
      
      protected var _request:URLRequest;
      
      protected var _url:String;
      
      protected var _listener:EventDispatcher;
      
      protected var _isSwfLib:Boolean = false;
      
      private var _percent:Number;
      
      private var _delayid:uint = 0;
      
      private var _index:int;
      
      private var queueComplete:Array;
      
      function _BaseLoader(param1:EventDispatcher)
      {
         super();
         _request = new URLRequest();
         if(null != param1)
         {
            _listener = param1;
            _listener.addEventListener("ioError",onError);
            _listener.addEventListener("securityError",onError);
            _listener.addEventListener("progress",onProgress);
            _listener.addEventListener("complete",onBaseComplete);
         }
         queueComplete = [];
         funDic[funDic.length] = notifyComplete;
      }
      
      private static function onCheck(... rest) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = funDic.length;
         _loc3_;
         while(_loc3_ < _loc2_)
         {
            funDic[_loc3_]();
            _loc3_++;
         }
      }
      
      public function destory() : void
      {
         if(_isDestoried)
         {
            return;
         }
         reset();
         proFun = null;
         comFun = null;
         errFun = null;
         if(null != _listener)
         {
            _listener.removeEventListener("ioError",onError);
            _listener.removeEventListener("securityError",onError);
            _listener.removeEventListener("progress",onProgress);
            _listener.removeEventListener("complete",onBaseComplete);
         }
         _listener = null;
         _request = null;
         _isSwfLib = false;
         _isDestoried = true;
         var _loc1_:int = funDic.indexOf(notifyComplete);
         if(_loc1_ > -1)
         {
            funDic.splice(_loc1_,1);
         }
         queueComplete = null;
      }
      
      public function reset() : void
      {
         if(_isDestoried)
         {
            return;
         }
         clearTime();
         isLoading = false;
         _url = null;
         key = null;
      }
      
      public final function getLoadUrl() : String
      {
         return _url;
      }
      
      public final function load(param1:String, param2:Boolean = false) : void
      {
         if(_isDestoried)
         {
            return;
         }
         if(null == param1 || 0 == param1.length)
         {
            return;
         }
         else if(null == _listener)
         {
            return;
         }
         else if(isLoading)
         {
            return;
         }
         else
         {
            _url = param1;
            _isSwfLib = param2;
            isLoading = true;
            _request.url = param1;
            startLoad(param1);
            return;
         }
      }
      
      private final function startLoad(param1:String) : void
      {
         clearTime();
         _delayid = setTimeout(onDelay,DELAY_TIME);
         doLoad(param1);
      }
      
      private final function onBaseComplete(param1:Event) : void
      {
         clearTime();
         queueComplete[queueComplete.length] = param1.target;
      }
      
      private final function clearTime() : void
      {
         _percent = 0;
         _index = 0;
         if(_delayid > 0)
         {
            clearTimeout(_delayid);
         }
         _delayid = 0;
      }
      
      private final function onDelay(... rest) : void
      {
         trace("delay:",_url);
         if(0 == _index && _percent > 0.9)
         {
            _index = 1;
            if(_delayid > 0)
            {
               clearTimeout(_delayid);
            }
            _delayid = setTimeout(onDelay,DELAY_TIME);
            return;
         }
         clearTime();
         close();
         onError();
      }
      
      private final function notifyComplete() : void
      {
         if(queueComplete.length > 0)
         {
            onComplete(queueComplete.shift());
         }
      }
      
      protected function close() : void
      {
      }
      
      protected function doLoad(param1:String) : void
      {
      }
      
      protected final function onProgress(param1:ProgressEvent) : void
      {
         _percent = param1.bytesLoaded / param1.bytesTotal;
         if(proFun is Function)
         {
            try
            {
               proFun(this,_percent);
               return;
            }
            catch(err:*)
            {
               trace(this,"Progress Error:",err);
               return;
            }
         }
      }
      
      protected final function onError(... rest) : void
      {
         if(errFun is Function)
         {
            try
            {
               errFun(this);
               return;
            }
            catch(err:*)
            {
               trace(this,"Error Error:",err);
               return;
            }
         }
      }
      
      protected function onComplete(param1:*) : void
      {
         if(comFun is Function)
         {
            try
            {
               comFun(this,param1.content);
               return;
            }
            catch(err:*)
            {
               trace(this,"Complete Error:",err);
               return;
            }
         }
      }
      
      public function unloadAndStop() : void
      {
      }
   }
}
