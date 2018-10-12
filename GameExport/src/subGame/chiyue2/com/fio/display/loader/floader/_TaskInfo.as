package subGame.chiyue2.com.fio.display.loader.floader
{
   import flash.utils.Dictionary;
   
   class _TaskInfo
   {
      
      private static const pools:Vector.<_TaskInfo> = new Vector.<_TaskInfo>();
       
      
      var isLoading:Boolean = false;
      
      public var url:String;
      
      public var realUrl:String;
      
      public var key:String;
      
      public var isSaveContent:Boolean;
      
      public var isSwfLib:Boolean;
      
      private const comDic:Dictionary = new Dictionary();
      
      private const proDic:Dictionary = new Dictionary();
      
      private const errDic:Dictionary = new Dictionary();
      
      function _TaskInfo()
      {
         super();
      }
      
      static function getInfo() : _TaskInfo
      {
         if(pools.length > 0)
         {
            return pools.shift();
         }
         return new _TaskInfo();
      }
      
      public final function recyle() : void
      {
         key = null;
         realUrl = null;
         url = null;
         isSaveContent = false;
         isLoading = false;
         isSwfLib = false;
         delDic(comDic);
         delDic(proDic);
         delDic(errDic);
         pools[pools.length] = this;
      }
      
      private final function delDic(param1:Dictionary) : void
      {
         var _loc2_:* = undefined;
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for(_loc2_ in param1)
         {
            delete param1[_loc2_];
         }
      }
      
      public final function isEmpty() : Boolean
      {
         return null == url;
      }
      
      public final function addCompleteFun(param1:Function) : void
      {
         if(param1 is Function)
         {
            comDic[param1] = 1;
         }
      }
      
      public final function delCompleteFun(param1:Function) : void
      {
         if(param1 is Function)
         {
            delete comDic[param1];
         }
      }
      
      public final function callComplete(param1:*) : void
      {
         call(comDic,param1,key);
      }
      
      public final function addErrorFun(param1:Function) : void
      {
         if(param1 is Function)
         {
            errDic[param1] = 1;
         }
      }
      
      public final function delErrorFun(param1:Function) : void
      {
         if(param1 is Function)
         {
            delete errDic[param1];
         }
      }
      
      public final function callError() : void
      {
         call(errDic,url,key);
      }
      
      public final function addProgressFun(param1:Function) : void
      {
         if(param1 is Function)
         {
            proDic[param1] = 1;
         }
      }
      
      public final function delProgressFun(param1:Function) : void
      {
         if(param1 is Function)
         {
            delete proDic[param1];
         }
      }
      
      public final function callProgress(param1:Number) : void
      {
         call(proDic,param1);
      }
      
      private final function call(param1:Dictionary, ... rest) : void
      {
         var _loc3_:* = undefined;
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for(_loc3_ in param1)
         {
            if(_loc3_ is Function)
            {
               _loc3_.apply(null,rest);
            }
         }
      }
   }
}
