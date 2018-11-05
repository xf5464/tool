package tree.avl
{
	public class BinaryNode
	{
		public var nodeValue:Object;
		
		public var parent:BinaryNode;
		
		public var leftNode:BinaryNode;
		
		public var rightNode:BinaryNode;
		
		public function get isRoot():Boolean
		{
			return this.parent == null;
		}
		
		public function get isLeftChild():Boolean
		{
			return this.parent != null && this.parent.leftNode == this;
		}
		
		public function get isRightChild():Boolean
		{
			return this.parent != null && this.parent.rightNode == this;
		}
		
		/**
		 * 
		 * @param value
		 * @return 当前值大于比较值value，返回1，小于value返回-1，一样大返回0
		 * 
		 */		
		public function compare(value:Object):int
		{
			return -1;
		}
		
		public function findValue(value:Object):BinaryNode
		{
			var ret:int = compare(value);
			
			if (ret == 0)
			{
				return this;
			}
			
			if (ret > 0 && leftNode != null)
			{
				return leftNode.findValue(value);
			}
			
			if (ret < 0 && rightNode != null)
			{
				return rightNode.findValue(value);
			}
			
			return null;
		}
		
		public function insertNode(newNode:BinaryNode):void
		{
			if (newNode == null)
			{
				return;
			}
			
			var compareValue:int = this.compare(newNode.nodeValue);
			
			if (compareValue > 0)
			{
				if (this.leftNode == null)
				{
					this.leftNode = newNode;
					
					newNode.parent = this;
				}
				else
				{
					this.leftNode.insertNode(newNode);
				}
			}
			else if (compareValue < 0)
			{
				if (this.rightNode == null)
				{
					this.rightNode = newNode;
					
					newNode.parent = this;
				}
				else
				{
					this.rightNode.insertNode(newNode);
				}
			}
				
		}
		
		private var _height:int;//强制更新一遍
		
		//插入一次调用
		public function resetHeight():void
		{
			_height = 0;
			
			if (leftNode)
			{
				leftNode.resetHeight();
			}
			
			if (rightNode)
			{
				rightNode.resetHeight();
			}
		}
		
		public function get height():int
		{
			if (_height != 0)
			{
				return _height;
			}
			
			var leftNodeHeight:int = 0;
			
			if (this.leftNode != null)
			{
				leftNodeHeight = this.leftNode.height;
			}
			
			var rightNodeHeight:int = 0;
			
			if (this.rightNode != null)
			{
				rightNodeHeight = this.rightNode.height;
			}
			
			if (this.leftNode == null && this.rightNode == null)
			{
				return 1;
			}
			else
			{
				return Math.max(leftNodeHeight, rightNodeHeight) + 1;
			}
			
		}
		
		/**
		 * 
		 * @return 右边高度减去左边高度
		 * 
		 */		
		public function getNodeHeightDiff():int
		{
			var leftHeight:int = this.leftNode ? this.leftNode.height : 0;
			
			var rightHeight:int = this.rightNode ? this.rightNode.height : 0;
			
			return rightHeight - leftHeight;
		}
		
		public var printPreSpaceCount:int;
		
	}
}