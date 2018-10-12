package subGame.chiyue2.games.core.worker
{
   class _TaskInfo
   {
       
      
      public var url:String;
      
      public var isSwfLib:Boolean;
      
      public var isSaveHistory:Boolean;
      
      public var fcom:Array;
      
      public var fpro:Array;
      
      public var ferr:Array;
      
      public var args:Array;
      
      public var isByteArray:Boolean;
      
      function _TaskInfo()
      {
         super();
      }
      
      public function destory() : void
      {
         this.url = null;
         this.fcom = null;
         this.fpro = null;
         this.ferr = null;
         this.args = null;
      }
      
      public final function addFun(param1:int, param2:Function) : void
      {
         if(param2 is Function)
         {
            switch(int(param1))
            {
               case 0:
                  if(null == this.fcom)
                  {
                     this.fcom = [];
                  }
                  this.fcom[this.fcom.length] = param2;
                  break;
               case 1:
                  if(null == this.fpro)
                  {
                     this.fpro = [];
                  }
                  this.fpro[this.fpro.length] = param2;
                  break;
               case 2:
                  if(null == this.ferr)
                  {
                     this.ferr = [];
                  }
                  this.ferr[this.ferr.length] = param2;
            }
         }
      }
   }
}
