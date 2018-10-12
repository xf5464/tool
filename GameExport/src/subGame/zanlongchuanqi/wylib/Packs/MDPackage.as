package subGame.zanlongchuanqi.wylib.Packs
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.utils.ByteArray;
   
   public class MDPackage extends EventDispatcher
   {
      
      public static const MDPFILEVERSION_100116:uint = 655632;
      
      public static const MDPFILERECORDIDENT:uint = 16860237;
      
      public static const MDPDIRECTORYRECORDIDENT:uint = 16925773;
      
      public static const MDPFILEVERSION_CURRENT:uint = MDPFILEVERSION_100116;
      
      public static const MDPFILEHEADERIDENT:uint = 5260365;
       
      
      protected var m_DataStream:ByteArray;
      
      private var m_FileClass:Class;
      
      protected var m_RootDir:MDPackDirectory;
      
      public var file:String;
      
      private var m_DirectoryClass:Class;
      
      public function MDPackage(param1:Class = null, param2:Class = null)
      {
         super();
         this.m_FileClass = !!param1?param1:MDPackFile;
         this.m_DirectoryClass = !!param2?param2:MDPackDirectory;
      }
      
      public function get stream() : ByteArray
      {
         return this.m_DataStream;
      }
      
      protected function dispatchLoadCompleteEvent() : void
      {
         var _loc1_:Event = new Event(Event.COMPLETE);
         dispatchEvent(_loc1_);
      }
      
      public function load(param1:ByteArray) : void
      {
         this.loadHead(param1);
         if(this.m_RootDir)
         {
            this.m_RootDir.destruct();
            this.m_RootDir = null;
         }
         this.m_DataStream = param1;
         this.m_RootDir = new this.m_DirectoryClass(this,null,MDPackItem.DIRECTORYITEM);
		 
		 if (this.m_RootDir is MDPackDirectory)
		 {
			 (this.m_RootDir as MDPackDirectory).finishAllCallback = this.finishAllCallback;
			 
			 (this.m_RootDir as MDPackDirectory).outputUrl = this.outputUrl;
		 }
		 
         this.m_RootDir.load(param1,this.file);
//         this.dispatchLoadCompleteEvent();
      }
      
      public function releaseStream() : void
      {
         this.m_DataStream = null;
      }
      
      public function get rootDir() : MDPackDirectory
      {
         return this.m_RootDir;
      }
      
      public function get directoryClass() : Class
      {
         return this.m_DirectoryClass;
      }
      
      public function getMemorySize() : int
      {
         return this.m_RootDir.getMemorySize();
      }
      
      protected function loadHead(param1:ByteArray) : void
      {
         if(param1.readUnsignedInt() != MDPFILEHEADERIDENT)
         {
            throw new Error("非有效的资源包文件      " + this.file);
         }
         if(param1.readUnsignedInt() != MDPFILEVERSION_CURRENT)
         {
            throw new Error("资源包文件有效，但需要在更新后才可使用！    " + this.file);
         }
         param1.position = param1.readUnsignedInt();
      }
      
      public function destruct() : void
      {
         this.m_DataStream = null;
         if(this.m_RootDir)
         {
            this.m_RootDir.destruct();
            this.m_RootDir = null;
         }
		 
		 finishAllCallback = null;
      }
	  
	  private var _finishAllCallback:Function;

	  public function get finishAllCallback():Function
	  {
		  return _finishAllCallback;
	  }

	  public function set finishAllCallback(value:Function):void
	  {
		  _finishAllCallback = value;
	  }

      public var outputUrl:String;
	  
      public function get fileClass() : Class
      {
         return this.m_FileClass;
      }
   }
}
