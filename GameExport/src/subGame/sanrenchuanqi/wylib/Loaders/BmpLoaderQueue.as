package subGame.sanrenchuanqi.wylib.Loaders
{
   import callBack.UICallBack;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import utils.CustomByteArray;
   
   public class BmpLoaderQueue
   {
      
      protected static const DefaultLoaderCount:uint = 4;
       
      
      private var m_nLoaderCount:int;
      
      private var m_prefixStr:String;
      
      private var m_Loaders:Array;
      
      private var m_TaskList:Vector.<BmpLoadDataContext#21>;
      
      private var m_SiteURL:String;
      
      public function BmpLoaderQueue(param1:String, param2:uint = 4, param3:String = "")
      {
         var _loc4_:BmpDataLoader = null;
         var _loc5_:int = 0;
         super();
         this.m_SiteURL = param1;
         this.m_nLoaderCount = param2;
         this.m_TaskList = new Vector.<BmpLoadDataContext#21>();
         this.m_prefixStr = param3;
         this.m_Loaders = new Array();
         _loc5_ = 0;
         while(_loc5_ < param2)
         {
            _loc4_ = new BmpDataLoader(this);
            _loc4_.addEventListener(Event.COMPLETE,this.onLoadComplete);
            _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadError);
            _loc4_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadError);
            this.m_Loaders.push(_loc4_);
            _loc5_++;
         }
      }
      
      public function push(param1:BmpLoadDataContext#21) : uint
      {
         return this.m_TaskList.push(param1);
      }
      
      public function shift() : BmpLoadDataContext#21
      {
         return this.m_TaskList.shift();
      }
      
      private function onLoadError(param1:Event) : void
      {
         var _loc2_:BmpDataLoader = BmpDataLoader(param1.currentTarget);
         UICallBack.DebugWinTrace("加载失败：" + _loc2_.m_LoadContext.m_DataURL);
         _loc2_.loadDataResult(null);
         if(this.length > 0)
         {
            _loc2_.loadData(this.m_TaskList.shift());
         }
      }
      
      public function requestLoad(param1:String, param2:Object, param3:Function) : void
      {
         var _loc4_:BmpLoadDataContext = new BmpLoadDataContext#21();
         _loc4_.m_DataURL = this.m_SiteURL + param1;
         _loc4_.m_LoadCallBack = param3;
         _loc4_.m_RequesterData = param2;
         if(!this.dispatchLoadContent(_loc4_))
         {
            this.m_TaskList.push(_loc4_);
         }
      }
      
      public function get length() : int
      {
         return this.m_TaskList.length;
      }
      
      public function requestSocketLoad(param1:int, param2:String, param3:String, param4:Boolean = false, param5:int = -1) : void
      {
         var _loc6_:CustomByteArray = new CustomByteArray();
         _loc6_.writeByte(AssetsSocketInfo.ASSETS_GET_RES);
         _loc6_.writeUnsignedInt(param1);
         if(param4)
         {
            _loc6_.writeInt(AssetsSocketInfo.ASSETS_DATA_MAP);
         }
         else
         {
            _loc6_.writeInt(AssetsSocketInfo.ASSETS_DATA_RESOURCE);
         }
         _loc6_.writeInt(param5);
         _loc6_.writeCustomBytes(param2);
         _loc6_.writeCustomBytes(this.m_prefixStr + param3);
         AssetsSocketInfo.Assets_Socket.sendSocket(_loc6_);
      }
      
      public function get siteURL() : String
      {
         return this.m_SiteURL;
      }
      
      public function pop() : BmpLoadDataContext#21
      {
         return this.m_TaskList.pop();
      }
      
      private function dispatchLoadContent(param1:BmpLoadDataContext#21) : Boolean
      {
         var _loc2_:BmpDataLoader = null;
         var _loc3_:int = 0;
         _loc3_ = this.m_nLoaderCount - 1;
         while(_loc3_ > -1)
         {
            _loc2_ = this.m_Loaders[_loc3_];
            if(_loc2_.m_LoadContext == null)
            {
               _loc2_.loadData(param1);
               return true;
            }
            _loc3_--;
         }
         return false;
      }
      
      public function destruct() : void
      {
         var _loc1_:BmpDataLoader = null;
         var _loc2_:int = 0;
         this.m_TaskList.length = 0;
         _loc2_ = 0;
         while(_loc2_ < this.m_Loaders.length)
         {
            _loc1_ = BmpDataLoader(this.m_Loaders[_loc2_]);
            _loc1_.removeEventListener(Event.COMPLETE,this.onLoadComplete);
            _loc1_.removeEventListener(IOErrorEvent.IO_ERROR,this.onLoadError);
            _loc1_.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadError);
            _loc1_.destruct();
            _loc2_++;
         }
         this.m_Loaders.splice(0,this.m_Loaders.length);
         this.m_Loaders = null;
      }
      
      private function onLoadComplete(param1:Event) : void
      {
         var _loc2_:BmpDataLoader = BmpDataLoader(param1.currentTarget);
         _loc2_.loadDataResult(_loc2_.data);
      }
   }
}

