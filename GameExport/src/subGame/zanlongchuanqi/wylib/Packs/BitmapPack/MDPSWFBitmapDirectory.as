package subGame.zanlongchuanqi.wylib.Packs.BitmapPack
{
   import flash.display.BitmapData;
   import flash.display.LoaderInfo;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   import subGame.zanlongchuanqi.wylib.Packs.BitmapPack.Internal.MDPSWFLoadQueue;
   import subGame.zanlongchuanqi.wylib.Packs.MDPackDirectory;
   import subGame.zanlongchuanqi.wylib.Packs.MDPackFile;
   import subGame.zanlongchuanqi.wylib.Packs.MDPackItem;
   import subGame.zanlongchuanqi.wylib.Packs.MDPackage;
   
   public class MDPSWFBitmapDirectory extends MDPackDirectory
   {
      
      private static const ZeroPoint:Point = new Point();
      
      private static var SWFLoadQueue:MDPSWFLoadQueue = new MDPSWFLoadQueue(32);
      
      private static var ReadOffsetBytes:ByteArray;
       
      
      public function MDPSWFBitmapDirectory(param1:MDPackage, param2:MDPackItem, param3:int = 2)
      {
         super(param1,param2,param3);
      }
      
      private function onLoadSWFComplete(param1:LoaderInfo, param2:ByteArray) : void
      {
         var _loc6_:int = 0;
         var _loc11_:MDPBitmapData = null;
         var _loc12_:BitmapData = null;
         var _loc15_:MDPackItem = null;
         var _loc3_:Class = param1.applicationDomain.getDefinition("AMImage") as Class;
         if(_loc3_ == null)
         {
            throw new Error("资源包中的SWF不是通过有效的工具或规则打包的SWF文件！");
         }
         var _loc4_:BitmapData = new _loc3_();
         var _loc5_:MDPackFile = m_Items[2];
         var _loc7_:int = _loc5_.fileSize / 16;
         var _loc8_:Rectangle = new Rectangle();
         var _loc9_:Point = ZeroPoint;
         var _loc10_:Class = m_Package.fileClass;
         param2.position = _loc5_.fileOffset;
         _loc6_ = 0;
         while(_loc6_ < _loc7_)
         {
            _loc8_.x = param2.readInt();
            _loc8_.y = param2.readInt();
            _loc8_.width = param2.readInt();
            _loc8_.height = param2.readInt();
            _loc12_ = new BitmapData(_loc8_.width,_loc8_.height,true,4294901760);
            _loc12_.copyPixels(_loc4_,_loc8_,_loc9_);
            _loc11_ = new _loc10_(m_Package,this,FILEITEM);
            _loc11_.bitmapData = _loc12_;
            m_Items.push(_loc11_);
            _loc6_++;
         }
         _loc4_.dispose();
         var _loc13_:Array = m_Items.splice(0,3);
         var _loc14_:MDPackItem = _loc13_[1];
         this.readOffsetFile(_loc14_);
         for each(_loc15_ in _loc13_)
         {
            _loc15_.destruct();
         }
      }
      
      protected function readOffsetFile(param1:MDPackItem) : void
      {
         var _loc2_:ByteArray = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:MDPBitmapData = null;
         if(!ReadOffsetBytes)
         {
            ReadOffsetBytes = new ByteArray();
            ReadOffsetBytes.endian = Endian.LITTLE_ENDIAN;
         }
         _loc2_ = ReadOffsetBytes;
         _loc2_.position = 0;
         MDPackFile(param1).loadFileData(_loc2_);
         _loc2_.position = 0;
         _loc6_ = m_Items.length;
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            _loc7_ = m_Items[_loc5_] as MDPBitmapData;
            if(_loc7_)
            {
               _loc3_ = _loc2_.readShort();
               _loc4_ = _loc2_.readShort();
               _loc7_.setOffsetXY(_loc3_,_loc4_);
            }
            _loc5_++;
         }
      }
      
      override public function load(param1:ByteArray, param2:String = "") : void
      {
         var _loc3_:MDPackFile = null;
         var _loc4_:MDPackItem = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:MDPBitmapData = null;
         super.load(param1,param2);
         if(m_Items)
         {
            if(m_Items.length >= 3 && MDPackItem(m_Items[0]).name == "!media.swf" && MDPackItem(m_Items[1]).name == "!offset" && MDPackItem(m_Items[2]).name == "!rect")
            {
               _loc3_ = m_Items[0];
               SWFLoadQueue.requestLoadSWF(param1,_loc3_.fileOffset,_loc3_.fileSize,this.onLoadSWFComplete);
            }
            else
            {
               _loc4_ = m_Items[m_Items.length - 1];
               if(!_loc4_.isDirectory && _loc4_.name == "offset")
               {
                  m_Items.pop();
               }
               else
               {
                  _loc4_ = null;
               }
               _loc6_ = m_Items.length;
               _loc5_ = 0;
               while(_loc5_ < _loc6_)
               {
                  _loc7_ = m_Items[_loc5_] as MDPBitmapData;
                  if(_loc7_)
                  {
                     _loc7_.loadBitmapData();
                  }
                  _loc5_++;
               }
               if(_loc4_)
               {
                  this.readOffsetFile(_loc4_);
               }
               if(!m_ParentItem)
               {
                  m_Package.releaseStream();
               }
            }
         }
      }
   }
}
