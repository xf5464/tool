package tree.BPlus
{
	import flash.display.BlendMode;

	public class BPlusNode
	{
		public function BPlusNode($degree:int, $getTreeHeightFunc:Function, $setRootFunction:Function)
		{
			innerNodes = new Vector.<BPlusInnerNode>();
			
			leafNodes = new Vector.<BPlusNode>();
			
			getTreeHeightFunc = $getTreeHeightFunc;
			
			setRootFunction = $setRootFunction;
			
			MIN_NODE_NUM = $degree/2;
			
			MAX_NODE_NUM = $degree - 1;
			
			degree = $degree;
		}
		
		private var degree:int;
		
		private var MIN_NODE_NUM:int;
		
		private var MAX_NODE_NUM:int;
		
		internal function addChildNode(node:BPlusNode):void
		{
			if (node == null)
			{
				return;
			}
			
			if (leafNodes.indexOf(node) == -1)
			{
				leafNodes.push(node);
			}
		}
		
		internal function removeChild(node:BPlusNode):void
		{
			var index:int = leafNodes.indexOf(node);
			
			if (index != -1)
			{
				leafNodes.push(node);
			}
		}
		
		internal function sortChildrenNode():void
		{
			leafNodes.sort(sortFunction);
		}
		
		private function sortFunction(node1:BPlusNode, node2:BPlusNode):int
		{
			if (node1.leftNodeIndex < node2.leftNodeIndex)
			{
				return -1;
			}
			else if (node1.leftNodeIndex == node2.leftNodeIndex)
			{
				return 0;
			}
			else
			{
				return 1;
			}
		}
		
		internal function removeInternalNode(index:uint):void
		{
			//TODO可以二分法优化
			for (var i:int = innerNodes.length - 1; i >= 0; i--)
			{
				if (innerNodes[i].index == index)
				{
					innerNodes.splice(i, 1);
					
					return;
				}
			}
		}
		
		internal function insertInternalNode(index:uint, value:Object):void
		{
			//查找到对应的范围
			var height:int = treeHeight;
			
			//高度等于1的时候等于于没有叶节点
			if (/*height == 1 || */this.isLeaf)
			{
				//只有根节点
				var length:int = innerNodes.length;
				
				//这TODO里可以用二分处理
				for (var i:int = innerNodes.length - 1; i >= 0; i--)
				{
					if (innerNodes[i].index > index)
					{
						continue;
					}
					
					for (var j:int = i; j <= innerNodes.length - 1; j++)
					{
						innerNodes[j + 1] = innerNodes[j];
					}
					
					var newNode:BPlusInnerNode = new BPlusInnerNode(index, value);
					
					innerNodes[i] = newNode;
					
					break;
				}
				
				//检查是否合法，不合法的叶子分裂
				if (innerNodes.length > MAX_NODE_NUM)
				{
					splitNode(this);
				}
			}
			else
			{
				var leftNodeLength:int = this.leafNodes.length;
				
				for (var m:int = leftNodeLength - 1; m >= 0; m--)
				{
					if (index >= this.leafNodes[m].leftNodeIndex)
					{
						this.leafNodes[m].insertInternalNode(index, value);
						
						return;
					}
				}
			}
		}
		
		//叶子节点超出了限制
		private function splitNode(node:BPlusNode):void
		{
			//如果是叶子节点分裂，中间的那个值要放到父节点，且保留在叶节点，否则的话中间的
			//那个值只需要放到父节点
			if (node == null || node.innerNodes.length <= MAX_NODE_NUM)
			{
				return;
			}
			
			var middle:int = node.innerNodes.length/2;
			
			var middleNode:BPlusInnerNode = node.innerNodes[middle];
			
			//10 14 16 20
			var leftNode:BPlusNode = new BPlusNode(degree, getTreeHeightFunc, setRootFunction);
			
			for (var i:int = 0; i < middle; i++)
			{
				leftNode.insertInternalNode(node.innerNodes[i].index, node.innerNodes[i].nodeValue);
			}
			
			var rightNode:BPlusNode = new BPlusNode(degree, getTreeHeightFunc, setRootFunction);
			
			var rightStart:int = node.isLeaf ? middleNode ? middle + 1;//叶子要包含自己
			
			for (i = rightStart; i < node.innerNodes.length; i++)
			{
				rightNode.insertInternalNode(node.innerNodes[i].index, node.innerNodes[i].nodeValue);
			}
			
			var parentNode:BPlusNode = node.parentNode;
			
			//root
			if (parentNode == null)
			{
				parentNode = new BPlusNode(degree, getTreeHeightFunc, setRootFunction);
				
				setRootFunction(parentNode);
			}
			
			//父节点指向这两个节点
			if (parentNode)
			{
				parentNode.removeChild(node);
				
				parentNode.addChildNode(leftNode);
				parentNode.addChildNode(rightNode);
				
				parentNode.sortChildrenNode();
				
				parentNode.insertInternalNode(node.innerNodes[middle].index, node.innerNodes[middle].nodeValue);
			}
			
		}
		
		public function findInternalNode(index:uint):BPlusInnerNode
		{
			if (this.isLeaf)
			{
				for each (var node:BPlusInnerNode in this.innerNodes)
				{
					if (node.index == index)
					{
						return node;
					}
				}
			}
			else
			{
				for (var k:int = this.leafNodes.length - 1; k >= 0; k--)
				{
					if (index >= this.leafNodes[k].leftNodeIndex)
					{
						return this.leafNodes[k].findInternalNode(index);
					}
				}
			}
			
			return null;
		}
		
		private function get treeHeight():int
		{
			if (getTreeHeightFunc != null)
			{
				return getTreeHeightFunc();
			}
			
			throw new Error("getTreeHeightFunc is null");
		}
		
		//是否是叶子节点
		public function get isLeaf():Boolean
		{
			return leafNodes.length == 0;
		}
		
		//获得最边节点的索引值
		private function get leftNodeIndex():int
		{
			if (this.innerNodes.length > 0)
			{
				return this.innerNodes[0].index;
			}
			
			return -1;
		}
		
		public var getTreeHeightFunc:Function;
		
		public var innerNodes:Vector.<BPlusInnerNode>;//内部节点  BPlusInnerNode
		
		public var leafNodes:Vector.<BPlusNode>;//子节点 BPlusNode
		
		private var setRootFunction:Function;
		
		public var nextLinkNode:BPlusNode;
		
		public var parentNode:BPlusNode;
		
	}
}