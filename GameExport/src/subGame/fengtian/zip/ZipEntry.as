package subGame.fengtian.zip
{
   import flash.utils.ByteArray;
   
   public class ZipEntry
   {
       
      
      private var _name:String;
      
      private var _size:int = -1;
      
      private var _compressedSize:int = -1;
      
      private var _crc:uint;
      
      internal var dostime:uint = 0;
      
      private var _method:int = -1;
      
      private var _extra:ByteArray;
      
      private var _comment:String = "";
      
	  internal var flag:int;
      
	  internal var version:int;
      
	  internal var offset:int;
      
      public function ZipEntry(param1:String)
      {
         super();
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get time() : Number
      {
         var _loc1_:Date = new Date((this.dostime >> 25 & 127) + 1980,(this.dostime >> 21 & 15) - 1,this.dostime >> 16 & 31,this.dostime >> 11 & 31,this.dostime >> 5 & 63,(this.dostime & 31) << 1);
         return _loc1_.time;
      }
      
      public function set time(param1:Number) : void
      {
         var _loc2_:Date = new Date(param1);
         if(_loc2_.getFullYear() < 1980)
         {
            _loc2_ = new Date(1980,1,1,0,0,0);
         }
         this.dostime = _loc2_.getFullYear() - 1980 << 25 | _loc2_.getMonth() << 21 | _loc2_.getDate() << 16 | _loc2_.getHours() << 11 | _loc2_.getMinutes() << 5 | _loc2_.getSeconds() >> 1;
      }
      
      public function get size() : int
      {
         return this._size;
      }
      
      public function set size(param1:int) : void
      {
         this._size = param1;
      }
      
      public function get compressedSize() : int
      {
         return this._compressedSize;
      }
      
      public function set compressedSize(param1:int) : void
      {
         this._compressedSize = param1;
      }
      
      public function get crc() : uint
      {
         return this._crc;
      }
      
      public function set crc(param1:uint) : void
      {
         this._crc = param1;
      }
      
      public function get method() : int
      {
         return this._method;
      }
      
      public function set method(param1:int) : void
      {
         this._method = param1;
      }
      
      public function get extra() : ByteArray
      {
         return this._extra;
      }
      
      public function set extra(param1:ByteArray) : void
      {
         this._extra = param1;
      }
      
      public function get comment() : String
      {
         return this._comment;
      }
      
      public function set comment(param1:String) : void
      {
         this._comment = param1;
      }
      
      public function isDirectory() : Boolean
      {
         return this._name.charAt(this._name.length - 1) == "/";
      }
      
      public function toString() : String
      {
         return this._name;
      }
   }
}
