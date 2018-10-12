package subGame.chiyue2.games.display.Avatar
{
   public interface IVtyMovieObj
   {
       
      
      function getTopY() : int;
      
      function getDir() : int;
      
      function getActionName() : String;
      
      function hasAction(param1:String) : Boolean;
      
      function isITObj() : Boolean;
      
      function isPiexlHit() : Boolean;
   }
}
