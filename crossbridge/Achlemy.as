package
{
	import flash.display.Sprite;
	import flash.display3D.IndexBuffer3D;
	import flash.utils.ByteArray;
	
	import sample.MurmurHash.CModule;
	import sample.MurmurHash.MurmurHash3;
	
	public class Achlemy extends Sprite
	{
		public function Achlemy()
		{
			var bytes:ByteArray = new ByteArray();
			
			var i:int = 0;
			
			for (; i < 10; i++)
			{
				bytes.writeByte(i);
			}
			
			bytes.position = 0;
			
			var dataLength:int = bytes.length;
			
			var ptr:int = CModule.malloc(dataLength);
			
			CModule.writeBytes(ptr, dataLength, bytes);
			
			var j:int = MurmurHash3(ptr, dataLength);
			
			var t:String = "";
			
			CModule.ram.position = ptr;
			
			for (i = 0; i < dataLength; i++)
			{
				bytes[i] = CModule.ram.readByte();
			}
			
			bytes.position = 0;
			
			for (i = 0; i < 10; i++)
			{
				t += bytes.readByte() + ",";
			}
			
			trace(t);
			
			for (i = 0; i < dataLength; i++)
			{
				bytes[i] = bytes[i]^0x965;
			}
			
			t = "";
		
			bytes.position = 0;
			
			for (i = 0; i < 10; i++)
			{
				t += bytes.readByte() + ",";
			}

			
			trace(t);
			CModule.free(ptr);
			
	
		}
	}
}