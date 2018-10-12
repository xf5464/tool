package subGame.chiyue2.com.fio.utils
{
   public class FioLang
   {
      
      private static const configs:Array = [];
      
      private static const reg:RegExp = /{(\d)+}/gi;
       
      
      public function FioLang()
      {
         super();
      }
      
      public static function parseConfig(param1:String) : void
      {
         var _loc3_:String = null;
         var _loc4_:Array = null;
         param1 = param1.replace(/^\s*/gm,"");
         param1 = param1.replace(/^\W.*/gm,"");
         param1 = param1.replace(/^[.*[\W+].*=].*$/gm,"");
         param1 = param1.replace(/\\t/gim,"\t");
         param1 = param1.replace(/\[color#([0-9a-f]+)\]/gim,"<font color=\'#$1\'>");
         param1 = param1.replace(/\[color\]/gim,"</font>");
         param1 = param1.replace(/(\r\n)+/gim,"[#@#]");
         param1 = param1.replace(/^(\[#@#])/gi,"");
         param1 = param1.replace(/(\[#@#])$/gi,"");
         param1 = param1.replace(/\\r|\\n/gi,"\n");
         var _loc2_:Array = param1.split("[#@#]");
         for each(_loc3_ in _loc2_)
         {
            _loc4_ = _loc3_.split("=");
            configs[_loc4_.shift()] = _loc4_.join("=");
         }
      }
      
      public static function getLang(param1:*, ... rest) : String
      {
         var gp:Function = null;
         var key:* = param1;
         var replaceParams:Array = rest;
         var str:String = configs[key];
         if(null != str)
         {
            if(str.length > 0)
            {
               if(replaceParams.length > 0)
               {
                  gp = function():*
                  {
                     return replaceParams[arguments[1]];
                  };
                  str = str.replace(reg,gp);
                  gp = null;
               }
            }
            return str;
         }
         return "";
      }
      
      public static function toLinkText(param1:String, ... rest) : String
      {
         return "<a href=\"event:" + rest.join(",") + "\">" + param1 + "</a>";
      }
      
      public static function toColor(param1:String, param2:uint) : String
      {
         return "<font color=\"#" + uintToString(param2) + "\">" + param1 + "</font>";
      }
      
      public static function uintToString(param1:uint) : String
      {
         var _loc2_:String = param1.toString(16);
         var _loc3_:String = "000000";
         return _loc3_.substr(0,6 - _loc2_.length) + _loc2_;
      }
      
      public static function toMultiColor(param1:String, param2:uint = 16711680, param3:uint = 16776960) : String
      {
         var _loc12_:int = 0;
         var _loc13_:uint = 0;
         var _loc4_:int = param1.length;
         var _loc5_:int = _loc4_ - 1;
         if(_loc5_ < 1)
         {
            _loc5_ = 1;
         }
         var _loc6_:Object = uintToRgb(param2);
         var _loc7_:Object = uintToRgb(param3);
         var _loc8_:Number = (_loc7_.r - _loc6_.r) / _loc5_;
         var _loc9_:Number = (_loc7_.g - _loc6_.g) / _loc5_;
         var _loc10_:Number = (_loc7_.b - _loc6_.b) / _loc5_;
         var _loc11_:Array = [];
         _loc12_ = 0;
         while(_loc12_ < _loc4_)
         {
            _loc13_ = rgbToUint(_loc6_.r + _loc12_ * _loc8_,_loc6_.g + _loc12_ * _loc9_,_loc6_.b + _loc12_ * _loc10_);
            _loc11_[_loc12_] = "<font color=\"#" + uintToString(_loc13_) + "\">" + param1.substr(_loc12_,1) + "</font>";
            _loc12_++;
         }
         return _loc11_.join("");
      }
      
      private static function uintToRgb(param1:uint) : Object
      {
         var _loc2_:uint = param1 >> 16;
         var _loc3_:uint = param1 >> 8 & 255;
         var _loc4_:uint = param1 & 255;
         return {
            "r":_loc2_,
            "g":_loc3_,
            "b":_loc4_
         };
      }
      
      private static function rgbToUint(param1:uint, param2:uint, param3:uint) : uint
      {
         return param1 << 16 | param2 << 8 | param3;
      }
   }
}
