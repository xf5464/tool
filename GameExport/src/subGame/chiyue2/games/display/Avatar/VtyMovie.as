package subGame.chiyue2.games.display.Avatar
{
   import flash.display.Bitmap;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import subGame.chiyue2.games.globalCons.GConst;
   
   public final class VtyMovie extends Bitmap implements IVtyMovie
   {
      
      public static const EVENT_UPDATE_IMAGE:String = "event_updateImage";
      
      private static const mDirClickPoints:Array = [new Rectangle(-46,-120,90,140),new Rectangle(-66,-117,90,140),new Rectangle(-64,-118,90,140),new Rectangle(-64,-120,90,140),new Rectangle(-42,-124,90,140),new Rectangle(-26,-124,90,140),new Rectangle(-17,-120,80,140),new Rectangle(-17,-120,90,140)];
       
      
      var resType:String;
      
      var _isInterActiveObj:Boolean;
      
      var rect:Rectangle;
      
      var hitRext:Rectangle;
      
      var frameID:int;
      
      var frameNum:int;
      
      var delay:int;
      
      var averageTime:int = 9999;
      
      var _style:String;
      
      private var mgr:_ResMgr;
      
      private var _topy:int;
      
      private var _dir:int;
      
      private var _actionName:String;
      
      private var _isLoop:Boolean;
      
      private var _actions:Object;
      
      private var _dirFrames:Object;
      
      private var _frames:Array;
      
      private var _sex:int = 0;
      
      private var _needDef:Boolean;
      
      private var _isWeaponOffset:Boolean;
      
      private var _preLink:String;
      
      private var ___tp:Point;
      
      private var _link:String;
      
      private var _smooth:Boolean;
      
      private var _hasResource:Boolean;
      
      public var tx:int;
      
      public var loopShow:Boolean;
      
      public var speed:int = -1;
      
      private var preSkillTimes:int;
      
      private var mIsMeUpdate:Boolean;
      
      public function VtyMovie(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super();
         if(!GConst.STARLING_AVATER)
         {
         }
         this.resType = param1;
         this._needDef = param2;
         this._isWeaponOffset = param3;
         this.mgr = VtyAvatarManager.resMgr;
         this.___tp = new Point();
         this._isWeaponOffset = false;
      }
      
      public final function getTopY() : int
      {
         if(Math.abs(this._topy) <= 1)
         {
            this._topy = -180;
         }
         return this._topy;
      }
      
      public final function getDir() : int
      {
         return this._dir;
      }
      
      public final function getActionName() : String
      {
         return this._actionName;
      }
      
      public final function hasAction(param1:String) : Boolean
      {
         if(null != this._actions)
         {
            return this._actions.hasOwnProperty(param1);
         }
         return false;
      }
      
      public final function isLoop() : Boolean
      {
         return this._isLoop;
      }
      
      public final function isITObj() : Boolean
      {
         return this._isInterActiveObj;
      }
      
      public final function setSex(param1:int) : void
      {
         this._sex = param1;
      }
      
      final function isInArea(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : Boolean
      {
         if(param1 >= param3)
         {
            if(param1 <= param5)
            {
               if(param2 >= param4)
               {
                  if(param2 <= param6)
                  {
                     return true;
                  }
               }
            }
         }
         return false;
      }
      
      public final function isPiexlHit() : Boolean
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         if(parent == null)
         {
            return false;
         }
         _loc1_ = parent.mouseX;
         _loc2_ = parent.mouseY;
         if(false == this._isInterActiveObj)
         {
            return false;
         }
         if(this.resType == "avatar" && int(this._style) >= 35000 && int(this._style) <= 35999)
         {
            if(null != bitmapData)
            {
               return bitmapData.rect.contains(mouseX,mouseY);
            }
         }
         hitRext = mDirClickPoints[getDir()];
         return hitRext.contains(_loc1_,_loc2_);
      }
      
      public final function setStyle(param1:String) : Boolean
      {
         _hasResource = false;
         this.recycleResource();
         if(null == param1 || 0 == param1.length)
         {
            return false;
         }
         this._style = param1;
         var _loc2_:VtyAvatarDataInfo = this.mgr.getActionData(this.resType,this._style,this._needDef);
         if(null == _loc2_ || null == _loc2_.actions)
         {
            return false;
         }
         this._actions = _loc2_.actions;
         this.rect = _loc2_.getRect();
         this._topy = _loc2_.topy;
         this.hitRext = _loc2_.hitRect;
         if(this.hitRext == null)
         {
            this.hitRext = new Rectangle(-36,-120,72,120);
         }
         _loc2_ = null;
         if(this._dir > -1)
         {
            return this.setActionName(this._actionName);
         }
         return true;
      }
      
      public final function setActionName2(param1:String) : Boolean
      {
         this.delNotify();
         this._actionName = param1;
         this._preLink = this.resType + "_" + this._style + "_" + this._actionName + "_" + this._dir;
         var _loc2_:String = this.resType + "_" + this._style + "_" + "first";
         bitmapData = null;
         this._dirFrames = null;
         this._frames = null;
         if(null == this._actions)
         {
            return false;
         }
         var _loc3_:VtyAvatarActionInfo = this._actions[param1];
         if(null == _loc3_)
         {
            return false;
         }
         if(null == _loc3_.frames)
         {
            return false;
         }
         if(false == this.mgr.CheckToBmpDone(this._preLink))
         {
            if(this._needDef)
            {
               _loc3_ = this.mgr.getDefAction(this.resType,this._style,this._actionName);
            }
            this.mgr.loadResourceByteArray(this.resType,this._style,this._actionName,this._dir);
            this.mgr.regist(this._preLink,this.updateImage);
         }
         if(this.mgr.CheckToBmpDone(this._preLink) || this.mgr.CheckToBmpDone(_loc2_))
         {
            this._actions = this.mgr.getActionData(this.resType,this._style,this._needDef,false).actions;
            if(this._actions)
            {
               _loc3_ = this._actions[this._actionName];
            }
         }
         this._dirFrames = _loc3_.frames;
         this._isLoop = _loc3_.isLoop;
         this.delay = _loc3_.delay;
         this.frameNum = _loc3_.frameNum;
         if(true && _loc3_.useTime == 560)
         {
            _loc3_.useTime = 450;
         }
         if(speed > 0 && _actionName != "idle")
         {
            _loc3_.useTime = speed;
         }
         this.averageTime = Math.round(_loc3_.useTime / this.frameNum);
         _loc3_ = null;
         if(this._dir > -1)
         {
            this._frames = this._dirFrames[this._dir];
         }
         if(this.frameID > 0)
         {
            this.playFrame(this.frameID);
         }
         return true;
      }
      
      public final function setActionName(param1:String) : Boolean
      {
         return setActionName2(param1);
      }
      
      public final function setDir(param1:int) : void
      {
         param1 = param1 % 8;
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._dir = param1;
         if(null != this._dirFrames)
         {
            this._frames = this._dirFrames[this._dir];
         }
         checkResources();
      }
      
      public final function checkResources() : void
      {
         if(_actionName == null)
         {
            return;
         }
         _link = this.resType + "_" + this._style + "_" + this._actionName + "_" + _dir;
         if(false == this.mgr.hasRes(this._link))
         {
            this.mgr.loadResourceByteArray(this.resType,this._style,this._actionName,this._dir);
         }
      }
      
      public final function playFrame(param1:int) : void
      {
         var _loc3_:Boolean = false;
         var _loc2_:* = null;
         if(GConst.AUTOROBOT)
         {
            return;
         }
         this.frameID = param1;
         if(param1 >= this.frameNum)
         {
            this.frameID = this.frameNum - 1;
         }
         if(0 > this.frameID)
         {
            this.frameID = 0;
         }
         if(null == parent)
         {
            return;
         }
         if(null == this._frames)
         {
            return;
         }
         var _loc4_:VtyAvatarFrameInfo = this._frames[this.frameID];
         if(null == _loc4_)
         {
            return;
         }
         if(null == _loc4_.bitmapData)
         {
            _loc3_ = true;
            _loc2_ = this.mgr.getDefaultAvatarFrameInfo(this.resType,this._style,getActionName(),_loc4_.dir,_loc4_.i);
            if(_loc2_ && this._style != "3" && this._style != "4")
            {
               _loc4_.bitmapData = _loc2_.bitmapData;
            }
         }
         scaleX = _loc4_.scaleX;
         if(this._isWeaponOffset)
         {
            this.___tp.copyFrom(this.mgr.getOffP(this._actionName,this.frameID + this._dir * this.frameNum));
            x = _loc4_.x + this.___tp.x;
            y = _loc4_.y + this.___tp.y;
         }
         else if(_loc3_ && _loc2_)
         {
            this.x = _loc2_.x;
            this.y = _loc2_.y;
         }
         else
         {
            this.x = _loc4_.x + tx;
            this.y = _loc4_.y;
         }
         this.bitmapData = _loc4_.bitmapData;
         if(_loc3_)
         {
            _loc4_.bitmapData = null;
         }
         _hasResource = !_loc3_;
      }
      
      public function stop() : void
      {
         this.bitmapData = null;
      }
      
      override public function set smoothing(param1:Boolean) : void
      {
         .super.smoothing = param1;
      }
      
      public function setSmooth(param1:Boolean) : void
      {
         this._smooth = param1;
      }
      
      public final function destory() : void
      {
         this.clear();
         this._dir = -1;
         this.___tp = null;
         this.mgr = null;
         this._actionName = "";
      }
      
      public function recycleResource() : void
      {
         bitmapData = null;
         if(null != this._style && this._style.length > 0)
         {
            this.mgr.delLoadResource(this.resType,this._style,this._actionName);
         }
         this._style = "";
         this._actions = null;
         this._dirFrames = null;
         this._frames = null;
         this.delNotify();
         this.rect = null;
         this.averageTime = 999999;
         var _loc1_:* = -1;
         this._topy = _loc1_;
         _loc1_ = _loc1_;
         this.frameNum = _loc1_;
         this.frameID = _loc1_;
      }
      
      private final function clear() : void
      {
         recycleResource();
      }
      
      private final function updateImage() : void
      {
         mIsMeUpdate = true;
         this.delNotify();
         this.setActionName(this._actionName);
         this.dispatchEvent(new Event("event_updateImage"));
      }
      
      public final function hasResource() : Boolean
      {
         return _hasResource;
      }
      
      private final function delNotify() : void
      {
         var _loc1_:String = this._link;
         if(null != _loc1_ && this.mgr != null)
         {
            this.mgr.nofity.removeEventListener(_loc1_,this.updateImage);
         }
         _loc1_ = null;
      }
      
      public function get style() : String
      {
         return _style;
      }
   }
}
