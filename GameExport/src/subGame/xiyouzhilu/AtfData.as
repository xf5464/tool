package subGame.xiyouzhilu
{
	import flash.utils.ByteArray;
	
	public class AtfData
	{
		
		private static const memoryPixSize:Number = 0.00146484375;
		
		
		private var mFormat:String;
		
		private var mWidth:int;
		
		private var mHeight:int;
		
		private var mNumTextures:int;
		
		private var mData:ByteArray;
		
		private var mSize:Number;
		
		public function AtfData(param1:ByteArray, param2:int = 0)
		{
			var _loc4_:* = false;
			var _loc3_:* = 0;
			super();
			if(!isAtfData(param1,param2))
			{
				throw new ArgumentError("Invalid ATF data");
			}
			if(param1[param2 + 6] == 255)
			{
				param1.position = param2 + 12;
			}
			else
			{
				param1.position = param2 + 6;
			}
			switch(int(param1.readUnsignedByte()))
			{
				case 0:
				case 1:
					mFormat = "bgra";
					break;
				case 2:
				case 3:
					mFormat = "compressed";
					break;
				case 4:
				case 5:
					mFormat = "compressedAlpha";
			}
			mWidth = Math.pow(2,param1.readUnsignedByte());
			mHeight = Math.pow(2,param1.readUnsignedByte());
			mSize = mWidth * mHeight * 0.00146484375;
			mNumTextures = param1.readUnsignedByte();
			mData = param1;
			if(param1[5] != 0 && param1[6] == 255)
			{
				_loc4_ = (param1[5] & 1) == 1;
				_loc3_ = param1[5] >> 1 & 127;
				mNumTextures = !!_loc4_?1:_loc3_;
			}
		}
		
		public static function isAtfData(param1:ByteArray, param2:int = 0) : Boolean
		{
			var _loc3_:* = null;
			if(param1.length < 3)
			{
				return false;
			}
			_loc3_ = String.fromCharCode(param1[param2 + 0],param1[param2 + 1],param1[param2 + 2]);
			return _loc3_ == "ATF";
		}
		
		public function get Size() : Number
		{
			return mSize;
		}
		
		public function get format() : String
		{
			return mFormat;
		}
		
		public function get width() : int
		{
			return mWidth;
		}
		
		public function get height() : int
		{
			return mHeight;
		}
		
		public function get numTextures() : int
		{
			return mNumTextures;
		}
		
		public function get data() : ByteArray
		{
			return mData;
		}
	}
}
