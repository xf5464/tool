package subGame.zanlongchuanqi.wylib.Packs
{
   import flash.utils.ByteArray;
   
   public class MDPackItem
   {
      
      public static const DIRECTORYITEM:int = 2;
      
      public static const FILEITEM:int = 1;
       
      
      protected var m_sName:String;
      
      protected var m_ParentItem:MDPackItem;
      
      protected var m_Package:MDPackage;
      
      protected var m_ExtDataRec:MDPackDataRec;
      
      protected var m_ItemType:int;
      
      public function MDPackItem(param1:MDPackage, param2:MDPackItem, param3:uint)
      {
         super();
         this.m_Package = param1;
         this.m_ParentItem = param2;
         this.m_ItemType = param3;
      }
      
      public static function readDataRec(param1:ByteArray) : MDPackDataRec
      {
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:MDPackDataRec = null;
         _loc2_ = param1.readUnsignedInt();
         _loc3_ = param1.readUnsignedInt();
         if(_loc3_ > 0)
         {
            _loc4_ = new MDPackDataRec();
            _loc4_.dwOffset = _loc2_;
            _loc4_.dwSize = _loc3_;
            _loc4_.CRC32 = param1.readUnsignedInt();
            return _loc4_;
         }
         param1.position = param1.position + 4;
         return null;
      }
      
      public function get isDirectory() : Boolean
      {
         return this.m_ItemType == DIRECTORYITEM;
      }
      
      public function load(param1:ByteArray, param2:String = "") : void
      {
         throw new Error("子类必须覆盖文件系统对象抽象类的加载函数");
      }
      
      public function get path() : String
      {
         var _loc1_:String = this.m_sName;
         var _loc2_:MDPackItem = this.m_ParentItem;
         while(_loc2_)
         {
            _loc1_ = _loc2_.m_sName + "/" + _loc1_;
            _loc2_ = _loc2_.parentItem;
         }
         return _loc1_;
      }
      
      public function get parentDirectory() : MDPackDirectory
      {
         return this.m_ParentItem && this.m_ParentItem.isDirectory?this.m_ParentItem as MDPackDirectory:null;
      }
      
      public function get name() : String
      {
         return this.m_sName;
      }
      
      public function get itemType() : int
      {
         return this.m_ItemType;
      }
      
      public function get extendDataSize() : uint
      {
         return !!this.m_ExtDataRec?uint(this.m_ExtDataRec.dwSize):uint(0);
      }
      
      public function destruct() : void
      {
         this.m_ParentItem = null;
         this.m_ExtDataRec = null;
         this.m_Package = null;
      }
      
      public function get parentItem() : MDPackItem
      {
         return this.m_ParentItem;
      }
   }
}
