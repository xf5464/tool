package subGame
{
	public class BaseAnalyze
	{
		public function BaseAnalyze()
		{
		}
		
		public function process($data:BaseAnalyzeVo):void
		{
			data = $data;
		}
		
		protected var data:BaseAnalyzeVo;
		
		protected function finish():void
		{
			if (data.hasOwnProperty("callback"))
			{
				var callback:Function = data["callback"];
				
				if (callback != null)
				{
					callback(this);
				}
			}
			
			data = null;
		}
	}
}