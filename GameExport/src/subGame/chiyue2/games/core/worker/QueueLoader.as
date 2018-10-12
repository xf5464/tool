package subGame.chiyue2.games.core.worker
{
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   
   public class QueueLoader
   {
       
      
      private const resourceDic:Array = [];
      
      private const taskDic:Vector.<_TaskInfo> = new Vector.<_TaskInfo>();
      
      private const minSize:int = 2;
      
      private const gcGap:int = 20;
      
      private var releaseTime:int = 1800000;
      
      private var lastCheckTime:int = 0;
      
      private var gcid:int = 0;
      
      private var history:Array;
      
      private var loaded:Array;
      
      private var clearTime:int = 0;
      
      private var queues:Vector.<_TaskInfo>;
      
      private var _restorer:RestoreBytesToFile;
      
      private var _loader:ByteLoader;
      
      private var task:_TaskInfo;
      
      public function QueueLoader()
      {
         this.history = [];
         this.loaded = [];
         this.queues = new Vector.<_TaskInfo>();
         super();
         this._loader = new ByteLoader();
         this._loader.completeFun = this.onComplete;
         this._loader.progressFun = this.onProgress;
         this._loader.errorFun = this.onError;
         this._restorer = new RestoreBytesToFile();
      }
      
      public final function setReleaseMinutes(param1:int) : void
      {
         if(param1 < 1)
         {
            param1 = 1;
         }
         this.releaseTime = 60000 * param1;
      }
      
      private final function checkRelease() : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         var _loc1_:int = getTimer();
         if(_loc1_ - this.lastCheckTime < this.releaseTime)
         {
            return;
         }
         this.lastCheckTime = _loc1_;
         var _loc5_:int = 0;
         var _loc4_:* = this.resourceDic;
         for(_loc3_ in this.resourceDic)
         {
            _loc2_ = this.resourceDic[_loc3_];
            if(_loc1_ - _loc2_ > this.releaseTime)
            {
               this.history[_loc3_] = null;
               delete this.history[_loc3_];
               delete this.loaded[_loc3_];
               delete this.resourceDic[_loc3_];
            }
         }
      }
      
      private final function getNewTask() : _TaskInfo
      {
         if(this.taskDic.length > 0)
         {
            return this.taskDic.shift();
         }
         return new _TaskInfo();
      }
      
      private final function gcTask(param1:_TaskInfo) : void
      {
         var _loc2_:int = this.taskDic.length;
         if(null == param1)
         {
            if(_loc2_ > 2)
            {
               this.taskDic.splice(2,_loc2_ - 2);
            }
            return;
         }
         param1.destory();
         this.taskDic[_loc2_] = param1;
      }
      
      public final function destory() : void
      {
         if(null != this._loader)
         {
            this.clearTasks();
            this._loader.close();
            this._loader.destory();
            this._loader = null;
            this._restorer = null;
            this.history = null;
            this.loaded = null;
            this.queues.length = 0;
            this.queues = null;
            this.clearTime = 0;
         }
      }
      
      public function isLoaded(param1:String) : Boolean
      {
         return this.history[this.getUrl(param1)] != null;
      }
      
      public function clearTasks() : void
      {
         if(null == this._loader)
         {
            return;
         }
         this.clearTime = getTimer();
         this._loader.close();
         var _loc1_:int = this.queues.length;
         while(true)
         {
            _loc1_--;
            if(_loc1_ <= -1)
            {
               break;
            }
            this.gcTask(this.queues.shift());
         }
         if(null != this.task)
         {
            this.gcTask(this.task);
         }
         this.task = null;
         this.checkRelease();
      }
      
      public function load(param1:String, param2:Boolean = false, param3:Boolean = true, param4:Function = null, param5:Function = null, param6:Function = null, param7:Boolean = false, ... rest) : void
      {
         var _loc11_:* = null;
         if(null == this._loader)
         {
            return;
         }
         var _loc9_:String = this.getUrl(param1);
         var _loc10_:Object = this.history[_loc9_];
         if(null != _loc10_)
         {
            this.resourceDic[_loc9_] = getTimer();
            rest.unshift(_loc10_);
            if(param4 is Function)
            {
               param4.apply(null,rest);
            }
            return;
         }
         if(null != this.loaded[_loc9_])
         {
            if(this.loaded[_loc9_] > 0)
            {
               if(param4 is Function)
               {
                  param4.apply(null,rest);
               }
            }
            return;
         }
         if(null != this.task)
         {
            if(_loc9_ == this.getUrl(this.task.url))
            {
               _loc11_ = this.task;
            }
         }
         if(null == _loc11_)
         {
            var _loc13_:int = 0;
            var _loc12_:* = this.queues;
            for each(_loc11_ in this.queues)
            {
               if(this.getUrl(_loc11_.url) != _loc9_)
               {
                  _loc11_ = null;
                  continue;
               }
               break;
            }
         }
         if(null == _loc11_)
         {
            _loc11_ = this.getNewTask();
            _loc11_.url = param1;
            _loc11_.args = rest;
            _loc11_.isSaveHistory = param3;
            _loc11_.isSwfLib = param2;
            _loc11_.isByteArray = param7;
            this.queues[this.queues.length] = _loc11_;
         }
         _loc11_.addFun(0,param4);
         _loc11_.addFun(1,param5);
         _loc11_.addFun(2,param6);
         this.checkQueue();
      }
      
      private final function getUrl(param1:String) : String
      {
         return param1.split("?")[0].toLowerCase();
      }
      
      private final function checkQueue() : void
      {
         if(null == this._loader)
         {
            return;
         }
         if(null != this.task)
         {
            return;
         }
         if(0 == this.queues.length)
         {
            this.gcid = this.gcid + 1;
            if(this.gcid > 20)
            {
               this.gcid = 0;
               this.gcTask(null);
            }
            return;
         }
         if(this._loader.isLoading())
         {
            return;
         }
         this.task = this.queues.shift();
         this._loader.load(this.task.url);
      }
      
      private final function endTask() : void
      {
         if(null != this.task)
         {
            this.gcTask(this.task);
         }
         this.task = null;
         this.checkQueue();
      }
      
      private final function onComplete(param1:ByteArray) : void
      {
         if(null == this._loader)
         {
            return;
         }
         if(this.task.isByteArray)
         {
            this.onSourceDone(param1,getTimer(),this.getUrl(this.task.url),this.task.isSwfLib,this.task.isSaveHistory,this.task.fcom != null?this.task.fcom.slice():null,this.task.args.slice());
         }
         else
         {
            this._restorer.restore(param1,this.onSourceDone,this.task.isSwfLib,false,[getTimer(),this.getUrl(this.task.url),this.task.isSwfLib,this.task.isSaveHistory,this.task.fcom != null?this.task.fcom.slice():null,this.task.args.slice()]);
         }
         this.endTask();
      }
      
      private final function onSourceDone(param1:*, param2:int, param3:String, param4:Boolean, param5:Boolean, param6:Array, param7:Array) : void
      {
         var _loc8_:int = 0;
         if(param5)
         {
            param3 = this.getUrl(param3);
            _loc8_ = 1;
            if(false == param4)
            {
               _loc8_ = 2;
               this.resourceDic[param3] = getTimer();
               this.history[param3] = param1;
            }
            this.loaded[param3] = _loc8_;
         }
         if(param2 <= this.clearTime)
         {
            return;
         }
         param7.unshift(param1);
         this.callback(param6,param7);
      }
      
      private final function onError(param1:String) : void
      {
         if(null == this._loader)
         {
            return;
            §§push(trace(param1));
         }
         else
         {
            this.task.args.unshift(param1);
            this.callback(this.task.ferr,this.task.args);
            this.endTask();
            return;
         }
      }
      
      private final function onProgress(param1:Number) : void
      {
         if(null == this._loader)
         {
            return;
         }
         this.callback(this.task.fpro,[param1]);
      }
      
      private final function callback(param1:Array, param2:Array) : void
      {
         var _loc3_:* = null;
         if(null == param1)
         {
            return;
         }
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(_loc3_ in param1)
         {
            if(_loc3_ is Function)
            {
               _loc3_.apply(null,param2);
            }
         }
         param1 = null;
      }
   }
}
