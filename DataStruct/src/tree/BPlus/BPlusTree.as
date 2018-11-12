package tree.BPlus
{
	
	public class BPlusTree
	{
		/**
		 * 
		 * @param $nodeNum X阶树
		 * 关键：在底层分配页的时候，分配成硬盘一页的大小
		 * 
		 * https://www.cs.usfca.edu/~galles/visualization/BPlusTree.html
		 * 
		 * http://www.cburch.com/cs/340/reading/btree/index.html
		 * 
		 */		
		public function BPlusTree($degree:int)
		{
			degree = $degree;
			
			MIN_NODE_NUM = degree/2;
			MAX_NODE_NUM = degree - 1;
		}
		
		public function insertNode(index:uint, value:Object):void
		{
			var lastNode:BPlusInnerNode = findNode(index);
			
			if (lastNode == null)
			{
				if (root == null)
				{
					root = new BPlusNode(degree, getTreeHeightFunc, setRoot);
					root.insertInternalNode(index, value);
				}
				else
				{
					root.insertInternalNode(index, value);
				}
			}
		}
		
		private function getTreeHeightFunc():int
		{
			return 0;
		}
		
		public function findNode(index:uint):BPlusInnerNode
		{
			if (root)
			{
				return root.findInternalNode(index);
			}
			
			return null;
		}
		
		public function deleteNode(index:int):void
		{
			var node:BPlusInnerNode = this.findNode(index);
			
			if (node)
			{
				var ownNode:BPlusNode = node.ownNode;
				
				doDeleteToOwnNode(ownNode, index);
		}
		
		private function doDeleteToOwnNode(ownNode:BPlusNode, index:int):void
		{
			ownNode.removeInternalNode(index);
			
			//如果是根节点直接移除
			if (ownNode == root)
			{
				//					ownNode.removeInternalNode(index);
			}
			else
			{
				//情况1，找到后移除叶节点仍然有合法数量的节点
				var ownInternalNodeLength:int = ownNode.innerNodes.length;
				
				var temp:BPlusNode = ownNode.parentNode;
				
				if (ownInternalNodeLength >= MIN_NODE_NUM && ownInternalNodeLength <= MAX_NODE_NUM)
				{
					//往上	
					
					var hasFound:Boolean = false;
					
					while(temp != null)
					{
						if (temp.findInternalNode(index) != null)
						{
							hasFound = true;
							
							break;
						}
						
						temp = temp.parentNode;
					}
					
					if (hasFound)
					{
						//对找到号的也这么处理
						doDeleteToOwnNode(temp, index);
					}
					
				}
				else if (ownInternalNodeLength < MIN_NODE_NUM)
				{
					//节点少于目标数量
					//先看兄弟节点有没有多的可以拿过来，能的话拿过来，否则就和兄弟节点合并
					var parent:BPlusNode = ownNode.parentNode;
					
					if (parent)
					{
						var subChildrenNodes:Array = parent.leafNodes;
						
						if (subChildrenNodes)
						{
							//找到旁边的两个，看哪一个是有多余的
							var index:int = subChildrenNodes.indexOf(ownNode);
							
							var leftChildNode:BPlusNode = null;
							
							var rightChildNode:BPlusNode = null;
							
							if (index - 1 >= 0)
							{
								leftChildNode = parent.leafNodes[index - 1];
							}
				
							if (index + 1 <= parent.leafNodes.length - 1)
							{
								rightChildNode = parent.leafNodes[index + 1];
							}
							
							if (leftChildNode != null)
							{
								var leftInternalNodeCount:int = leftChildNode.innerNodes.length;
								
								if (leftInternalNodeCount >= MIN_NODE_NUM + 1)
								{
									//左边节点最大的移到这个节点
									var maxInLeft:BPlusInnerNode = leftChildNode.innerNodes[leftChildNode.innerNodes.length - 1];
									
									leftChildNode.removeInternalNode(maxInLeft.index);
									
									ownNode.insertInternalNode(maxInLeft.index, maxInLeft.nodeValue);
									
									//修改父节点的
								}
							}
							else if (rightChildNode != null)
							{
								var rightInternalNodeCount:int = rightChildNode.innerNodes.length;
								
								if (rightInternalNodeCount >= MIN_NODE_NUM + 1)
								{
									//右边最小的节点
									var maxInRight:BPlusInnerNode = rightChildNode.innerNodes[0];
									
									rightChildNode.removeInternalNode(maxInRight.index);
									
									ownNode.insertInternalNode(maxInRight.index, maxInRight.nodeValue);
								}
							}
						}
					}
					else
					{
						
					}
				}
				
			}
		}
		}
		
		private function isLegal(node:BPlusNode):Boolean
		{
	
		}
		
		private var MIN_NODE_NUM:int;
		
		private var MAX_NODE_NUM:int;

		private function setRoot(node:BPlusNode):void
		{
			root = node;
		}
		
		public function print():void
		{
			
		}
		
		
		private var root:BPlusNode;
		
		private var degree:int;
	}
}