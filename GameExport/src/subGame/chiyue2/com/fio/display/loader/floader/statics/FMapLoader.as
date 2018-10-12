package subGame.chiyue2.com.fio.display.loader.floader.statics
{
   import subGame.chiyue2.com.fio.display.loader.floader.FQueueLoader;
   import subGame.chiyue2.com.fio.utils.FioLang;
   import flash.utils.Dictionary;
   
   public class FMapLoader
   {
      
      private static const mosaicLoader:FQueueLoader = new FQueueLoader(1,1);
      
      private static const tileLoader:FQueueLoader = new FQueueLoader(2,1);
      
      private static var _mapRootUrl:String = "";
      
      private static var _version:String = "";
      
      private static var _mapid:int;
      
      public static var showTileFun:Function;
      
      private static const showMasaicFuns:Dictionary = new Dictionary();
      
      {
         mosaicLoader.comFunction = onMosaicComplete;
         tileLoader.comFunction = onTileComplete;
      }
      
      public function FMapLoader()
      {
         super();
      }
      
      public static function init(param1:String, param2:String) : void
      {
         _mapRootUrl = param1;
         _version = param2;
      }
      
      public static function addMosaicFun(param1:Function) : void
      {
         showMasaicFuns[param1] = 1;
      }
      
      public static function setMapId(param1:int) : void
      {
         if(_mapid != param1)
         {
            _mapid = param1;
            tileLoader.clearTasks();
            mosaicLoader.load(getUrl("mini"),_mapid + "",false);
         }
      }
      
      public static function clearTasks() : void
      {
         tileLoader.clearTasks();
      }
      
      private static function getUrl(param1:String) : String
      {
         param1 = param1 + ".jpg";
         if(null != _version)
         {
            if(_version.length > 0)
            {
               return _mapRootUrl + _mapid + "/" + param1 + "?v=" + _version;
            }
         }
         return _mapRootUrl + _mapid + "/" + param1 + "?v=" + FioLang.getLang("map_" + _mapid);
      }
      
      private static function onMosaicComplete(param1:*, param2:String) : void
      {
         var _loc3_:* = undefined;
         if(null == param2)
         {
            return;
         }
         if(_mapid == int(param2))
         {
            var _loc7_:int = 0;
            var _loc6_:* = showMasaicFuns;
            for(_loc3_ in showMasaicFuns)
            {
               if(_loc3_ is Function)
               {
                  try
                  {
                     _loc3_(param1,_mapid);
                  }
                  catch(err:*)
                  {
                     trace("   FMapLoader onMosaicComplete Error:",err);
                     continue;
                  }
               }
            }
         }
      }
      
      public static function loadTile(param1:int, param2:int) : void
      {
         var _loc3_:String = _mapid + "_" + param1 + "_" + param2;
         tileLoader.load(getUrl(param2 + "_" + param1),_loc3_,false);
      }
      
      private static function onTileComplete(param1:*, param2:String) : void
      {
         if(null == param2)
         {
            return;
         }
         var _loc3_:Array = param2.match(/(\d+)/gi);
         if(_mapid == _loc3_[0])
         {
            if(showTileFun is Function)
            {
               try
               {
                  showTileFun(param1,_loc3_[1],_loc3_[2]);
                  return;
               }
               catch(err:*)
               {
                  trace("   FMapLoader onTileComplete Error:",err);
                  return;
               }
            }
         }
      }
   }
}
