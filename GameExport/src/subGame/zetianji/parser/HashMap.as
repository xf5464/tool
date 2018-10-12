package subGame.zetianji.parser
{
   import flash.utils.Dictionary;
   
   public class HashMap
   {
       
      
      private var length:int;
      
      private var content:Dictionary;
      
      private var boUseArray:Boolean = false;
      
      private var m_cArray:Array;
      
      public function HashMap(param1:Boolean = false)
      {
         super();
         length = 0;
         content = new Dictionary(param1);
      }
      
      public function getContent() : Dictionary
      {
         return content;
      }
      
      public function size() : int
      {
         return length;
      }
      
      public function set UseArray(param1:Boolean) : void
      {
         boUseArray = param1;
         if(boUseArray)
         {
            m_cArray = [];
         }
      }
      
      public function isEmpty() : Boolean
      {
         return length == 0;
      }
      
      public function keys() : Array
      {
         var _loc2_:Array = new Array(length);
         var _loc1_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = content;
         for(_loc2_[_loc1_] in content)
         {
            _loc1_++;
         }
         return _loc2_;
      }
      
      public function sortkeys() : Array
      {
         var _loc2_:Array = [];
         var _loc1_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = content;
         for(var _loc3_ in content)
         {
            _loc2_[_loc2_.length] = {
               "id":parseInt(_loc3_),
               "value":get(_loc3_)
            };
         }
         _loc2_.sortOn("id",16);
         return _loc2_;
      }
      
      public function eachKey(param1:Function) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = content;
         for(var _loc2_ in content)
         {
            param1(_loc2_);
         }
      }
      
      public function eachKeyAndValue(param1:Function, param2:*) : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = content;
         for(var _loc3_ in content)
         {
            param1(_loc3_,param2);
         }
      }
      
      public function eachValue(param1:Function) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = content;
         for each(var _loc2_ in content)
         {
            param1(_loc2_);
         }
      }
      
      public function values() : Array
      {
         var _loc2_:Array = new Array(length);
         var _loc1_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = content;
         for each(var _loc3_ in content)
         {
            _loc2_[_loc1_] = _loc3_;
            _loc1_++;
         }
         return _loc2_;
      }
      
      public function containsValue(param1:*) : Boolean
      {
         var _loc4_:int = 0;
         var _loc3_:* = content;
         for each(var _loc2_ in content)
         {
            if(_loc2_ === param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function containsKey(param1:*) : Boolean
      {
         if(content[param1] != undefined)
         {
            return true;
         }
         return false;
      }
      
      public function get(param1:*) : *
      {
         var _loc2_:* = content[param1];
         if(_loc2_ !== undefined)
         {
            return _loc2_;
         }
         return null;
      }
      
      public function getMe(param1:*) : *
      {
         var _loc2_:* = content[param1];
         if(_loc2_ !== undefined)
         {
            return _loc2_;
         }
         return undefined;
      }
      
      public function getValue(param1:*) : *
      {
         return get(param1);
      }
      
      public function put(param1:*, param2:*) : *
      {
         var _loc4_:Boolean = false;
         var _loc3_:* = undefined;
         if(param1 == null)
         {
            throw new ArgumentError("不能定义空key!");
         }
         if(param2 == null)
         {
            return remove(param1);
         }
         _loc4_ = containsKey(param1);
         if(!_loc4_)
         {
            length = Number(length) + 1;
            if(boUseArray)
            {
               m_cArray[m_cArray.length] = param1;
            }
         }
         _loc3_ = this.get(param1);
         content[param1] = null;
         content[param1] = param2;
         return _loc3_;
      }
      
      public function remove(param1:*) : *
      {
         var _loc4_:int = 0;
         var _loc3_:Boolean = containsKey(param1);
         if(!_loc3_)
         {
            return null;
         }
         var _loc2_:* = content[param1];
         delete content[param1];
         length = Number(length) - 1;
         if(boUseArray)
         {
            _loc4_ = 0;
            while(_loc4_ < m_cArray.length)
            {
               if(m_cArray[_loc4_] == param1)
               {
                  m_cArray.splice(_loc4_,1);
                  break;
               }
               _loc4_++;
            }
         }
         return _loc2_;
      }
      
      public function clear() : void
      {
         var _loc1_:* = null;
         if(length)
         {
            _loc1_ = keys();
            var _loc4_:int = 0;
            var _loc3_:* = _loc1_;
            for each(var _loc2_ in _loc1_)
            {
               content[_loc2_] = null;
               delete content[_loc2_];
            }
            _loc1_.length = 0;
            _loc1_ = null;
         }
         length = 0;
         if(m_cArray)
         {
            m_cArray.length = 0;
         }
      }
      
      public function clone() : HashMap
      {
         var _loc1_:HashMap = new HashMap();
         var _loc4_:int = 0;
         var _loc3_:* = content;
         for(var _loc2_ in content)
         {
            _loc1_.put(_loc2_,content[_loc2_]);
         }
         return _loc1_;
      }
      
      public function cloneExist(param1:HashMap) : void
      {
         param1.clear();
         var _loc4_:int = 0;
         var _loc3_:* = content;
         for(var _loc2_ in content)
         {
            param1.put(_loc2_,content[_loc2_]);
         }
      }
      
      public function toString() : String
      {
         var _loc4_:int = 0;
         var _loc1_:Array = keys();
         var _loc3_:Array = values();
         var _loc2_:String = "HashMap Content:\n";
         _loc4_ = 0;
         while(_loc4_ < _loc1_.length)
         {
            _loc2_ = _loc2_ + (_loc1_[_loc4_] + " -> " + _loc3_[_loc4_] + "\n");
            _loc4_++;
         }
         return _loc2_;
      }
      
      public function getvalues() : Array
      {
         return m_cArray;
      }
   }
}
