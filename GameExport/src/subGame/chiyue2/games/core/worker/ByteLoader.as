package subGame.chiyue2.games.core.worker
{
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.net.URLStream;
   import flash.utils.ByteArray;
   
   public final class ByteLoader
   {
       
      
      public var errorFun:Function = null;
      
      public var progressFun:Function = null;
      
      public var completeFun:Function = null;
      
      private var loader:URLStream = null;
      
      private var request:URLRequest = null;
      
      private var _isUseOnce:Boolean;
      
      public function ByteLoader(param1:Boolean = false)
      {
         super();
         this._isUseOnce = param1;
         this.request = new URLRequest();
         this.loader = new URLStream();
         this.loader.addEventListener("ioError",this.onError);
         this.loader.addEventListener("securityError",this.onError);
         this.loader.addEventListener("progress",this.onProgress);
         this.loader.addEventListener("complete",this.onComplete);
      }
      
      public final function destory() : void
      {
         if(null == this.loader)
         {
            return;
         }
         this.close();
         this.loader.removeEventListener("ioError",this.onError);
         this.loader.removeEventListener("securityError",this.onError);
         this.loader.removeEventListener("progress",this.onProgress);
         this.loader.removeEventListener("complete",this.onComplete);
         this.errorFun = null;
         this.progressFun = null;
         this.completeFun = null;
         this.request = null;
         this.loader = null;
      }
      
      public final function close() : void
      {
         if(null != this.loader)
         {
            if(this.loader.connected)
            {
               this.loader.close();
            }
            this.request.url = "";
         }
      }
      
      public final function isLoading() : Boolean
      {
         if(null == this.loader)
         {
            return false;
         }
         return this.loader.connected;
      }
      
      public final function load(param1:String, param2:Function = null, param3:Function = null, param4:Function = null, param5:String = "") : void
      {
         if(null != this.loader)
         {
            if(false == this.loader.connected)
            {
               if(param2 is Function)
               {
                  this.completeFun = param2;
               }
               if(param3 is Function)
               {
                  this.progressFun = param3;
               }
               if(param4 is Function)
               {
                  this.errorFun = param4;
               }
               this.request.url = param1;
               this.loader.load(this.request);
            }
         }
      }
      
      private final function callback(param1:Function, ... rest) : void
      {
         if(param1 is Function)
         {
            param1.apply(null,rest);
         }
      }
      
      private final function onError(param1:Event = null) : void
      {
         this.close();
         this.callback(this.errorFun,param1 != null?param1["text"]:[]);
         if(this._isUseOnce)
         {
            this.destory();
         }
      }
      
      private final function onProgress(param1:ProgressEvent) : void
      {
         this.callback(this.progressFun,Math.round(100 * param1.bytesLoaded / param1.bytesTotal) * 0.01);
      }
      
      private final function onComplete(param1:Event) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         this.loader.readBytes(_loc2_);
         _loc2_.position = 0;
         this.close();
         this.callback(this.completeFun,_loc2_);
         _loc2_ = null;
         if(this._isUseOnce)
         {
            this.destory();
         }
      }
   }
}
