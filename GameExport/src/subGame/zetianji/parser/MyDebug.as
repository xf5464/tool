package subGame.zetianji.parser
{
   public class MyDebug
   {
      
      public static var isDebug:Boolean = true;
      
      public static var isDebugClass:Class;
       
      
      public function MyDebug()
      {
         super();
      }
      
      public static function log(... rest) : void
      {
         if(null != isDebugClass)
         {
            if(Object(isDebugClass).hasOwnProperty("instance") && isDebugClass.instance != null)
            {
               isDebugClass.instance.log(rest);
            }
            else if(isDebug)
            {
               trace(rest);
            }
         }
         else if(isDebug)
         {
            trace(rest);
         }
      }
   }
}
