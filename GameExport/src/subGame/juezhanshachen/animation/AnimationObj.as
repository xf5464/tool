package subGame.juezhanshachen.animation
{
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.system.ApplicationDomain;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   
   public class AnimationObj
   {
      
      private static var DIR_BMP_ARRAY:Array = [0,1,2,3,4,3,2,1];
      
      private static var MAX_DIRS:int = 8;
      
      public static var DRAW_CENTER_X:int = 256;
      
      public static var DRAW_CENTER_Y:int = 256;
       
      
      public var useMemory:int = 0;
      
      private var _frameCount:int = 0;
      
      private var _replay:Boolean = false;
      
      private var _resDirNum:int = 5;
      
      private var _blendMode:int = 0;
      
      private var _directions:Vector.<AnimationDirection>;
      
      public var interval:int = 0;
      
      private var _width:int = 0;
      
      private var _height:int = 0;
      
      private var _clipWidth:int = 0;
      
      private var _clipHeight:int = 0;
      
      private var _name:String = null;
      
      private var _frames:Vector.<CFrame>;
      
      public function AnimationObj()
      {
         this._directions = new Vector.<AnimationDirection>();
         this._frames = new Vector.<CFrame>();
         super();
         ObjectRecord.rcd(this);
      }
      
      public function dispose() : void
      {
         var _loc1_:AnimationDirection = null;
         for each(_loc1_ in this._directions)
         {
            _loc1_.dispose();
         }
         this._directions.length = 0;
         this._directions = null;
      }
      
      public function get frames() : Vector.<CFrame>
      {
         return this._frames;
      }
      
      public function get clipHeight() : int
      {
         return this._clipHeight;
      }
      
      public function get clipWidth() : int
      {
         return this._clipWidth;
      }
      
      public function get width() : int
      {
         return this._width;
      }
      
      public function get height() : int
      {
         return this._height;
      }
      
	  private var outputPath:String;
	  
	  private var actionName:String;
	  
      public function parseSpr(param1:ByteArray, param2:String, param3:String, $outputPath:String) : void
      {
		  outputPath = $outputPath;
		  
		  actionName  = param2;
		  
         var _loc6_:String = null;
         var _loc8_:AnimationDirection = null;
         var _loc9_:int = 0;
         var _loc10_:ASyncBitmapData = null;
         var _loc11_:int = 0;
         var _loc12_:AnimationFrame = null;
         var _loc13_:ByteArray = null;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:AnimationDirection = null;
         var _loc17_:int = 0;
         var _loc18_:AnimationFrame = null;
         var _loc19_:AnimationFrame = null;
         var _loc20_:CFrame = null;
         param1.position = 0;
         param1.endian = Endian.LITTLE_ENDIAN;
         var _loc4_:int = param1.readInt();
         if(_loc4_ != 1364021760)
         {
            trace("错误的动画文件");
            return;
         }
         this._frameCount = param1.readShort();
         this.replay = param1.readByte() == 1;
         this.resDirNum = param1.readByte();
         this.blendMode = param1.readByte();
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         _loc7_ = 0;
         while(_loc7_ < MAX_DIRS)
         {
            _loc8_ = new AnimationDirection();
            if(_loc7_ < 5 || this.resDirNum == MAX_DIRS)
            {
               if(!param1.bytesAvailable)
               {
                  break;
               }
               _loc8_.dirID = param1.readByte();
               _loc8_.depth = param1.readByte();
               _loc9_ = param1.readByte();
               _loc8_.keyFrames = _loc9_;
               _loc5_ = (_loc8_.dirID - 1) * _loc9_;
               _loc11_ = 0;
               while(_loc11_ < _loc9_)
               {
                  _loc12_ = new AnimationFrame();
                  _loc12_.offsetX = param1.readShort();
                  _loc12_.offsetY = param1.readShort();
                  _loc12_.width = param1.readShort();
                  _loc12_.height = param1.readShort();
                  _loc12_.bmpWidth = param1.readShort();
                  _loc12_.bmpHeight = param1.readShort();
                  _loc12_.interval = param1.readShort();
                  this.interval = _loc12_.interval;
                  if(_loc12_.bmpWidth == 0)
                  {
                     _loc12_.bmpWidth = 1;
                  }
                  if(_loc12_.bmpHeight == 0)
                  {
                     _loc12_.bmpHeight = 1;
                  }
                  _loc13_ = new ByteArray();
                  _loc14_ = param1.readInt();
                  this.useMemory = this.useMemory + _loc12_.bmpWidth * _loc12_.bmpHeight * 4;
                  if(_loc14_ > 0)
                  {
                     param1.readBytes(_loc13_,0,_loc14_);
                  }
                  _loc6_ = param3 + param2 + "@" + _loc5_;
                  _loc5_++;
                  _loc10_ = new ASyncBitmapData(_loc12_.bmpWidth,_loc12_.bmpHeight,_loc13_);
                  _loc12_._asynBitmapdata = _loc10_;
                //this._frames.push(new CFrame(_loc6_,_loc10_,_loc12_.offsetX,_loc12_.offsetY,_loc12_.width,_loc12_.height));
                  _loc8_.frames.push(_loc12_);
                  _loc11_++;
               }
               _loc8_.keyFrames = _loc8_.frames.length;
               this._directions.push(_loc8_);
            }
            else
            {
				/* _loc15_ = MAX_DIRS - _loc7_;
               _loc16_ = this._directions[_loc15_];
               _loc9_ = _loc16_.keyFrames;
               _loc5_ = _loc15_ * _loc9_;
               _loc17_ = 0;
               while(_loc17_ < _loc9_)
               {
                  _loc18_ = _loc16_.frames[_loc17_];
                  _loc19_ = new AnimationFrame();
                  if(_loc18_.offsetX != 0 || _loc18_.offsetY != 0)
                  {
                     _loc19_.offsetX = _loc18_.offsetX;
                     _loc19_.offsetY = _loc18_.offsetY;
                  }
                  else
                  {
                     _loc19_.offsetX = 0;
                     _loc19_.offsetY = 0;
                  }
                  _loc19_.width = _loc18_.width;
                  _loc19_.height = _loc18_.height;
                  _loc19_.bmpWidth = _loc18_.bmpWidth;
                  _loc19_.bmpHeight = _loc18_.bmpHeight;
                  _loc19_.interval = _loc18_.interval;
                  _loc19_.bmp = _loc18_.bmp;
                  _loc19_._asynBitmapdata = _loc18_._asynBitmapdata;
                  _loc8_.frames.push(_loc19_);
                  _loc8_.keyFrames = _loc8_.frames.length;
                  _loc6_ = param3 + param2 + "@" + _loc5_;
                  _loc5_++;
                 _loc20_ = new CFrame(_loc6_,_loc19_._asynBitmapdata,_loc19_.offsetX,_loc19_.offsetY,_loc19_.width,_loc19_.height,true);
                  this._frames.push(_loc20_);
                  _loc17_++;*/
               }
//               this._directions.push(_loc8_);
            _loc7_++;
         }
         if(this._frameCount == 0)
         {
            if(this._directions.length > 0)
            {
               this._frameCount = this._directions[0].keyFrames * this.resDirNum;
            }
            if(this._frameCount == 0)
            {
               this._frameCount = 1;
            }
         }
		 
		 var actionUrl:String = outputPath + "/" + actionName + "/";
		 
		 checkFolderAndCreate(actionUrl);

		 var placementUrl:String = actionUrl + "/Placements/";
		 
		 var placementFile:File = new File(placementUrl);
		 
		 if (!placementFile.exists)
		 {
			 placementFile.createDirectory();
		 }
		 
		 var index:int = 0;
		 
		 for each (var direction:AnimationDirection in _directions)
		 {
			 
			 for each (var frame:AnimationFrame in direction.frames)
			 {
				 if (frame._asynBitmapdata == null)
				 {
					 continue;
				 }
				 
				 var ba:ByteArray = frame._asynBitmapdata.imgData;
				 
				 var offsetX:int = frame.offsetX;
				 
				 var offsetY:int = frame.offsetY;
				 
				 var pngName:String = "000" + index.toString();
				 
				 if (index >= 10)
				 {
					 pngName = "00" + index.toString();
				 }
				 
				 var pngFile:File = new File(actionUrl + pngName + ".png");
				 
				 var bitmapdata:BitmapData = new BitmapData(frame.bmpWidth,frame.bmpHeight,true, 0xff0000);
				 ba.uncompress();
				 ba.position = 0;
				 if(ba.length > 0)
				 {
					 var rec:Rectangle = new Rectangle(0,0,frame.bmpWidth,frame.bmpHeight);
					 bitmapdata.setPixels(rec, ba);
				 }
				 
				 var retByteArray:ByteArray = PNGEncoder2.encode(bitmapdata);
				 
				 var pngFs:FileStream = new FileStream();
				 pngFs.open(pngFile, FileMode.WRITE);
				 pngFs.writeBytes(retByteArray, 0, retByteArray.length);
				 pngFs.close();
				 
//				 bitmapdata.dispose();
				 
				 var frameEndTime:int = flash.utils.getTimer();
				 
				 var txtUrl:String = placementUrl + pngName + ".txt";
				 
				 var txtData:String = offsetX + "\r\n" +  offsetY;
				 
				 var xmlFile:File = new File(txtUrl);
				 
				 var xmlFs:FileStream = new FileStream();
				 xmlFs.open(xmlFile, FileMode.WRITE);
				 xmlFs.writeUTFBytes(txtData);
				 xmlFs.close();
				 index++;
				 
				 trace("generate:" + pngFile.nativePath);
			 }
		 }
		 
		 _directions.length = 0;
      }
	  
	  protected function onLoadByteComplete(event:Event):void
	  {
		  // TODO Auto-generated method stub
		  
	  }
	  
	  private function checkFolderAndCreate(url:String):void
	  {
		  var file:File = new File(url);
		  
		  if (!file.exists)
		  {
			  file.createDirectory();
		  }
	  }
      
      public function parseSwf(param1:ApplicationDomain, param2:String, param3:String) : Boolean
      {
         return true;
      }
      
      public function flipBitmapDataHorizontal(param1:BitmapData) : BitmapData
      {
         var _loc2_:Matrix = new Matrix();
         _loc2_.scale(-1,1);
         _loc2_.translate(param1.width,0);
         var _loc3_:BitmapData = new ZBitmapData(param1.width,param1.height,true,16711680);
         _loc3_.draw(param1,_loc2_);
         return _loc3_;
      }
      
      public function getMirrorObj(param1:String, param2:int, param3:String) : AnimationObj
      {
         var _loc7_:AnimationDirection = null;
         var _loc8_:AnimationDirection = null;
         var _loc9_:AnimationFrame = null;
         var _loc10_:AnimationFrame = null;
         var _loc11_:ASyncBitmapData = null;
         var _loc12_:String = null;
         var _loc13_:CFrame = null;
         var _loc4_:AnimationObj = new AnimationObj();
         _loc4_.useMemory = this.useMemory;
         _loc4_.frameCount = this._frameCount;
         _loc4_.replay = this._replay;
         _loc4_.resDirNum = this._resDirNum;
         _loc4_.blendMode = this._blendMode;
         _loc4_.interval = this.interval;
         _loc4_.width = this._width;
         _loc4_.height = this._height;
         _loc4_.clipWidth = this._clipWidth;
         _loc4_.clipHeight = this._clipHeight;
         var _loc5_:Vector.<AnimationDirection> = new Vector.<AnimationDirection>();
         var _loc6_:int = 0;
         if(this.directions.length > 0)
         {
            _loc7_ = this.directions[0];
            _loc8_ = new AnimationDirection();
            _loc8_.dirID = param2;
            _loc6_ = param2 * _loc7_.frames.length;
            for each(_loc9_ in _loc7_.frames)
            {
               _loc10_ = new AnimationFrame();
               if(_loc9_.offsetX != 0 || _loc9_.offsetY != 0)
               {
                  _loc10_.offsetX = _loc9_.width - _loc9_.offsetX - _loc9_.bmpWidth;
                  _loc10_.offsetY = _loc9_.offsetY;
               }
               else
               {
                  _loc10_.offsetX = 0;
                  _loc10_.offsetY = 0;
               }
               _loc10_.width = _loc9_.width;
               _loc10_.height = _loc9_.height;
               _loc10_.bmpWidth = _loc9_.bmpWidth;
               _loc10_.bmpHeight = _loc9_.bmpHeight;
               _loc10_.interval = _loc9_.interval;
               _loc10_.bmp = null;
               _loc11_ = new ASyncBitmapData(_loc9_.bmpWidth,_loc9_.bmpHeight,null,this.flipBitmapDataHorizontal(_loc9_._asynBitmapdata.bitmapData));
               _loc10_._asynBitmapdata = _loc11_;
               _loc8_.frames.push(_loc10_);
               _loc8_.keyFrames = _loc8_.frames.length;
               _loc12_ = param3 + param1 + "@" + _loc6_;
               _loc6_++;
               _loc13_ = new CFrame(_loc12_,_loc10_._asynBitmapdata,_loc10_.offsetX,_loc10_.offsetY,_loc10_.width,_loc10_.height,true);
               _loc4_.frames.push(_loc13_);
            }
            _loc5_.push(_loc8_);
         }
         _loc4_.directions = _loc5_;
         return _loc4_;
      }
      
      public function set height(param1:int) : void
      {
         this._height = param1;
      }
      
      public function set width(param1:int) : void
      {
         this._width = param1;
      }
      
      public function ReleaseBitmap() : void
      {
         var _loc1_:AnimationDirection = null;
         var _loc2_:AnimationFrame = null;
         for each(_loc1_ in this._directions)
         {
            for each(_loc2_ in _loc1_)
            {
               if(_loc2_.bmp != null)
               {
                  _loc2_.dispose();
               }
            }
         }
      }
      
      public function get direction() : AnimationDirection
      {
         if(this._directions == null || this._directions.length == 0)
         {
            return null;
         }
         return this._directions[0];
      }
      
      public function get directions() : Vector.<AnimationDirection>
      {
         return this._directions;
      }
      
      public function set directions(param1:Vector.<AnimationDirection>) : void
      {
         this._directions = param1;
      }
      
      public function get blendMode() : int
      {
         return this._blendMode;
      }
      
      public function set blendMode(param1:int) : void
      {
         if(param1 == -1)
         {
            param1 = 0;
         }
         this._blendMode = param1;
      }
      
      public function get resDirNum() : int
      {
         return this._resDirNum;
      }
      
      public function set resDirNum(param1:int) : void
      {
         this._resDirNum = param1;
      }
      
      public function get replay() : Boolean
      {
         return this._replay;
      }
      
      public function set replay(param1:Boolean) : void
      {
         this._replay = param1;
      }
      
      public function get frameCount() : int
      {
         return this._frameCount;
      }
      
      public function set frameCount(param1:int) : void
      {
         this._frameCount = param1;
      }
      
      public function set clipWidth(param1:int) : void
      {
         this._clipWidth = param1;
      }
      
      public function set clipHeight(param1:int) : void
      {
         this._clipHeight = param1;
      }
   }
}
