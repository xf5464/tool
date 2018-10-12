package subGame.chiyue2.games.core.worker
{
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   
   public class RestoreBytesToFile
   {
      
      private static var context:LoaderContext = null;
       
      
      private var queues:Array;
      
      private var task:Object;
      
      private var framesHandles:int;
      
      private var mHandle:Boolean;
      
      private var mLoaderList:Array;
      
      private var mLoadedNum:int;
      
      private var _claer:Boolean;
      
      public function RestoreBytesToFile()
      {
         var _loc1_:int = 0;
         mLoaderList = [];
         this.queues = [];
         super();
         if(null == context)
         {
            context = new LoaderContext(false);
            context.applicationDomain = new ApplicationDomain();
         }
         _loc1_ = 0;
         while(_loc1_ < 12)
         {
            mLoaderList.push(new VtyBytesLoader(recycle));
            _loc1_++;
         }
      }
      
      public function getLoader() : VtyBytesLoader
      {
         if(mLoaderList.length > 0)
         {
            return mLoaderList.shift();
         }
         return null;
      }
      
      public function recycle(param1:VtyBytesLoader) : void
      {
         mLoaderList.push(param1);
         this.checkQueue();
      }
      
      public final function restore(param1:ByteArray, param2:Function = null, param3:Boolean = false, param4:Boolean = false, param5:Array = null, errorCallback:Function = null, erroParam:Array = null) : void
      {
         this.queues[this.queues.length] = {
            "b":param1,
            "c":param2,
            "i":param3,
            "a":param5,
            "u":param4,
			"errorParam":erroParam,
			"error":errorCallback
         };
         this.checkQueue();
      }
      
      public final function check(param1:ByteArray) : Boolean
      {
         var _loc4_:* = null;
         var _loc3_:int = 0;
         var _loc2_:int = this.queues.length;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this.queues[_loc3_];
            if(_loc4_.b == param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function nextAction() : void
      {
         if(!this.task.i)
         {
         }
         this.task = null;
         this.checkQueue();
      }
      
      private function checkQueue() : void
      {
         if(this.queues.length == 0)
         {
            return;
         }
         var _loc1_:VtyBytesLoader = this.getLoader();
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:Object = this.queues.shift();
         _loc1_.read(_loc2_,context);
      }
      
      public function clear() : void
      {
         _claer = true;
      }
   }
}
