package subGame.chiyue2.com.fio.display.loader.floader
{
   public class FQueueLoader
   {
       
      
      private const loadedContents:Object = {};
      
      private const MAX_ERROR_TIMES:int = 10;
      
      private const errorUrls:Object = {};
      
      public var comFunction:Function;
      
      public var errFunction:Function;
      
      private var tasks:Object;
      
      private var queueUrls:Array;
      
      private var loaders:Vector.<_BaseLoader>;
      
      private var _queueNum:int;
      
      private var _isDestoried:Boolean = false;
      
      public function FQueueLoader(param1:int = 2, param2:int = 0)
      {
         var _loc3_:* = null;
         tasks = {};
         queueUrls = [];
         super();
         _queueNum = param1;
         if(_queueNum < 1)
         {
            _queueNum = 1;
         }
         if(_queueNum > 4)
         {
            _queueNum = 4;
         }
         loaders = new Vector.<_BaseLoader>();
         var _loc4_:int = 0;
         _loc4_;
         while(_loc4_ < _queueNum)
         {
            switch(int(param2))
            {
               case 0:
                  _loc3_ = new FSwfLibLoader();
                  break;
               case 1:
                  _loc3_ = new FImageLoader();
                  break;
               case 2:
                  _loc3_ = new FEncryptLoader();
                  break;
               case 3:
                  _loc3_ = new FBytesLoader();
            }
            _loc3_.errFun = onError;
            _loc3_.proFun = onProgress;
            _loc3_.comFun = onComplete;
            loaders[_loc4_] = _loc3_;
            _loc4_++;
         }
      }
      
      private final function destory() : void
      {
         var _loc1_:* = null;
         if(_isDestoried)
         {
            return;
         }
         clearTasks();
         tasks = null;
         queueUrls = null;
         var _loc2_:int = 0;
         _loc2_;
         while(_loc2_ < _queueNum)
         {
            _loc1_ = loaders.shift();
            _loc1_.destory();
            _loc2_++;
         }
         loaders = null;
         _isDestoried = true;
         comFunction = null;
         errFunction = null;
      }
      
      public final function clearTasks() : void
      {
         var _loc1_:* = null;
         if(_isDestoried)
         {
            return;
         }
         queueUrls.length = 0;
         var _loc3_:int = 0;
         var _loc2_:* = tasks;
         for each(_loc1_ in tasks)
         {
            if(false == _loc1_.isLoading)
            {
               _loc1_.recyle();
            }
         }
         tasks = {};
      }
      
      public final function delLoad(param1:String) : void
      {
         var _loc4_:* = null;
         if(_isDestoried)
         {
            return;
         }
         if(null == param1)
         {
            return;
         }
         var _loc2_:String = getRealUrl(param1);
         var _loc3_:int = queueUrls.indexOf(_loc2_);
         if(_loc3_ > -1)
         {
            queueUrls.splice(_loc3_,1);
         }
         if(tasks)
         {
            _loc4_ = tasks[_loc2_];
            if(null != _loc4_)
            {
               if(_loc4_.isLoading)
               {
                  return;
               }
               _loc4_.recyle();
               delete tasks[_loc2_];
            }
         }
      }
      
      public final function load(param1:String, param2:String = null, param3:Boolean = true, param4:Boolean = false, param5:Function = null, param6:Function = null, param7:Function = null) : void
      {
         var _loc12_:* = null;
         if(_isDestoried)
         {
            return;
         }
         if(null == param1 || 0 == param1.length)
         {
            return;
         }
         else
         {
            var _loc8_:String = getRealUrl(param1);
            var _loc9_:int = errorUrls[_loc8_];
            if(_loc9_ > 10)
            {
               return;
            }
            var _loc11_:* = loadedContents[_loc8_];
            if(null != _loc11_)
            {
               if(comFunction is Function)
               {
                  comFunction(_loc11_.content,param2);
               }
               if(param5 is Function)
               {
                  param5(_loc11_.content,param2);
               }
               return;
            }
            if(tasks == null)
            {
               tasks = {};
            }
            _loc12_ = tasks[_loc8_];
            var _loc10_:Boolean = false;
            if(null != _loc12_)
            {
               if(null == _loc12_.key)
               {
                  _loc12_.key = param2;
               }
               _loc10_ = true;
            }
            else
            {
               _loc12_ = _TaskInfo.getInfo();
               _loc12_.url = param1;
               _loc12_.realUrl = _loc8_;
               if(null != param2)
               {
                  _loc12_.key = param2;
               }
               _loc12_.isSaveContent = param3;
               _loc12_.isSwfLib = param4;
               tasks[_loc8_] = _loc12_;
               queueUrls[queueUrls.length] = _loc8_;
            }
            _loc12_.addCompleteFun(param5);
            _loc12_.addProgressFun(param6);
            _loc12_.addErrorFun(param7);
            if(false == _loc10_)
            {
               checkQueue();
            }
            return;
         }
      }
      
      private final function getRealUrl(param1:String) : String
      {
         return param1.replace(/^(.*?)\?.*$/gi,"$1").toLowerCase();
      }
      
      private final function checkQueue() : void
      {
         var _loc2_:* = null;
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc6_:* = null;
         if(_isDestoried)
         {
            return;
         }
         if(true)
         {
            _loc5_;
            while(_loc5_ < _queueNum)
            {
               _loc2_ = loaders[_loc5_];
               _loc2_.unloadAndStop();
               trace("checkQueue unloadAndStop",_loc2_.getLoadUrl());
               _loc5_++;
            }
            return;
         }
         if(tasks == null)
         {
            tasks = {};
         }
         var _loc1_:int = queueUrls.length;
         if(0 == _loc1_)
         {
            return;
         }
         _loc5_ = 0;
         _loc5_;
         while(_loc5_ < _queueNum)
         {
            _loc3_ = loaders[_loc5_];
            if(false == _loc3_.isLoading)
            {
               _loc4_ = queueUrls.shift();
               _loc6_ = tasks[_loc4_];
               if(null != _loc6_)
               {
                  if(_loc6_.isEmpty())
                  {
                     _loc6_.recyle();
                  }
                  else
                  {
                     _loc6_.isLoading = true;
                     _loc3_.key = _loc6_;
                     _loc3_.load(_loc6_.url,_loc6_.isSwfLib);
                     return;
                  }
               }
            }
            _loc5_++;
         }
      }
      
      private final function onError(param1:_BaseLoader) : void
      {
         if(_isDestoried)
         {
            return;
         }
         var _loc2_:String = getRealUrl(param1.getLoadUrl());
         var _loc4_:_TaskInfo = param1.key;
         if(null != _loc4_ && false == _loc4_.isEmpty())
         {
            if(errFunction is Function)
            {
               errFunction(_loc4_.url,_loc4_.key);
            }
            _loc4_.callError();
            _loc4_.recyle();
            delete tasks[_loc2_];
         }
         var _loc3_:int = errorUrls[_loc2_];
         _loc3_ = _loc3_ + 1;
         errorUrls[_loc2_] = _loc3_;
         param1.reset();
         checkQueue();
      }
      
      private final function onProgress(param1:_BaseLoader, param2:Number) : void
      {
         if(_isDestoried)
         {
            return;
         }
         var _loc3_:_TaskInfo = param1.key;
         if(null != _loc3_ && false == _loc3_.isEmpty())
         {
            _loc3_.callProgress(param2);
         }
      }
      
      private final function onComplete(param1:_BaseLoader, param2:*) : void
      {
         if(_isDestoried)
         {
            return;
         }
         var _loc3_:String = getRealUrl(param1.getLoadUrl());
         var _loc4_:_TaskInfo = param1.key;
         if(null != _loc4_ && false == _loc4_.isEmpty())
         {
            if(_loc4_.isSwfLib)
            {
               loadedContents[_loc4_.realUrl] = {
                  "key":_loc4_.key,
                  "content":null
               };
            }
            else if(_loc4_.isSaveContent)
            {
               loadedContents[_loc4_.realUrl] = {
                  "key":_loc4_.key,
                  "content":param2
               };
            }
            if(comFunction is Function)
            {
               comFunction(param2,_loc4_.key);
            }
            _loc4_.callComplete(param2);
            _loc4_.recyle();
            delete tasks[_loc3_];
         }
         else
         {
            trace("    加载信息丢失");
         }
         param1.reset();
         checkQueue();
      }
   }
}
