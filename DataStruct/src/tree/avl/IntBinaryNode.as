package tree.avl
{
	public class IntBinaryNode extends BinaryNode
	{
		public function IntBinaryNode()
		{
			super();
		}
		
		override public function compare(value:Object):int
		{
			var v1:int = int(this.nodeValue);
			
			var v2:int = int(value);
			
			if (v1 < v2)
			{
				return -1;
			}
			else if (v1 == v2)
			{
				return 0;
			}
			else
			{
				return 1;
			}
			
		}
		
	}
}