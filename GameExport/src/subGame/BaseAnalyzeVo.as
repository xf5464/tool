package subGame
{
	import flash.utils.ByteArray;

	public class BaseAnalyzeVo
	{
		public function BaseAnalyzeVo()
		{
		}
		
		public var folderName:String;
		
		public var loadCallback:Function;
		
		public var fileName:String;
		
		public var inputFileUrl:String;
		
		public var bytes:ByteArray;
	}
}