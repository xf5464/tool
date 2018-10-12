package subGame.juezhanshachen.animation
{
   import flash.desktop.Clipboard;
   import flash.desktop.ClipboardFormats;
   import flash.system.System;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   public class ObjectRecord
   {
      
      public static var IS_OPEN:Boolean = false;
      
      private static var _customDic:Dictionary = new Dictionary();
      
      private static var gidgetter:int = 1;
       
      
      public function ObjectRecord()
      {
         super();
      }
      
      public static function rcd(param1:Object) : void
      {
         var _loc2_:String = null;
         var _loc3_:Dictionary = null;
         if(IS_OPEN)
         {
            if(param1 == null)
            {
               throw new Error("ObjectRecord rcd null");
            }
            _loc2_ = getQualifiedClassName(param1);
            _loc3_ = _customDic[_loc2_];
            if(_loc3_ == null)
            {
               _loc3_ = new Dictionary(true);
               _customDic[_loc2_] = _loc3_;
            }
            _loc3_[param1] = ++gidgetter;
            if(gidgetter == int.MAX_VALUE)
            {
               gidgetter = int.MIN_VALUE;
            }
         }
      }
      
      public static function getCustomDicList() : Dictionary
      {
         System.gc();
         return _customDic;
      }
      
      public static function getStateCopyStr(param1:String, param2:int, param3:int, param4:Array) : void
      {
         var dic:Dictionary = null;
         var k:* = undefined;
         var count:int = 0;
         var v:* = undefined;
         var curC:int = 0;
         var ob:* = undefined;
         var items:String = null;
         var uu:int = 0;
         var kkk:String = null;
         var type:String = param1;
         var idbegin:int = param2;
         var idend:int = param3;
         var exKeys:Array = param4;
         Clipboard.generalClipboard.setData(ClipboardFormats.TEXT_FORMAT,"");
         var str:String = "";
         var subDic:Dictionary = null;
         if(type == null || type == "")
         {
            dic = ObjectRecord.getCustomDicList();
            for(k in dic)
            {
               subDic = dic[k] as Dictionary;
               count = 0;
               for(v in subDic)
               {
                  count++;
               }
               str = str + (k.toString() + "\t" + count + "\r\n");
            }
            Clipboard.generalClipboard.setData(ClipboardFormats.TEXT_FORMAT,str);
         }
         else
         {
            if(idbegin < 0)
            {
               idbegin = 0;
            }
            if(idend < 100)
            {
               idend = 100;
            }
            if(idbegin >= idend)
            {
               idbegin = 0;
               idend = 100;
            }
            subDic = ObjectRecord.getCustomDicList()[type];
            if(subDic != null)
            {
               curC = 0;
               for(ob in subDic)
               {
                  if(curC >= idbegin && curC <= idend)
                  {
                     items = "";
                     try
                     {
                        items = ob.toString() + "\t";
                     }
                     catch(err:Error)
                     {
                        items = "typeerror" + "\t";
                     }
                     str = str + items;
                     try
                     {
                        if((ob as Object).hasOwnProperty("name"))
                        {
                           items = ob.name + "\t";
                        }
                        else
                        {
                           items = "-" + "\t";
                        }
                     }
                     catch(err:Error)
                     {
                        items = "nameerror" + "\t";
                     }
                     str = str + items;
                     try
                     {
                        if((ob as Object).hasOwnProperty("id"))
                        {
                           items = ob.id + "\t";
                        }
                        else
                        {
                           items = "-" + "\t";
                        }
                     }
                     catch(err:Error)
                     {
                        items = "iderror" + "\t";
                     }
                     str = str + items;
                     if(exKeys != null && exKeys.length > 0)
                     {
                        uu = 0;
                        while(uu < exKeys.length)
                        {
                           try
                           {
                              kkk = exKeys[uu];
                              if((ob as Object).hasOwnProperty(kkk))
                              {
                                 items = ob[kkk] + "\t";
                              }
                              else
                              {
                                 items = "-" + "\t";
                              }
                           }
                           catch(err:Error)
                           {
                              items = "exkeyerror" + "\t";
                           }
                           str = str + items;
                           uu++;
                        }
                     }
                     str = str + "\r\n";
                  }
                  else if(curC > idend)
                  {
                     break;
                  }
                  curC++;
               }
               Clipboard.generalClipboard.setData(ClipboardFormats.TEXT_FORMAT,str);
            }
         }
      }
   }
}
