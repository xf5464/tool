package subGame.zanlongchuanqi.wylib.Packs.BitmapPack.Internal
{
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.utils.ByteArray;
   
   public dynamic class MDPSWFLoadQueue extends Array
   {
       
      
      private var IdleLoaderList:Array;
      
      public function MDPSWFLoadQueue(param1:int = 2)
      {
         var _loc2_:int = 0;
         var _loc3_:MDPSWFLoader = null;
         super();
         this.IdleLoaderList = new Array();
         _loc2_ = 0;
         while(_loc2_ < param1)
         {
            _loc3_ = new MDPSWFLoader();
            _loc3_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.loadSWFComplete);
            this.IdleLoaderList.push(_loc3_);
            _loc2_++;
         }
      }
      
      public function requestLoadSWF(param1:ByteArray, param2:int, param3:int, param4:Function) : void
      {
         var _loc5_:int = 0;
         var _loc6_:MDPSWFLoader = null;
         var _loc7_:MDPLoadSWFInfo = new MDPLoadSWFInfo();
         _loc7_.CallBack = param4;
         _loc7_.Position = param2;
         _loc7_.Size = param3;
         _loc7_.Stream = param1;
         if(this.IdleLoaderList.length)
         {
            _loc6_ = this.IdleLoaderList.pop();
            _loc6_.loadNextRequest(_loc7_);
            return;
         }
         push(_loc7_);
      }
      
      private function loadSWFComplete(param1:Event) : void
      {
         var e:Event = param1;
         var ldi:LoaderInfo = LoaderInfo(e.currentTarget);
         var ldr:MDPSWFLoader = MDPSWFLoader(ldi.loader);
         var info:MDPLoadSWFInfo = ldr.CurrentLoadInfo;
         try
         {
            info.CallBack(ldi,info.Stream);
            return;
         }
         finally
         {
            info.Stream = null;
            info.CallBack = null;
            ldr.unloadAndStop(true);
            if(length > 0)
            {
               ldr.loadNextRequest(pop());
            }
            else
            {
               ldr.CurrentLoadInfo = null;
               this.IdleLoaderList.push(ldr);
            }
         }
      }
   }
}

import flash.display.Loader;
import flash.system.ApplicationDomain;
import flash.system.LoaderContext;
import flash.utils.ByteArray;

class MDPSWFLoader extends Loader
{
    
   
   private var Stream:ByteArray;
   
   public var CurrentLoadInfo:MDPLoadSWFInfo;
   
   function MDPSWFLoader()
   {
      super();
      this.Stream = new ByteArray();
   }
   
   public function loadNextRequest(param1:MDPLoadSWFInfo) : void
   {
      this.CurrentLoadInfo = param1;
      this.Stream.length = 0;
      this.Stream.writeBytes(param1.Stream,param1.Position,param1.Size);
      var _loc2_:LoaderContext = new LoaderContext(false,new ApplicationDomain());
      if(_loc2_.hasOwnProperty("allowLoadBytesCodeExecution"))
      {
         _loc2_["allowLoadBytesCodeExecution"] = true;
      }
      loadBytes(this.Stream,_loc2_);
   }
}

import flash.utils.ByteArray;

class MDPLoadSWFInfo
{
    
   
   public var Stream:ByteArray;
   
   public var Size:int;
   
   public var CallBack:Function;
   
   public var Position:int;
   
   function MDPLoadSWFInfo()
   {
      super();
   }
}
