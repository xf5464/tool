package subGame.sanrenchuanqi.wylib.CBP
{
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   
   public class CBPReader
   {
      
      private static var missingList:Vector.<String> = new Vector.<String>();
      
      public static const v_object:int = 4;
      
      public static const v_null:int = 0;
      
      public static const v_number:int = 2;
      
      public static const v_string:int = 3;
      
      public static const v_boolean:int = 1;
       
      
      private var m_TopSign:Boolean = true;
      
      private var m_sNamePath:String;
      
      private var m_oTopObject:Object;
      
      private var m_TypeNames:Vector.<NamedType>;
      
      public function CBPReader()
      {
         super();
         this.m_sNamePath = "";
         this.m_TypeNames = new Vector.<CBPReader>();
      }
      
      public function registeType(param1:RegExp, param2:Class) : void
      {
         this.m_TypeNames.push(new NamedType(param1,param2));
      }
      
      protected function CreateObject(param1:String) : Object
      {
         var _loc2_:NamedType = null;
         var _loc3_:int = this.m_TypeNames.length - 1;
         while(_loc3_ > -1)
         {
            _loc2_ = this.m_TypeNames[_loc3_];
            if(_loc2_.name.test(param1))
            {
               return new _loc2_.type();
            }
            _loc3_--;
         }
         return new Array();
      }
      
      public function clearTypes() : void
      {
         this.m_TypeNames.length = 0;
      }
      
      private function traceMissingObject(param1:String, param2:String, param3:String = null) : void
      {
         if(missingList.indexOf(param1 + param2) < 0)
         {
            missingList.push(param1 + param2);
            UICallBack.DebugWinTrace(param1 + ":缺少属性:" + param2 + (param3 != null?" 路径:" + param3:""),0,"FF0000");
            trace(param1 + ":缺少属性:" + param2 + (param3 != null?" 路径:" + param3:""));
         }
      }
      
      protected function readObject(param1:ByteArray, param2:Object) : void
      {
         var _loc5_:String = null;
         var _loc6_:Object = null;
         var _loc7_:Object = null;
         var _loc8_:int = 0;
         var _loc3_:int = param1.readUnsignedByte();
         var _loc4_:int = param1.readUnsignedByte();
         switch(_loc4_)
         {
            case v_null:
               param1.position = param1.position + 8;
               _loc5_ = param1.readUTFBytes(_loc3_);
               if(param2.hasOwnProperty(_loc5_) || param2 is Array)
               {
                  param2[_loc5_] = null;
               }
               else
               {
                  this.traceMissingObject(param2.toString(),_loc5_);
               }
               break;
            case v_boolean:
               _loc6_ = param1.readBoolean();
               param1.position = param1.position + 7;
               _loc5_ = param1.readUTFBytes(_loc3_);
               if(param2.hasOwnProperty(_loc5_) || param2 is Array)
               {
                  param2[_loc5_] = _loc6_;
               }
               else
               {
                  this.traceMissingObject(param2.toString(),_loc5_);
               }
               break;
            case v_number:
               _loc6_ = param1.readDouble();
               _loc5_ = param1.readUTFBytes(_loc3_);
               if(param2.hasOwnProperty(_loc5_) || param2 is Array)
               {
                  param2[_loc5_] = _loc6_;
               }
               else
               {
                  this.traceMissingObject(param2.toString(),_loc5_);
               }
               break;
            case v_string:
               _loc6_ = param1.readUnsignedInt();
               param1.position = param1.position + 4;
               _loc5_ = param1.readUTFBytes(_loc3_);
               if(param2.hasOwnProperty(_loc5_) || param2 is Array)
               {
                  param2[_loc5_] = param1.readUTFBytes(int(_loc6_));
               }
               else
               {
                  this.traceMissingObject(param2.toString(),_loc5_);
               }
               break;
            case v_object:
               _loc6_ = param1.readUnsignedInt();
               param1.position = param1.position + 4;
               _loc5_ = param1.readUTFBytes(_loc3_);
               if(this.m_sNamePath.length > 0)
               {
                  this.m_sNamePath = this.m_sNamePath + ("." + _loc5_);
               }
               else
               {
                  this.m_sNamePath = _loc5_;
               }
               _loc7_ = this.CreateObject(this.m_sNamePath);
               if(param2.hasOwnProperty(_loc5_) || _loc5_ == "" || param2 is Array)
               {
                  param2[_loc5_] = _loc7_;
               }
               else
               {
                  this.traceMissingObject(param2.toString(),_loc5_,this.m_sNamePath);
               }
               _loc8_ = 0;
               while(_loc8_ < _loc6_)
               {
                  this.readObject(param1,_loc7_);
                  _loc8_++;
               }
               if(this.m_sNamePath.length == _loc3_)
               {
                  this.m_sNamePath = "";
               }
               else
               {
                  this.m_sNamePath = this.m_sNamePath.substr(0,this.m_sNamePath.length - _loc3_ - 1);
               }
         }
      }
      
      public function readCBP(param1:ByteArray, param2:Object = null) : Object
      {
         this.m_sNamePath = "";
         param1.endian = Endian.LITTLE_ENDIAN;
         var _loc3_:uint = param1.readUnsignedInt();
         if(_loc3_ != 5259843)
         {
            throw new Error("Stream does not include CBP header");
         }
         var _loc4_:uint = param1.readUnsignedInt();
         if(_loc4_ != 17435658)
         {
            throw new Error("invalid CBP version");
         }
         var _loc5_:uint = param1.readUnsignedInt();
         var _loc6_:uint = param1.readUnsignedInt();
         param1.position = param1.position + 48;
         if(param1.bytesAvailable < _loc6_)
         {
            throw new Error("CBP steam is not ready");
         }
         var _loc7_:ByteArray = new ByteArray();
         _loc7_.writeBytes(param1,param1.position,_loc6_);
         _loc7_.position = 0;
         _loc7_.uncompress();
         _loc7_.endian = Endian.LITTLE_ENDIAN;
         param2 = new Object();
         this.readObject(_loc7_,param2);
         return param2[""];
      }
   }
}

class NamedType
{
    
   
   public var type:Class;
   
   public var name:RegExp;
   
   function NamedType(param1:RegExp, param2:Class)
   {
      super();
      this.name = param1;
      this.type = param2;
   }
}
