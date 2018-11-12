package tree.BPlus
{
	public class BPlusInnerNode
	{
		public function BPlusInnerNode($index:uint, $nodeValue:Object)
		{
			_index = $index;
			
			_nodeValue = $nodeValue;
		}
		
		private var _nodeValue:Object;

		public function get nodeValue():Object
		{
			return _nodeValue;
		}

		private var _index:uint;

		public function get index():uint
		{
			return _index;
		}
		
		public var ownNode:BPlusNode;

	}
}