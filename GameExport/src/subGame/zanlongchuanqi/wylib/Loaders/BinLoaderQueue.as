package subGame.zanlongchuanqi.wylib.Loaders
{
   import callBack.UICallBack;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import utils.CustomByteArray;
   
   public dynamic class BinLoaderQueue extends Array
   {
      
      protected static const DefaultLoaderCount:uint = 4;
       
      
      private var m_nLoaderCount:int;
      
      private var m_Loaders:Array;
      
      private var m_SiteURL:String;
      
      public function BinLoaderQueue(param1:String, param2:uint = 4)
      {
         var _loc3_:BinDataLoader = null;
         var _loc4_:int = 0;
         super();
         this.m_SiteURL = param1;
         this.m_nLoaderCount = param2;
         this.m_Loaders = new Array();
         _loc4_ = 0;
         while(_loc4_ < param2)
         {
            _loc3_ = new BinDataLoader();
            _loc3_.addEventListener(Event.COMPLETE,this.onLoadComplete);
            _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadError);
            _loc3_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoadError);
            this.m_Loaders.push(_loc3_);
            _loc4_++;
         }
      }
      
      private function onLoadError(param1:Event) : void
      {
         var _loc2_:BinDataLoader = BinDataLoader(param1.currentTarget);
         UICallBack.DebugWinTrace("加载数据失败：" + _loc2_.m_LoadContext.m_DataURL);
         _loc2_.loadDataResult(null);
         if(length > 0)
         {
            _loc2_.loadData(this.shift());
         }
      }
      
      public function get siteURL() : String
      {
         return this.m_SiteURL;
      }
      
      public function requestSocketLoad(param1:int, param2:String, param3:String) : void
      {
         var _loc4_:CustomByteArray = new CustomByteArray();
         _loc4_.writeByte(AssetsSocketInfo.ASSETS_GET_RES);
         _loc4_.writeUnsignedInt(param1);
         _loc4_.writeInt(AssetsSocketInfo.ASSETS_DATA_RESOURCE);
         _loc4_.writeInt(0);
         _loc4_.writeCustomBytes(param2);
         _loc4_.writeCustomBytes(param3);
         AssetsSocketInfo.Assets_Socket.sendSocket(_loc4_);
      }
      
      public function requestLoad(param1:String, param2:Object, param3:Function) : void
      {
         var _loc4_:BinLoadDataContext = new BinLoadDataContext();
         _loc4_.m_DataURL = this.m_SiteURL + param1;
         _loc4_.m_LoadCallBack = param3;
         _loc4_.m_RequesterData = param2;
         if(!this.dispatchLoadContent(_loc4_))
         {
            this.push(_loc4_);
         }
      }
      
      private function dispatchLoadContent(param1:BinLoadDataContext) : Boolean
      {
         var _loc2_:BinDataLoader = null;
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
         var _loc1_:BinDataLoader = null;
         var _loc2_:int = 0;
         this.splice(0,this.length);
         _loc2_ = 0;
         while(_loc2_ < this.m_Loaders.length)
         {
            _loc1_ = BinDataLoader(this.m_Loaders[_loc2_]);
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
         var _loc2_:BinDataLoader = BinDataLoader(param1.currentTarget);
         _loc2_.loadDataResult(_loc2_.data);
         if(length > 0)
         {
            _loc2_.loadData(this.shift());
         }
      }
   }
}

import flash.net.URLLoader;
import flash.net.URLLoaderDataFormat;
import flash.net.URLRequest;

class BinDataLoader extends URLLoader
{
    
   
   public var m_LoadContext:BinLoadDataContext;
   
   function BinDataLoader()
   {
      super();
      this.dataFormat = URLLoaderDataFormat.BINARY;
   }
   
   public function loadData(param1:BinLoadDataContext) : void
   {
      this.m_LoadContext = param1;
      load(new URLRequest(param1.m_DataURL));
   }
   
   public function loadDataResult(param1:Object) : void
   {
      this.m_LoadContext.m_LoadCallBack(this.m_LoadContext.m_RequesterData,param1);
      this.m_LoadContext.m_RequesterData = null;
      this.m_LoadContext.m_LoadCallBack = null;
      this.m_LoadContext.m_DataURL = null;
      this.m_LoadContext = null;
      this.close();
      this.bytesTotal = 0;
      this.data = null;
   }
   
   public function destruct() : void
   {
      if(this.m_LoadContext)
      {
         this.loadDataResult(null);
      }
   }
}

class BinLoadDataContext
{
    
   
   public var m_DataURL:String;
   
   public var m_RequesterData:Object;
   
   public var m_LoadCallBack:Function;
   
   function BinLoadDataContext()
   {
      super();
   }
}
