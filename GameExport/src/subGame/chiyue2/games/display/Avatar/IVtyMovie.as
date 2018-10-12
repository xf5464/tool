package subGame.chiyue2.games.display.Avatar
{
   public interface IVtyMovie extends IVtyMovieObj
   {
       
      
      function setStyle(param1:String) : Boolean;
      
      function setActionName(param1:String) : Boolean;
      
      function setDir(param1:int) : void;
      
      function playFrame(param1:int) : void;
      
      function destory() : void;
      
      function setSex(param1:int) : void;
   }
}
