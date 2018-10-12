package subGame.zetianji.parser
{
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.ProgressEvent;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.clearTimeout;
   import flash.utils.getTimer;
   
   import subGame.zetianji.ZetianjiDomain;
   
   public class VFmtParser extends EventDispatcher implements URLLoaderInterface
   {
      
      private static var ntime:uint = 0;
       
      
      public var filemap:HashMap;
      
      public var filearray:Array;
      
      private var _data:ByteArray;
      
      private var _headsize:uint = 0;
      
      private var _m_boloaded:Boolean = false;
      
      public var m_nLastUseTime:uint = 0;
      
      private var isUnload:Boolean = false;
      
      public var loader:URLLoaderEx;
      
      public var isLoading:Boolean = false;
      
      public var OnProgress:Function = null;
      
      public var m_szPureUrl:String;
      
      public var m_szUrl:String;
      
      public var decoded:Boolean = false;
      
      public var iserror:Boolean = false;
      
      public var picmap:HashMap;
      
      public var version:int = 0;
      
      public var donotrecycle:Boolean = false;
      
      public var _ownermap:HashMap;
      
      public var boNoClearSingleImage:Boolean = false;
      
      private var _png8clearId:int = -1;
      
      private var _clearId:int = -1;
      
      private var png8Plte:ByteArray;
      
      private var filehead:VfmtStruct;
      
      private var _alphadata:ByteArray;
      
      private var _image:ByteArray;
      
      public function VFmtParser()
      {
         filemap = new HashMap();
         filearray = [];
         picmap = new HashMap();
         _alphadata = new ByteArray();
         _image = new ByteArray();
         super();
         this.addEventListener("complete",onComplete);
      }
      
      public function get ownermap() : HashMap
      {
         if(!_ownermap)
         {
            _ownermap = new HashMap(true);
         }
         return _ownermap;
      }
      
      public function get data() : ByteArray
      {
         return _data;
      }
      
      public function set m_boloaded(param1:Boolean) : void
      {
         _m_boloaded = param1;
      }
      
      public function get m_boloaded() : Boolean
      {
         return _m_boloaded;
      }
      
      private function onComplete(param1:Event) : void
      {
         if(OnProgress != null)
         {
            OnProgress(new ProgressEvent("progress",false,false,100,100));
            removeEventListener("progress",this.OnProgress);
            OnProgress = null;
         }
         this.removeEventListener("complete",onComplete);
      }
      
      private function decodePng8Head(param1:int, param2:ByteArray, param3:int) : void
      {
         var _loc6_:* = null;
         var _loc5_:* = 0;
         var _loc7_:Png8PictureHead = null;
         var _loc4_:int = getTimer();
         if(_png8clearId != -1)
         {
            clearTimeout(_png8clearId);
         }
         if(!_data || !param2)
         {
            return;
         }
		 
		 var temp:Array = [];
		 
         if(filehead)
         {
            _loc5_ = param1;
			
            while(_loc5_ < filehead.count)
            {
               _loc7_ = new Png8PictureHead(param2);
			   temp.push(_loc7_);
    /*           if(getTimer() - _loc4_ > 1)
               {
                  _png8clearId = setTimeout(decodePng8Head,1,_loc5_ + 1,param2,param3);
                  return;
               }*/
               _loc5_++;
            }
         }
		 
		 var index:int = 0;
		 
		 temp.sort(sortVfmtPictureHead8);
		 
		 for each (var kk:Png8PictureHead in temp)
		 {
			 kk.index = index;
			 
			 index++;
			 
			 filemap.put(kk.name, kk);
		 }
		 
         param2.clear();
         param2 = null;
         decoded = true;
         m_nLastUseTime = getTimer();
         dispatchEvent(new Event("complete"));
//         MyDebug.log("[VPK已加载]" + m_szPureUrl);
         m_boloaded = true;
      }
      
	  private function sortVfmtPictureHead8(head1:Png8PictureHead, head2:Png8PictureHead):int
	  {
		  var index1:int = findNameIndex(head1.name);
		  
		  var index2:int = findNameIndex(head2.name);
		  
		  if (index1 < index2)
		  {
			  return -1;
		  }
		  else if (index1 == index2)
		  {
			  return 0;
		  }
		  else
		  {
			  return 1;
		  }
	  }
	  
      private function decodeHead(param1:int, param2:ByteArray, param3:int) : void
      {
         var _loc6_:* = null;
         var _loc5_:* = 0;
         var _loc7_:VfmtPictureHead = null;
         var _loc4_:int = getTimer();
         if(_clearId != -1)
         {
            clearTimeout(_clearId);
         }
         if(!_data || !param2)
         {
            return;
         }
		 
		 var temp:Array = [];
		 
         if(filehead)
         {
            _loc5_ = param1;

			
            while(_loc5_ < filehead.count)
            {
               _loc7_ = new VfmtPictureHead(param2);
			   temp.push(_loc7_);
/*			   _loc7_.index = index;
			   index++;*/
//               filemap.put(_loc7_.name,_loc7_);
      /*         if(getTimer() - _loc4_ > 1)
               {
                  _clearId = setTimeout(decodeHead,1,_loc5_ + 1,param2,param3);
                  return;
               }*/
               _loc5_++;
            }
         }
		 
		 
		 var index:int = 0;
		 
		 temp.sort(sortVfmtPictureHead);

		 for each (var kk:VfmtPictureHead in temp)
		 {
			 kk.index = index;
			 
			 index++;
			 
			 filemap.put(kk.name, kk);
		 }
		 
         param2.clear();
         param2 = null;
         decoded = true;
         m_nLastUseTime = getTimer();
         dispatchEvent(new Event("complete"));
//         MyDebug.log("[VPK已加载]" + m_szPureUrl);
         m_boloaded = true;
         isLoading = false;
      }
	  
	  private function sortVfmtPictureHead(head1:VfmtPictureHead, head2:VfmtPictureHead):int
	  {
		  var index1:int = findNameIndex(head1.name);
		  
		  var index2:int = findNameIndex(head2.name);
		  
		  if (index1 < index2)
		  {
			  return -1;
		  }
		  else if (index1 == index2)
		  {
			  return 0;
		  }
		  else
		  {
			  return 1;
		  }
	  }
	  
	  private function findNameIndex(name:String):int
	  {
		  if (name === null || name.length == 0)
		  {
			  return -1
		  }
		  
		  var i:int = 0;
		  
		 var reg:RegExp = /\d+/g;
		  
		  var s:Array = name.match(reg);
		  
		  if (s.length == 0)
		  {
			  return -1;
		  }
		  
		  return int(s[0]);
	  }
      
      public function loadbytes(param1:ByteArray) : void
      {
         var _loc2_:* = null;
         if(isUnload)
         {
            return;
         }
         var _loc3_:int = getTimer();
         filehead = new VfmtStruct(param1);
         param1.position = 0;
         if(filehead.ver == 3 || filehead.ver == 4)
         {
            param1.endian = "bigEndian";
            _data = new ByteArray();
            param1.readBytes(_data,0,param1.length);
            _data.position = 0;
            filehead = new VfmtStruct(_data);
         }
         else
         {
            param1.endian = "littleEndian";
            _data = new ByteArray();
            _data.endian = "littleEndian";
            param1.readBytes(_data,0,param1.length);
            _data.position = 0;
            filehead = new VfmtStruct(_data);
         }
         if(filehead.name != "VFMT")
         {
            try
            {
               _data.uncompress();
               _data.position = 0;
               filehead = new VfmtStruct(_data);
            }
            catch(e:Error)
            {
               MyDebug.log("[VPK格式错误]" + m_szPureUrl);
               decoded = true;
               iserror = true;
               return;
            }
         }
         version = filehead.ver;
         switch(int(filehead.ver) - 1)
         {
            case 0:
            case 1:
               _loc2_ = new ByteArray();
               _loc2_.endian = "littleEndian";
               _data.readBytes(_loc2_,0,filehead.headsize);
               _headsize = _loc2_.length;
               _loc2_.uncompress();
               _loc2_.position = 0;
               _headsize = _loc2_.length - _headsize;
               decodeHead(0,_loc2_,_loc3_);
               break;
            case 2:
               _loc2_ = new ByteArray();
               png8Plte = new ByteArray();
               _data.readBytes(png8Plte,0,1024);
               _data.readBytes(_loc2_,0,filehead.headsize - 1024);
               decodePng8Head(0,_loc2_,_loc3_);
               break;
            case 3:
               _loc2_ = new ByteArray();
               _data.readBytes(_loc2_,0,filehead.headsize);
               decodePng8Head(0,_loc2_,_loc3_);
         }
         if(iserror)
         {
            MyDebug.log("[VPK格式错误]" + m_szPureUrl + " 类型为" + version);
         }
		 
		 totalCount = filemap.size();
		 
		 filemap.eachKey(decode)
      }
	  
	  private function checkFolderAndCreate(url:String):void
	  {
		  var file:File = new File(url);
		  
		  if (!file.exists)
		  {
			  file.createDirectory();
		  }
	  }
	  
	  private static var _jpegde:Object;
	  
	  public static function get jpegde() :Object
	  {
		  if(!_jpegde)
		  {
			  var defineClass:Object = ZetianjiDomain.appDomain.getDefinition("Engine.parser.JPEGDecoder");
			  _jpegde = new defineClass();
		  }
		  return _jpegde;
	  }
	  
	  /**
	   * 
	   * @param param1
	   * @param param3 effec:1
	   * 
	   */	  
	  public function decode(param1:String, param3:int = 1) : void
	  {
		  var _loc10_:* = null;
		  var _loc9_:* = 0;
		  var _loc13_:* = null;
		  var _loc7_:* = null;
		  var _loc6_:int = 0;
		  var _loc8_:* = null;
		  var _loc14_:* = null;
		  var _loc11_:* = null;
		  var _loc4_:* = 0;
		  var _loc12_:* = 0;
		  var _loc5_:* = null;
		  
		  var param2:Object = {};
		  
		  if(filehead.ver == 3)
		  {
			  _loc10_ = filemap.get(param1);
			  if(!_loc10_)
			  {
/*				  param2.m_boloaded = true;
				  param2.m_boProcessing = false;*/
				  MyDebug.log("不存在这个文件" + param1 + "   " + m_szPureUrl);
				  return;
			  }
			  if(_loc10_)
			  {
	/*			  if(param3 == 2)
				  {
					  if(getTimer() - K3TimerManager.stime > 10)
					  {
						  return;
					  }
				  }*/
				  _data.position = _loc10_.dataoffset;
				  _loc9_ = uint(_data.readUnsignedInt());
				  _loc13_ = new ByteArray();
				  _data.readBytes(_loc13_,0,_loc9_);
				  _loc13_.uncompress();
				  _loc13_.position = 0;
				  _loc4_ = uint(_loc13_.readUnsignedInt());
				  if(_loc4_ != 0)
				  {
				  }
				  if(!param2.m_boinited)
				  {
					  param2.m_boinited = true;
					  _loc7_ = new Png8PictureInfo(_loc13_);
					  param2.m_nOffsetX = _loc7_.offx;
					  param2.m_nOffsetY = _loc7_.offy;
					  param2.m_nFullWidth = _loc7_.Width;
					  param2.m_nFullHeight = _loc7_.Height;
					  param2.m_nWidth = _loc7_.truewidth;
					  param2.m_nHeight = _loc7_.trueheight;
					  param2.m_sPicName = param1;
					  _loc7_ = null;
				  }
				  param2.bitmapData = jpegde.parsePng8(_loc13_,param2.m_nWidth,param2.m_nHeight,png8Plte);
				  _loc13_.clear();
				  param2.m_boloaded = true;
				  
				  writePng(param2.bitmapData, param1, param2.m_nOffsetX, param2.m_nOffsetY, _loc10_.index);
			  }
		  }
		  else if(filehead.ver == 4)
		  {
			  _loc10_ = filemap.get(param1);
			  if(!_loc10_)
			  {
				  param2.m_boloaded = true;
				  param2.m_boProcessing = false;
				  MyDebug.log("不存在这个文件" + param1 + "   " + m_szPureUrl);
				  return;
			  }
			  if(_loc10_)
			  {
	/*			  if(param3 == 2)
				  {
					  if(getTimer() - K3TimerManager.stime > 16)
					  {
						  return;
					  }
				  }*/
				  _data.position = _loc10_.dataoffset;
				  _loc9_ = uint(_data.readUnsignedInt());
				  _loc13_ = new ByteArray();
				  _data.readBytes(_loc13_,0,_loc9_);
				  _loc13_.uncompress();
				  _loc13_.position = 0;
				  _loc6_ = _loc13_.readUnsignedInt();
				  _loc8_ = new ByteArray();
				  _loc13_.readBytes(_loc8_,0,_loc6_);
				  _loc4_ = uint(_loc13_.readUnsignedInt());
				  if(_loc4_ != 0)
				  {
				  }
				  if(!param2.m_boinited)
				  {
					  param2.m_boinited = true;
					  _loc7_ = new Png8PictureInfo(_loc13_);
					  param2.m_nOffsetX = _loc7_.offx;
					  param2.m_nOffsetY = _loc7_.offy;
					  param2.m_nFullWidth = _loc7_.Width;
					  param2.m_nFullHeight = _loc7_.Height;
					  param2.m_nWidth = _loc7_.truewidth;
					  param2.m_nHeight = _loc7_.trueheight;
					  param2.m_sPicName = param1;
					  _loc7_ = null;
				  }
				  param2.bitmapData = jpegde.parsePng8(_loc13_,param2.m_nWidth,param2.m_nHeight,_loc8_);
				  _loc13_.clear();
				  _loc8_.clear();
				  param2.m_boloaded = true;
				  
				  writePng(param2.bitmapData, param1,  param2.m_nOffsetX, param2.m_nOffsetY, _loc10_.index);
			  }
		  }
		  else
		  {
			  _loc14_ = filemap.get(param1);
			  if(!_loc14_)
			  {
				  param2.m_boloaded = true;
				  param2.m_boProcessing = false;
				  MyDebug.log("不存在这个文件" + param1 + "   " + m_szPureUrl);
				  return;
			  }
			  if(_loc14_)
			  {
				  if(param2.m_boProcessing)
				  {
					  return;
				  }
				  _data.position = _loc14_.dataoffset - _headsize;
				  if(!param2.m_boinited)
				  {
					  param2.m_boinited = true;
					  if(_data.bytesAvailable >= VfmtPictureInfo.size())
					  {
						  _loc11_ = new VfmtPictureInfo(_data);
						  param2.m_nOffsetX = _loc11_.offx;
						  param2.m_nOffsetY = _loc11_.offy;
						  param2.m_nFullWidth = _loc11_.Width;
						  param2.m_nFullHeight = _loc11_.Height;
						  param2.m_nWidth = _loc11_.truewidth;
						  param2.m_nHeight = _loc11_.trueheight;
						  param2.m_sPicName = param1;
						  _loc11_ = null;
					  }
					  else
					  {
						  param2.m_boloaded = true;
						  param2.m_boProcessing = false;
						  param2.bitmapData = null;
						  return;
					  }
				  }
				  else
				  {
					  _data.position = _data.position + VfmtPictureInfo.size();
				  }
				  if(param3 == 1)
				  {
					  _loc4_ = uint(_data.readUnsignedInt());
					  if(_loc4_ > 0)
					  {
						  _data.readBytes(_alphadata,0,_loc4_);
						  _alphadata.uncompress();
					  }
					  else
					  {
						  _alphadata.clear();
					  }
					  _loc12_ = uint(_data.readUnsignedInt());
					  _data.readBytes(_image,0,_loc12_);
					  _image.position = 0;
					  param2.bitmapData = jpegde.parse(_image,_alphadata);
					  _alphadata.clear();
					  _image.clear();
					  param2.m_boloaded = true;
					  
					  writePng(param2.bitmapData, param1,  param2.m_nOffsetX, param2.m_nOffsetY, _loc14_.index);
				  }
				  else if(param3 == 2)
				  {
					  _loc4_ = uint(_data.readUnsignedInt());
					  if(_loc4_ > 0)
					  {
						  _data.readBytes(_alphadata,0,_loc4_);
						  _alphadata.uncompress();
					  }
					  else
					  {
						  _alphadata.clear();
					  }
					  _loc12_ = uint(_data.readUnsignedInt());
					  _data.readBytes(_image,0,_loc12_);
					  _image.position = 0;
					  param2.bitmapData = jpegde.parse(_image,_alphadata);
					  _alphadata.clear();
					  _image.clear();
					  param2.m_boloaded = true;
					  
					  writePng(param2.bitmapData, param1,  param2.m_nOffsetX, param2.m_nOffsetY, _loc14_.index);
				  }
				  else if(param3 == 0)
				  {
					  if(!param2.m_boProcessing)
					  {
						  _loc4_ = uint(_data.readUnsignedInt());
						  if(_loc4_ > 0)
						  {
							  _loc5_ = new ByteArray();
							  _data.readBytes(_loc5_,0,_loc4_);
							  _loc5_.uncompress();
						  }
						  else
						  {
							  _loc5_ = null;
						  }
						  _loc12_ = uint(_data.readUnsignedInt());
						  _data.readBytes(_image,0,_loc12_);
						  _image.position = 0;
						  param2.m_boProcessing = true;
				/*		  if(ResLoader.getLoaderContext == null)
						  {
							  ResLoader.getLoaderContext = ResLoader.__getLoaderContext;
						  }*/
						  var loader:Loader = new Loader();
						  validBytes[loader] = true;
						  
						  var onAsynLoad:Function = function(e:Event):void {
							  loader.contentLoaderInfo.removeEventListener("complete",onAsynLoad);
							  
							  writePng(e.target.content.bitmapData, param1,  param2.m_nOffsetX, param2.m_nOffsetY, _loc14_.index);
						  }
						  loader.contentLoaderInfo.addEventListener("complete",onAsynLoad);
						  loader.loadBytes(_image);
					  }
					  _image.clear();
				  }
			  }
		  }
	  }
	  
	  private function writePng(bmda:BitmapData, name:String, offsetX:int, offsetY:int, index:int):void
	  {
		  this.checkFolderAndCreate(this.outputFolder);
		  
		  var placementUrl:String = outputFolder + "Placements/";
		  
		  var placementFile:File = new File(placementUrl);
		  
		  if (!placementFile.exists)
		  {
			  placementFile.createDirectory();
		  }
		  
		  var pngName:String = "000" + index

		  if (index >= 10)
		  {
			  pngName = "00" + index;
		  }
		  
		  if (index >= 100)
		  {
			  pngName = "0" + index;
		  }
		  
		  var pngFile:File = new File(outputFolder + pngName + ".png");
		  
		  var ba:ByteArray = PNGEncoder2.encode(bmda);
		  
		  var pngFs:FileStream = new FileStream();
		  pngFs.open(pngFile, FileMode.WRITE);
		  pngFs.writeBytes(ba, 0, ba.length);
		  pngFs.close();
		  
		  var txtUrl:String = placementUrl + pngName + ".txt";
		  
		  var txtData:String = offsetX + "\r\n" + offsetY;
		  
		  var xmlFile:File = new File(txtUrl);
		  
		  var xmlFs:FileStream = new FileStream();
		  xmlFs.open(xmlFile, FileMode.WRITE);
		  xmlFs.writeUTFBytes(txtData);
		  xmlFs.close();
		  
		  finishedCount++;
		  
		  trace("finish " + name + " now:" + finishedCount + " total:" + totalCount);
		  
		  if (finishedCount == totalCount)
		  {
			  if (this.onAllFinishCallback != null)
			  {
				  this.onAllFinishCallback();
				  
				  this.onAllFinishCallback = null;
			  }
		  }
	  }
	  
	  public var onAllFinishCallback:Function;
	  
	  public var outputFolder:String;
	  
	  private var validBytes:Dictionary = new Dictionary();
	  
	  private var totalCount:int;
	  
	  private var finishedCount:int;
	  
      public function unloadAndStop(param1:Boolean = false) : void
      {
         if(_data)
         {
            _data.clear();
            _data = null;
         }
         if(png8Plte)
         {
            png8Plte.clear();
            png8Plte = null;
         }
         isLoading = false;
         filemap.clear();
         filemap = null;
         if(loader && loader.parent)
         {
            if(!m_boloaded)
            {
               loader.removeListeners();
               try
               {
                  if(loader.data as ByteArray)
                  {
                     (loader.data as ByteArray).clear();
                     loader.data = null;
                     loader.parent = null;
                  }
                  loader.close();
                  MyDebug.log("====================cancel load",m_szPureUrl);
               }
               catch(error:Error)
               {
               }
            }
         }
         _m_boloaded = false;
         decoded = false;
         isUnload = true;
         var _loc6_:int = 0;
         var _loc5_:* = picmap.getContent();
         for each(var _loc2_ in picmap.getContent())
         {
            _loc2_.Clear();
         }
         picmap.clear();
         picmap = null;
         loader = null;
         OnProgress = null;
         if(_clearId != -1)
         {
            clearTimeout(_clearId);
         }
         if(_png8clearId != -1)
         {
            clearTimeout(_png8clearId);
         }
         MyDebug.log("[VPK卸载]" + m_szPureUrl);
         m_szPureUrl = null;
         m_szUrl = null;
         filehead = null;
         if(_ownermap)
         {
            _ownermap.clear();
         }
      }
      
    
   }
}
