package subGame.chiyue2.games.display.Avatar
{
   public interface IVtyMovieBody extends IVtyMovie
   {
       
      
      function isWorking() : Boolean;
      
      function play() : void;
      
      function stop() : void;
      
      function playAction(param1:String, param2:int = -1, param3:Function = null, param4:int = 0, param5:Function = null) : void;
      
      function setShadow(param1:String) : void;
      
      function setWeapon(param1:String) : void;
      
      function setHead(param1:String) : void;
   }
}
