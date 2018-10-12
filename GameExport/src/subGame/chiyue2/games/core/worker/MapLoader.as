package subGame.chiyue2.games.core.worker
{
   public class MapLoader
   {
      
      private static const loader:QueueLoader = new QueueLoader();
       
      
      public function MapLoader()
      {
         super();
      }
      
      public static function clear() : void
      {
         loader.clearTasks();
      }
      
      public static function load(param1:String, param2:Function = null, param3:Function = null, param4:Function = null, param5:Boolean = false) : void
      {
         loader.load(param1,false,param5,param2,param3,param4);
      }
      
      public static function loadAtf(param1:String, param2:Function = null, param3:Function = null, param4:Function = null, param5:Boolean = false) : void
      {
         var _loc6_:Boolean = true;
         loader.load(param1,false,param5,param2,param3,param4,_loc6_);
      }
   }
}
