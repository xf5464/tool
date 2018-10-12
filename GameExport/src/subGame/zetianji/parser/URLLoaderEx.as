package  subGame.zetianji.parser
{
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   
   public class URLLoaderEx extends URLLoader
   {
       
      
      public var parent;
      
      public var m_boLoaded:Boolean = false;
      
      public var m_szUrl:String;
      
      public var completeFunc:Function;
      
      public var errorFunc:Function;
      
      public var progressFunc:Function;
      
      public var loadIndex:int;
      
      public var priority:int;
      
      public var startDownTime:int;
      
      public var tryTimes:int;
      
      public var m_needPush:Boolean = false;
      
      public var loaderPriority:int = 0;
      
      private var _pureUrl:String;
      
      public function URLLoaderEx(param1:URLRequest = null)
      {
         super(param1);
      }
      
      public function removeListeners() : void
      {
         if(this.hasEventListener("complete") && null != completeFunc)
         {
            this.removeEventListener("complete",completeFunc);
         }
         if(this.hasEventListener("ioError") && null != errorFunc)
         {
            this.removeEventListener("ioError",errorFunc);
         }
         if(this.hasEventListener("progress") && null != progressFunc)
         {
            this.removeEventListener("progress",progressFunc);
         }
         progressFunc = null;
         completeFunc = null;
         errorFunc = null;
      }
      
      public function set m_szPureUrl(param1:String) : void
      {
         if(!param1)
         {
            return;
         }
         _pureUrl = param1;
            return;
      }
      
      public function get m_szPureUrl() : String
      {
         return "";
      }
   }
}
