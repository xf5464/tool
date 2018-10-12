package subGame.zanlongchuanqi.wylib.Packs.BitmapPack
{
   import flash.display.BitmapData;
   
   import subGame.zanlongchuanqi.wylib.Packs.BitmapPack.Internal.MDPBitmapDataLoadQueue;
   import subGame.zanlongchuanqi.wylib.Packs.MDPackFile;
   import subGame.zanlongchuanqi.wylib.Packs.MDPackItem;
   import subGame.zanlongchuanqi.wylib.Packs.MDPackage;
   
   public class MDPBitmapData extends MDPackFile
   {
      
      private static var BitmapDataLoadQueue:MDPBitmapDataLoadQueue = new MDPBitmapDataLoadQueue(32);
       
      
      protected var m_nOffsetX:int;
      
      protected var m_nOffsetY:int;
      
      protected var m_BitmapData:BitmapData;
      
      public function MDPBitmapData(param1:MDPackage, param2:MDPackItem, param3:int = 2)
      {
         super(param1,param2,param3);
      }
      
      private function loadBmpDataComplete(param1:BitmapData) : void
      {
         this.m_BitmapData = param1;
		 
		 if (callback != null)
		 {
			 callback(this);
			 
			 trace("called:" + index);
		 }
      }
      
      public function get offsetX() : int
      {
         return this.m_nOffsetX;
      }
      
      public function get offsetY() : int
      {
         return this.m_nOffsetY;
      }
      
      public function setOffsetXY(param1:int, param2:int) : void
      {
         this.m_nOffsetX = param1;
         this.m_nOffsetY = param2;
      }
      
      public function set bitmapData(param1:BitmapData) : void
      {
         if(this.m_BitmapData)
         {
            this.m_BitmapData.dispose();
         }
         this.m_BitmapData = param1;
         m_ExtDataRec = null;
         m_FileDataRec = null;
      }
      
      public function get bitmapData() : BitmapData
      {
         return this.m_BitmapData;
      }
      
      override public function destruct() : void
      {
         if(this.m_BitmapData)
         {
            this.m_BitmapData.dispose();
            this.m_BitmapData = null;
         }
		 
		 callback = null;
		 
         super.destruct();
      }
      
      public function loadBitmapData() : void
      {
         if(m_FileDataRec && m_FileDataRec.dwSize > 0)
         {
            BitmapDataLoadQueue.requestLoadBitmapData(m_Package.stream,m_FileDataRec.dwOffset,m_FileDataRec.dwSize,this.loadBmpDataComplete);
         }
         m_ExtDataRec = null;
         m_FileDataRec = null;
      }
	  
	  private var _callback:Function;

	  public function get callback():Function
	  {
		  return _callback;
	  }

	  public function set callback(value:Function):void
	  {
		  _callback = value;
	  }
	  
	  public var index:int;

   }
}
