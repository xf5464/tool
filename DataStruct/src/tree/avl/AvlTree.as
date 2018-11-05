package tree.avl
{
	

	public class AvlTree
	{
		public function AvlTree($nodeClass:Class)
		{
			nodeClass = $nodeClass;
		}
		
		public function insertNode(value:Object):BinaryNode
		{
			var targetNode:BinaryNode = findNode(value);	
			
			if (targetNode == null)
			{
				var newNode:BinaryNode = createNewNode(value);
				
				if (root == null)
				{
					root = newNode;
				}
				else
				{
					root.insertNode(newNode);
				}
				
				root.resetHeight()
				root.height;
				
				//查看两边高度差
//				reBalance(newNode);
				
				targetNode = newNode;
			}
			
			return targetNode;
		}
		
		public function reBalance(newNode:BinaryNode):void
		{
			//从插入的那个节点
			var unBalanceNode:BinaryNode = newNode.parent;
			
			if (unBalanceNode == null)
			{
				return;
			}
			
			var heightDiff:int;
			
			while(unBalanceNode != null)
			{
				heightDiff = unBalanceNode.getNodeHeightDiff();
				
				if (Math.abs(heightDiff) <= 1)
				{
					unBalanceNode = unBalanceNode.parent;
					
					continue;
				}
				
				var isRoot:Boolean = unBalanceNode.isRoot;
				
				//左左
				var isLL:Boolean = unBalanceNode.getNodeHeightDiff() < -1 && unBalanceNode.leftNode.compare(newNode.nodeValue) > 0;

				var isLR:Boolean = unBalanceNode.getNodeHeightDiff() < -1 && unBalanceNode.leftNode.compare(newNode.nodeValue) < 0;
				
				var isRR:Boolean = unBalanceNode.getNodeHeightDiff() > 1 && unBalanceNode.rightNode.compare(newNode.nodeValue) < 0;
				
				var isRL:Boolean = unBalanceNode.getNodeHeightDiff() > 1 && unBalanceNode.rightNode.compare(newNode.nodeValue) > 0;
				
				var leftNode:BinaryNode = unBalanceNode.leftNode;
				
				var rightNode:BinaryNode = unBalanceNode.rightNode;
				
				var parentNode:BinaryNode = unBalanceNode.parent;
				
				
				if (isLR)
				{
					//转成LL			
					/**		
					 * 							12                     
											 8		15
										 5		9               
									 			  10  
									
									 			12
											 9		15
										 8		10               
									 5			  
												  
					 * **/
					
					//将8作为根的
					turnRR(unBalanceNode.leftNode);
					
					isLL = true;
					
				}
				
				if (isRL)
				{
					/**		
					 * 							12                     
											 8		16
										 		  14    20           
												   	  17		
					 
												 12
											 9		16
										 		10     17           
									 			  		  20
					 
					 * **/
					
					
					turnLL(unBalanceNode.rightNode);
					
					isRR = true;
				}
				
				if (isLL)
				{
				/**							10
										8		15
									7		9
								6
								 * **/
					//不平衡的节点10的左节点8，父节点P   操作，8的右节点9作为10的左节点，8的右节点指向10，P指向A
					turnLL(unBalanceNode);
			
					return;
				}
				
				if (isRR)
				{
					/**			10
					 		8		 15
					 			   12  16
					                     19
					 						
					 * * **/
					//10不是平衡点，10的新右节点指向 10的原右节点15的左节点12，15的左节点指向10
					turnRR(unBalanceNode);
					
					return;
				}
			}
		}
		
		private function turnLL($root:BinaryNode):void
		{
			var leftNode:BinaryNode = $root.leftNode;
			
			var rightNode:BinaryNode = $root.rightNode;
			
			var parentNode:BinaryNode = $root.parent;
			
			leftNode.parent = parentNode;
			
			if (parentNode)
			{
				if ($root.isLeftChild)
				{
					parentNode.leftNode = leftNode;
				}
				else
				{
					parentNode.rightNode = leftNode;
				}
			}
			else
			{
				root = leftNode;
			}
			
			$root.leftNode = leftNode.rightNode;
			
			leftNode.rightNode = $root;
			
			$root.parent = leftNode;
			
			if ($root.leftNode)
			{
				$root.leftNode.parent = $root;
			}
		}
		
		private function turnRR($root:BinaryNode):void
		{
			var leftNode:BinaryNode = $root.leftNode;
			
			var rightNode:BinaryNode = $root.rightNode;
			
			var parentNode:BinaryNode = $root.parent;
			
			rightNode.parent = parentNode;
			
			if (parentNode)
			{
				if ($root.isLeftChild)
				{
					parentNode.leftNode = rightNode;
				}
				else
				{
					parentNode.rightNode = rightNode;
				}
				
			}
			else
			{
				root = rightNode;
			}
			
			$root.rightNode = rightNode.leftNode;
			
			rightNode.leftNode = $root;
			
			$root.parent = rightNode;
			
			if ($root.rightNode)
			{
				$root.rightNode.parent = $root;
			}
		}
		
		private var nodeClass:Class;
		
		protected function createNewNode(value:Object):BinaryNode
		{
			var newNode:BinaryNode = new nodeClass();
			
			newNode.nodeValue = value;
			
			return newNode;
		}
		
		public function findNode(value:Object):BinaryNode
		{
			if (root == null)
			{
				return null;
			}
			
			return root.findValue(value);
		}
		
		public function deleteNode(node:AvlTree):void
		{
			
		}
		
		public function print():void
		{
			if (root == null)
			{
				return;
			}
			
			var queue:Array = [];
			
			queue.push(root);
			
			var total:String = "";
			
			var nowSpace:int;
			
			while(queue.length > 0)
			{
				var length:int = queue.length;
				
				var nowLine:String = "";
				
				nowSpace = 0;
				
				for (var i:int = 0; i < length; i++)
				{
					var next:Object =  queue.shift();
//					var node:BinaryNode = queue.shift();
					
					var node:BinaryNode = next as BinaryNode;
					
					var ret:String = "";
					
					if (node != null)
					{
						if (node.leftNode)
						{
							queue.push(node.leftNode);
						}
						
						if (node.rightNode)
						{
							queue.push(node.rightNode);
						}
						
						var nowNodeValue:int = int(node.nodeValue);
						
						var nowWeishu:int = this.getNumWeishu(nowNodeValue + "" + (node.parent ? "(" + node.parent.nodeValue + ")" : ""));
						
						if (node.parent == null)
						{
							node.printPreSpaceCount = node.height*4;
						}
			
						var padding:int = node.parent == null ? 4 : 3;
						
						if (node.leftNode)
						{
							var leftWeishu:int = this.getNumWeishu(int(node.leftNode.nodeValue) + "" + ("(" + node.nodeValue + ")"));
							
							node.leftNode.printPreSpaceCount = node.printPreSpaceCount - padding - (nowWeishu/2  - leftWeishu/2);
						}
						
						if (node.rightNode)
						{
							var rightWeishu:int = this.getNumWeishu(int(node.rightNode.nodeValue) + "" + ("(" + node.nodeValue + ")"));
							
							node.rightNode.printPreSpaceCount = node.printPreSpaceCount + padding - (nowWeishu/2  - leftWeishu/2);
						}
						
						var needSpace:int = node.printPreSpaceCount - nowSpace;
						
						nowLine += getSpace(needSpace) + node.nodeValue + (node.parent ? "(" + node.parent.nodeValue + ")" : "");
						
						nowSpace += needSpace + nowWeishu;
					}
						
				}
				
				total += nowLine + "\n";
			}
			
			trace(total);
		}
		
		private function getNumWeishu(value:Object):int
		{
			return value.toString().length;
		}
		
		private function getSpace(count:int):String
		{
			var ret:String = "";
			
			for (var i:int = 0; i < count; i++)
			{
				ret += " ";
			}
			
			return ret;
		}
		
		protected var root:BinaryNode;
	}
	

}