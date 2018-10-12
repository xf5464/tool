package subGame.sanrenchuanqi.wylib.Packs.BitmapPack
{
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   
   import subGame.sanrenchuanqi.wylib.Packs.MDPackDirectory;
   import subGame.sanrenchuanqi.wylib.Packs.MDPackFile;
   import subGame.sanrenchuanqi.wylib.Packs.MDPackItem;
   import subGame.sanrenchuanqi.wylib.Packs.MDPackage;
   import subGame.sanrenchuanqi.wylib.Packs.BitmapPack.MDPBitmapData;
   
   public class MDPBitmapDirectory extends MDPackDirectory
   {
       
      
      public function MDPBitmapDirectory(param1:MDPackage, param2:MDPackItem, param3:int = 2)
      {
         super(param1,param2,param3);
      }
      
      override public function load(param1:ByteArray, param2:String = "") : void
      {
         var _loc3_:MDPackItem = null;
         var _loc4_:ByteArray = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:MDPBitmapData = null;
         super.load(param1,param2);
         if(m_Items)
         {
            _loc3_ = m_Items[m_Items.length - 1];
            if(!_loc3_.isDirectory && _loc3_.name == "offset")
            {
               _loc4_ = new ByteArray();
               MDPackFile(_loc3_).loadFileData(_loc4_);
               _loc4_.endian = Endian.LITTLE_ENDIAN;
               _loc4_.position = 0;
               m_Items.pop();
            }
            _loc8_ = m_Items.length;
            _loc7_ = 0;
			
			totalItemNum = _loc8_;
			
            while(_loc7_ < _loc8_)
            {
               _loc9_ = m_Items[_loc7_] as MDPBitmapData;
               if(_loc9_)
               {
				   _loc9_.callback = this.loadOneImageCallback;
				   _loc9_.index= _loc7_;
				   
                  _loc5_ = _loc4_.readShort();
                  _loc6_ = _loc4_.readShort();
                  _loc9_.setOffsetXY(_loc5_,_loc6_);
				  _loc9_.loadBitmapData();
               }
               _loc7_++;
            }
            if(!m_ParentItem)
            {
               m_Package.releaseStream();
            }
         }
      }
	  
	  private var finishedCount:int;
	  
	  private var totalItemNum:int;
	  
	  private var finishedItemNum:int;
	  
	  private function loadOneImageCallback(mdpBitmapdata:MDPBitmapData):void
	  {
		  finishedItemNum++;
		  
		  trace("finishedItemNum:" + finishedItemNum + " total:" + this.totalItemNum);
		  
		  var actionUrl:String = outputUrl;
		  
		  checkFolderAndCreate(actionUrl);
		  
		  var placementUrl:String = actionUrl + "Placements/";
		  
		  var placementFile:File = new File(placementUrl);
		  
		  if (!placementFile.exists)
		  {
			  placementFile.createDirectory();
		  }
		  
		  var pngName:String = "000" + mdpBitmapdata.index.toString();
		  
		  if (mdpBitmapdata.index >= 10)
		  {
			  pngName = "00" + mdpBitmapdata.index.toString();
		  }
		  
		  var pngFile:File = new File(actionUrl + pngName + ".png");
		  
		  var bytes:ByteArray = PNGEncoder2.encode(mdpBitmapdata.bitmapData);
		  
		  var pngFs:FileStream = new FileStream();
		  pngFs.open(pngFile, FileMode.WRITE);
		  pngFs.writeBytes(bytes, 0, bytes.length);
		  pngFs.close();
		  
		  var frameEndTime:int = flash.utils.getTimer();
		  
		  var txtUrl:String = placementUrl + pngName + ".txt";
		  
		  var txtData:String = mdpBitmapdata.offsetX + "\r\n" +  mdpBitmapdata.offsetY;
		  
		  var xmlFile:File = new File(txtUrl);
		  
		  var xmlFs:FileStream = new FileStream();
		  xmlFs.open(xmlFile, FileMode.WRITE);
		  xmlFs.writeUTFBytes(txtData);
		  xmlFs.close();
		  
		  if (finishedItemNum == totalItemNum)
		  {
			  if (this.finishAllCallback != null)
			  {
				  this.finishAllCallback();
			  }
		  }
	  }
	  
	  private function checkFolderAndCreate(url:String):void
	  {
		  var file:File = new File(url);
		  
		  if (!file.exists)
		  {
			  file.createDirectory();
		  }
	  }
	  
   }
}
