package subGame.chiyue2.games.core.worker
{
   import flash.display.Loader;
   import flash.events.Event;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   
   import subGame.chiyue2.games.globalCons.GOperation;
   import subGame.chiyue2.utils.MethodTool;
   
   public class VtyBytesLoader extends Loader
   {
      
      private static var indexLoader:int;
       
      
      private var task:Object;
      
      private var nextFunction:Function;
      
      private var myIndex:int;
      
      private var mIsClaer:Boolean;
      
      public function VtyBytesLoader(param1:Function)
      {
         super();
         indexLoader = Number(indexLoader) + 1;
         myIndex = Number(indexLoader);
         nextFunction = param1;
         this.contentLoaderInfo.addEventListener("complete",this.done);
         this.contentLoaderInfo.addEventListener("ioError",this.onError);
         this.contentLoaderInfo.addEventListener("securityError",this.onError);
      }
      
      private function clearLoader() : void
      {
         mIsClaer = true;
      }
      
      public function read(param1:Object, param2:LoaderContext) : void
      {
         this.task = param1;
         if(ByteArray(task.b).bytesAvailable <= 0)
         {
            return this.onError();
         }
         this.loadBytes(task.b,param2);
      }
      
      private final function done(param1:Event) : void
      {
//         MethodTool.add2(delayClearByte,false,[ByteArray(task.b)]);
         this.task.a.unshift(param1.target.content);
         if(this.task.c is Function)
         {
            this.task.c.apply(null,this.task.a);
         }
		 
		 if ((this.task.b as ByteArray) != null)
		 {
			 (this.task.b as ByteArray).clear();
		 }
		 
         this.task.b = null;
         this.task = null;
         if(mIsClaer)
         {
            mIsClaer = false;
         }
         this.nextFunction(this);
      }
      
      private function delayClearByte(param1:ByteArray) : void
      {
         param1.clear();
      }
      
      private final function onError(... rest) : void
      {
		  if (this.task != null && this.task.error != null)
		  {
			  var errorCall:Function = this.task.error;
			  
			  errorCall(this.task.errorParam);
		  }
		  
         if(this.task && this.task.i)
         {
         }
		 
         this.task = null;
         this.nextFunction(this);
      }
   }
}
