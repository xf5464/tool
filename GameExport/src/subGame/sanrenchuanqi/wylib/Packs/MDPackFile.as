package subGame.sanrenchuanqi.wylib.Packs
{
   import flash.utils.ByteArray;
   import subGame.sanrenchuanqi.wylib.Packs.MDPackDataRec;
   import subGame.sanrenchuanqi.wylib.Packs.MDPackItem;
   import subGame.sanrenchuanqi.wylib.Packs.MDPackage;
   
   public class MDPackFile extends MDPackItem
   {
       
      
      protected var m_btCompressType:int;
      
      protected var m_FileDataRec:MDPackDataRec;
      
      protected var m_btCompressVer:int;
      
      public function MDPackFile(param1:MDPackage, param2:MDPackItem, param3:int = 2)
      {
         super(param1,param2,param3);
      }
      
      public function get fileSize() : uint
      {
         return !!this.m_FileDataRec?uint(this.m_FileDataRec.dwSize):uint(0);
      }
      
      override public function load(param1:ByteArray, param2:String = "") : void
      {
         var _loc3_:uint = 0;
         if(param1.readUnsignedInt() != MDPackage.MDPFILERECORDIDENT)
         {
            throw new Error("非有效的文件标识头");
         }
         _loc3_ = param1.readUnsignedInt();
         this.m_FileDataRec = readDataRec(param1);
         m_ExtDataRec = readDataRec(param1);
         this.m_btCompressType = param1.readUnsignedByte();
         this.m_btCompressVer = param1.readUnsignedByte();
         param1.position = param1.position + 6;
         m_sName = param1.readMultiByte(_loc3_,"GB2312");
      }
      
      override public function destruct() : void
      {
         this.m_FileDataRec = null;
         super.destruct();
      }
      
      public function loadFileData(param1:ByteArray) : uint
      {
         if(this.m_FileDataRec)
         {
            param1.writeBytes(m_Package.stream,this.m_FileDataRec.dwOffset,this.m_FileDataRec.dwSize);
            return this.m_FileDataRec.dwSize;
         }
         return 0;
      }
      
      public function get fileOffset() : uint
      {
         return !!this.m_FileDataRec?uint(this.m_FileDataRec.dwOffset):uint(0);
      }
   }
}
