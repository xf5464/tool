package subGame.sanrenchuanqi.wylib.Packs
{
   import communicate.SocketStatus;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   import wylib.Loaders.AssetsSocketInfo;
   import subGame.sanrenchuanqi.wylib.Loaders.BinLoaderQueue;
   import subGame.sanrenchuanqi.wylib.Packs.BitmapPack.MDPSWFBitmapPackage;
   import subGame.zanlongchuanqi.wylib.Packs.MDPackage;
   
   public class MDPackGroup
   {
       
      
      private var m_Loader:BinLoaderQueue;
      
      private var m_sGroupName:String;
      
      private var m_sPackageExt:String;
      
      private var m_Packages:Array;
      
      public function MDPackGroup(param1:BinLoaderQueue, param2:String = "", param3:String = ".mdp")
      {
         super();
         this.m_sPackageExt = param3;
         this.m_sGroupName = param2;
         this.m_Loader = param1;
         this.m_Packages = new Array();
      }
      
      private function loadPackageComplete(param1:MDPackage, param2:ByteArray) : void
      {
         if(param2 && param2.length != 0)
         {
            param2.endian = Endian.LITTLE_ENDIAN;
            param1.load(param2);
         }
      }
      
      public function getMemorySize() : int
      {
         var _loc2_:MDPackage = null;
         var _loc1_:int = 0;
         for each(_loc2_ in this.m_Packages)
         {
            if(_loc2_)
            {
               _loc1_ = _loc1_ + _loc2_.getMemorySize();
            }
         }
         return _loc1_;
      }
      
      public function get groupName() : String
      {
         return this.m_sGroupName;
      }
      
      public function doSocketDataBack(param1:int, param2:ByteArray) : void
      {
         var _loc3_:MDPackage = this.m_Packages[param1];
         if(!_loc3_)
         {
            return;
         }
         if(param2 && param2.length != 0)
         {
            param2.endian = Endian.LITTLE_ENDIAN;
            _loc3_.load(param2);
         }
      }
      
      public function getPackage(param1:int, param2:Class = null, param3:String = "", param4:Boolean = false) : MDPackage
      {
         if(param1 < 0)
         {
            throw new Error("索引超出预定范围：" + param1);
         }
         if(this.m_Packages[param1])
         {
            return this.m_Packages[param1];
         }
         var _loc5_:String = param1.toString();
         while(_loc5_.length < 5)
         {
            _loc5_ = "0" + _loc5_;
         }
         _loc5_ = this.m_sGroupName + "/" + _loc5_ + this.m_sPackageExt;
         if(param4 && param3 != "" && AssetsSocketInfo.Assets_Socket.socketStatus == SocketStatus.COMMUNICATION)
         {
            return this.getSocketPackage(_loc5_,param1,param2,param3);
         }
         return this.getLoadPackage(_loc5_,param1,param2);
      }
      
      public function destruct() : void
      {
         var _loc1_:MDPackage = null;
         while(this.m_Packages.length > 0)
         {
            _loc1_ = this.m_Packages.pop();
            if(_loc1_)
            {
               _loc1_.destruct();
            }
         }
         this.m_Loader = null;
      }
      
      public function getLoadPackage(param1:String, param2:int, param3:Class = null) : MDPackage
      {
         if(!param3)
         {
            param3 = MDPSWFBitmapPackage;
         }
         var _loc4_:MDPackage = new param3();
         this.m_Packages[param2] = _loc4_;
         _loc4_.file = param1;
         this.m_Loader.requestLoad(param1,_loc4_,this.loadPackageComplete);
         return _loc4_;
      }
      
      public function getSocketPackage(param1:String, param2:int, param3:Class = null, param4:String = "") : MDPackage
      {
         if(!param3)
         {
            param3 = MDPSWFBitmapPackage;
         }
         var _loc5_:MDPackage = new param3();
         this.m_Packages[param2] = _loc5_;
         _loc5_.file = param1;
         this.m_Loader.requestSocketLoad(param2,param4,param1);
         return _loc5_;
      }
   }
}