import flash.display.Bitmap;
import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.events.Event;
import flash.net.URLLoader;
import flash.net.URLLoaderDataFormat;
import flash.net.URLRequest;
import flash.utils.ByteArray;
import subGame.sanrenchuanqi.wylib.Loaders.BmpLoaderQueue;

class BmpDataLoader extends URLLoader
{
    
   
   private var m_Loader:Loader;
   
   public var m_LoadContext:BmpLoadDataContext#21;
   
   private var m_Queue:BmpLoaderQueue;
   
   function BmpDataLoader(param1:BmpLoaderQueue)
   {
      super();
      this.m_Queue = param1;
      this.dataFormat = URLLoaderDataFormat.BINARY;
      this.m_Loader = new Loader();
      this.m_Loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.loaderWriteCompelte);
   }
   
   public function loadData(param1:BmpLoadDataContext#21) : void
   {
      this.m_LoadContext = param1;
      load(new URLRequest(param1.m_DataURL));
   }
   
   private function loaderWriteCompelte(param1:Event) : void
   {
      var _loc2_:LoaderInfo = LoaderInfo(param1.currentTarget);
      var _loc3_:Bitmap = Bitmap(_loc2_.content);
      _loc2_.loader.unload();
      this.loadBitmapResult(_loc3_);
      _loc3_.bitmapData = null;
   }
   
   public function loadDataResult(param1:Object) : void
   {
      if(param1 && param1.length > 0)
      {
         this.m_Loader.loadBytes(ByteArray(param1));
      }
      else
      {
         this.loadBitmapResult(null);
      }
   }
   
   public function destruct() : void
   {
      if(this.m_LoadContext)
      {
         this.loadBitmapResult(null);
      }
      this.m_Loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.loaderWriteCompelte);
      this.m_Loader.unload();
      this.m_Loader = null;
      this.m_Queue = null;
   }
   
   private function loadBitmapResult(param1:Bitmap) : void
   {
      this.m_LoadContext.m_LoadCallBack(this.m_LoadContext.m_RequesterData,param1);
      this.m_LoadContext.m_RequesterData = null;
      this.m_LoadContext.m_LoadCallBack = null;
      this.m_LoadContext.m_DataURL = null;
      this.m_LoadContext = null;
      this.close();
      this.data = null;
      this.bytesTotal = 0;
      if(this.m_Queue.length > 0)
      {
         this.loadData(this.m_Queue.shift());
      }
   }
}

class BmpLoadDataContext#21
{
    
   
   public var m_DataURL:String;
   
   public var m_RequesterData:Object;
   
   public var m_LoadCallBack:Function;
   
   function BmpLoadDataContext#21()
   {
      super();
   }
}
