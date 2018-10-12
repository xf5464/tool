package  subGame.xiyouzhilu
{
	import flash.utils.ByteArray;
	
	import subGame.BaseAnalyze;
	import subGame.BaseAnalyzeVo;

	public class SptAnalyze extends BaseAnalyze
	{
		public function SptAnalyze()
		{
		}
		
		override public function process($data:BaseAnalyzeVo):void
		{
			super.process($data);
			
			unpackBytes();
		}
		
		private function unpackBytes(param1:Boolean = false) : void
		{
			var classObject:Object = XiyouDomain.xiyouDomain.getDefinition("disPlayEngine.resmgr.bean.Spt3AnimationPack");
			
			var atfClass:Object = XiyouDomain.xiyouDomain.getDefinition("starling.textures.AtfData");
			
			var k:Object = new classObject(this.data.bytes);
			
			var raw:ByteArray = k.raw;
			
			var metaData:Vector.<int> = k.metaData2;
			
			var _loc3_:int = k.metaData2.length;
			var _loc4_:int = 6;
			while(_loc4_ < _loc3_)
			{
				_loc4_++;
				var _loc5_:int = metaData[_loc4_];
				var _loc6_:Object = new AtfData(raw,_loc5_);
			}
			return;
		}
		
	}
}