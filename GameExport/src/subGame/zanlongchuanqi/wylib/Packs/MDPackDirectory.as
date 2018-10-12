package subGame.zanlongchuanqi.wylib.Packs
{
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.sampler.getSize;
   import flash.utils.ByteArray;
   
   import subGame.zanlongchuanqi.wylib.Packs.BitmapPack.MDPBitmapData;
   
   public class MDPackDirectory extends MDPackItem
   {
       
      
      protected var m_Items:Array;
      
      public function MDPackDirectory(param1:MDPackage, param2:MDPackItem, param3:int = 2)
      {
         super(param1,param2,param3);
      }
      
      override public function load(param1:ByteArray, param2:String = "") : void
      {
         var dwNameLen:uint = 0;
         var nItemCount:int = 0;
         var ItemClass:Class = null;
         var SubItem:MDPackItem = null;
         var dwItemOffset:uint = 0;
         var nItemType:int = 0;
         var dwStmPos:uint = 0;
         var Stream:ByteArray = param1;
         var file:String = param2;
         try
         {
			 var recordCRident:int = Stream.readUnsignedInt();
			 
            if(recordCRident != MDPackage.MDPDIRECTORYRECORDIDENT)
            {
//               UICallBack.DebugWinTrace("无效的目录描述头    " + file);
            }
         }
         catch(e:Error)
         {
//            UICallBack.DebugWinTrace("无效的目录描述头    " + file);
         }
         dwNameLen = Stream.readUnsignedInt();
         nItemCount = Stream.readInt();
         m_ExtDataRec = readDataRec(Stream);
         Stream.position = Stream.position + 16;
         m_sName = Stream.readMultiByte(dwNameLen,"GB2312");
         if(nItemCount <= 0)
         {
            return;
         }
         this.m_Items = new Array();
         var i:int = nItemCount - 1;
		 
		 var k:int = 0;
		 
         while(k <= i)
         {
            nItemType = Stream.readUnsignedByte();
            Stream.position = Stream.position + 3;
            dwItemOffset = Stream.readUnsignedInt();
            if(nItemType == FILEITEM)
            {
               ItemClass = m_Package.fileClass;
            }
            else if(nItemType == DIRECTORYITEM)
            {
               ItemClass = m_Package.directoryClass;
            }
            else
            {
               throw new Error("无效的子对象类型");
            }
            dwStmPos = Stream.position;
            SubItem = new ItemClass(m_Package,this,nItemType);
			
            Stream.position = dwItemOffset;
			this.m_Items.push(SubItem);
            SubItem.load(Stream);
            Stream.position = dwStmPos;
            k++;
         }
      }
	  
	  public var outputUrl:String;
	  
	  private var _finishAllCallback:Function;
	  
	  public function get finishAllCallback():Function
	  {
		  return _finishAllCallback;
	  }
	  
	  public function set finishAllCallback(value:Function):void
	  {
		  _finishAllCallback = value;
	  }
	  
      override public function destruct() : void
      {
		  finishAllCallback = null;
		  
         var _loc1_:MDPackItem = null;
         if(this.m_Items)
         {
            while(this.m_Items.length)
            {
               _loc1_ = this.m_Items.pop();
               _loc1_.destruct();
            }
         }
         this.m_Items = null;
         super.destruct();
      }
      
      public function getMemorySize() : int
      {
         var _loc2_:MDPBitmapData = null;
         var _loc1_:int = 0;
         for each(_loc2_ in this.m_Items)
         {
            if(_loc2_)
            {
               _loc1_ = _loc1_ + getSize(_loc2_.bitmapData);
            }
         }
         return _loc1_;
      }
      
      public function getItem(param1:int) : MDPackItem
      {
         return !!this.m_Items?MDPackItem(this.m_Items[param1]):null;
      }
      
      public function get itemCount() : int
      {
         return !!this.m_Items?int(this.m_Items.length):0;
      }
      
      public function getNamedItem(param1:String) : MDPackItem
      {
         var _loc2_:int = 0;
         var _loc3_:MDPackItem = null;
         if(!this.m_Items)
         {
            return null;
         }
         _loc2_ = this.m_Items.length - 1;
         while(_loc2_ > -1)
         {
            _loc3_ = this.m_Items[_loc2_];
            if(_loc3_.name == param1)
            {
               return _loc3_;
            }
            _loc2_--;
         }
         return null;
      }
   }
}
