package subGame.fengtian.zip
{
   import flash.utils.ByteArray;
   
   public class ZipReader extends ZipFile
   {
       
      
      private var _names:Array;
      
      public function ZipReader(param1:ByteArray)
      {
         this._names = new Array();
         super(param1);
         var _loc2_:int = 0;
         while(_loc2_ < entries.length)
         {
            this._names.push(ZipEntry(entries[_loc2_]).name);
            trace(this._names[this._names.length - 1]);
            _loc2_++;
         }
      }
      
      public function get names() : Array
      {
         return this._names;
      }
      
      public function getFile(param1:String) : ByteArray
      {
         return getInput(getEntry(param1));
      }
   }
}
