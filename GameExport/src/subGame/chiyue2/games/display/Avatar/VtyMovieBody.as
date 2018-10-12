package subGame.chiyue2.games.display.Avatar
{
   import com.fio.display.FioSpe;
   import flash.display.DisplayObject;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   import games.core.services.GameService;
   import subGame.chiyue2.games.globalCons.GConst;
   
   public class VtyMovieBody extends FioSpe implements IVtyMovieBody
   {
      
      private static var bodyNum:int;
       
      
      public var starlingID:int;
      
      private const MAX_TIME_GAP:int = 700;
      
      private const atConst:int = 900;
      
      private var isRemoved:Boolean = false;
      
      private var body:VtyMovie;
      
      private var shadow:VtyMovie;
      
      private var weapon:VtyMovie;
      
      private var head:VtyMovie;
      
      private var wing:VtyMovie;
      
      private var horse:VtyMovie;
      
      private var shield:VtyMovie;
      
      private var back:VtyMovie;
      
      private var misITObj:Boolean;
      
      private var _isWorking:Boolean;
      
      private var _isPlaying:Boolean;
      
      private var frameID:int;
      
      private var frameNum:int;
      
      private var delayTime:int;
      
      private var lastIndex:int;
      
      private var startTime:int;
      
      private var runTime:int;
      
      private var isLoop:Boolean;
      
      private var averageTime:int;
      
      private var mComFun:Function;
      
      private var _delayFun:Function;
      
      private var movies:Array;
      
      private var stayST:int;
      
      private var _totalTime:int;
      
      private var _sex:int = 0;
      
      private var _smooth:Boolean;
      
      private var _completeFun:Function;
      
      private var isChangeStyle:Boolean;
      
      private var actionTime:int;
      
      private var preAction:String;
      
      private var mPreTime2:int;
      
      public function VtyMovieBody(param1:String, param2:int, param3:int = -1)
      {
         var _loc4_:Boolean = false;
         this.movies = [];
         super();
         enabled = false;
         this._isITObj = false;
         var _loc5_:* = param1;
         if("avatar" !== _loc5_)
         {
            if("npc" !== _loc5_)
            {
            }
            addr33:
            this.body = new VtyMovie(param1,_loc4_,false);
            super.addChild(this.body);
            this.movies[0] = this.body;
            this.body._isInterActiveObj = this._isITObj;
            App.timer.doFrameLoop(1,onRender);
            this.body.addEventListener("event_updateImage",updataImage);
            return;
         }
         _loc4_ = true;
         this._isITObj = _loc4_;
         §§goto(addr33);
      }
      
      public function set _isITObj(param1:Boolean) : void
      {
         misITObj = param1;
      }
      
      public function get _isITObj() : Boolean
      {
         return misITObj;
      }
      
      override public function set x(param1:Number) : void
      {
         .super.x = param1;
      }
      
      override public function set y(param1:Number) : void
      {
         .super.y = param1;
      }
      
      public function setLoadCompleteFun(param1:Function) : void
      {
         _completeFun = param1;
      }
      
      public function set allPlay(param1:Boolean) : void
      {
         App.timer.clearTimer(onRender);
         if(param1)
         {
            App.timer.doFrameLoop(1,onRender);
         }
      }
      
      public function addChildToGPU(param1:*) : void
      {
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         throw new Error("    [ERROR] [VtyMovieBody] 不允许直接注册事件。");
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         return null;
      }
      
      override public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         return null;
      }
      
      public function isWorking() : Boolean
      {
         return this._isWorking;
      }
      
      public function getTopY() : int
      {
         return this.body.getTopY();
      }
      
      public function getFrameID() : int
      {
         return frameID;
      }
      
      public function getDir() : int
      {
         return this.body.getDir();
      }
      
      public function getActionName() : String
      {
         return this.body.getActionName();
      }
      
      public function hasAction(param1:String) : Boolean
      {
         return this.body.hasAction(param1);
      }
      
      public function isITObj() : Boolean
      {
         return this._isITObj;
      }
      
      public function isPiexlHit() : Boolean
      {
         return this.body.isPiexlHit();
      }
      
      public final function getHitArea() : Rectangle
      {
         return this.body.rect;
      }
      
      public final function setSex(param1:int) : void
      {
         this._sex = param1;
      }
      
      public final function getSex() : int
      {
         return this._sex;
      }
      
      private final function creatMovie(param1:String, param2:String, param3:Boolean = false) : VtyMovie
      {
         var _loc4_:VtyMovie = new VtyMovie(param1,false,param3);
         _loc4_.setSex(this._sex);
         _loc4_._isInterActiveObj = false;
         _loc4_.setStyle(param2);
         _loc4_.setActionName(this.body.getActionName());
         _loc4_.setDir(this.body.getDir());
         super.addChild(_loc4_);
         this.movies[this.movies.length] = _loc4_;
         return _loc4_;
      }
      
      public function setShadow(param1:String) : void
      {
         if(null != this.shadow)
         {
            this.shadow.setStyle(param1);
         }
         else
         {
            this.shadow = this.creatMovie("avatar",param1);
            this.shadow._isInterActiveObj = false;
         }
         if(this.shadow && (this.shadow.parent == null || this.shadow.parent && this.shadow.parent.getChildIndex(this.shadow) != 0))
         {
            super.addChildAt(this.shadow,0);
         }
      }
      
      public final function showShadow(param1:Boolean) : void
      {
         if(null != this.shadow)
         {
            this.shadow.visible = param1;
         }
      }
      
      public function setWeapon(param1:String) : void
      {
         if(null != this.weapon)
         {
            if(param1 == "0" || param1 == "1000")
            {
               if(this.weapon.parent)
               {
                  this.weapon.parent.removeChild(this.weapon);
               }
            }
            else
            {
               this.weapon.setStyle(param1);
               super.addChild(this.weapon);
            }
         }
         else if(param1 != "0" && param1 != "1000")
         {
            this.weapon = this.creatMovie("weapon",param1,this._sex == VtyAvatarManager.offSex);
         }
         this.sort();
      }
      
      public function setHead(param1:String) : void
      {
         if(null != this.head)
         {
            if(param1 == "0" || param1 == "1000")
            {
               if(this.head.parent)
               {
                  this.removeChild(this.head);
               }
            }
            else
            {
               this.head.setStyle(param1);
               super.addChild(this.head);
            }
         }
         else if(param1 != "0" && param1 != "1000")
         {
            this.head = this.creatMovie("hair",param1);
         }
         this.sort();
      }
      
      public function setShield(param1:String) : void
      {
         if(null != this.shield)
         {
            if(param1 == "0" || param1 == "1000")
            {
               if(this.shield.parent)
               {
                  this.removeChild(this.shield);
               }
            }
            else
            {
               this.shield.setStyle(param1);
               super.addChild(this.shield);
            }
         }
         else if(param1 != "0" && param1 != "1000")
         {
            this.shield = this.creatMovie("shield",param1);
         }
         this.sort();
      }
      
      public function setWing(param1:String) : void
      {
         if(null != this.wing)
         {
            if(param1 == "0" || param1 == "1000")
            {
               if(this.wing.parent)
               {
                  this.removeChild(this.wing);
               }
            }
            else
            {
               this.wing.setStyle(param1);
               super.addChild(this.wing);
            }
         }
         else
         {
            this.wing = this.creatMovie("wing",param1);
         }
         this.sort();
      }
      
      public function showWing(param1:Boolean) : void
      {
         if(this.wing == null)
         {
            setWing("0");
         }
         this.wing.alpha = !param1?1:0;
      }
      
      public function setHorse(param1:String, param2:int) : void
      {
         if(null != this.horse)
         {
            if(param1 == "0")
            {
               if(this.horse.parent)
               {
                  this.removeChild(this.horse);
               }
               this.horse.setStyle("0");
               horceShow(true);
            }
            else
            {
               horse.speed = param2;
               this.horse.setStyle(param1);
               super.addChild(this.horse);
               horceShow(false);
            }
         }
         else
         {
            if(param1 != "0")
            {
               this.horse = this.creatMovie("horse",param1);
               horceShow(false);
            }
            else
            {
               horceShow(true);
            }
            if(horse)
            {
               horse.speed = param2;
            }
            if(this.horse)
            {
               this.horse._isInterActiveObj = true;
            }
         }
      }
      
      private function horceShow(param1:Boolean) : void
      {
         if(body.visible != param1)
         {
            this.sort();
         }
         this.body.visible = param1;
         if(this.wing)
         {
            this.wing.visible = param1;
         }
         if(this.shield)
         {
            this.shield.visible = param1;
         }
         if(this.weapon)
         {
            this.weapon.visible = param1;
         }
         if(this.head)
         {
            this.head.visible = param1;
         }
         if(this.back)
         {
            this.back.visible = param1;
         }
      }
      
      public function setBack(param1:String) : void
      {
         if(null != this.back)
         {
            if(param1 == "0")
            {
               if(this.back.parent)
               {
                  this.removeChild(this.back);
               }
            }
            else
            {
               this.back.setStyle(param1);
               super.addChild(this.back);
            }
         }
         else
         {
            this.back = this.creatMovie("avatarback",param1);
         }
         this.sort();
      }
      
      public function setStyle(param1:String) : Boolean
      {
         isChangeStyle = true;
         return this.body.setStyle(param1);
      }
      
      public function getStyle() : String
      {
         if(this.body == null)
         {
            return "";
         }
         return this.body._style;
      }
      
      public function play() : void
      {
         this._isPlaying = true;
      }
      
      public function stop() : void
      {
         var _loc1_:* = null;
         this._isPlaying = false;
         var _loc3_:int = 0;
         var _loc2_:* = this.movies;
         for each(_loc1_ in this.movies)
         {
            if(null != _loc1_)
            {
               _loc1_.stop();
            }
         }
      }
      
      public function set loopShow(param1:Boolean) : void
      {
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc3_:* = this.movies;
         for each(_loc2_ in this.movies)
         {
            if(null != _loc2_)
            {
               _loc2_.loopShow = true;
            }
         }
      }
      
      private final function reviseAction(param1:String) : String
      {
         var _loc2_:* = param1;
         if("attack" !== _loc2_)
         {
            if("magic" !== _loc2_)
            {
               if("run" !== _loc2_)
               {
                  if("walk" === _loc2_)
                  {
                     if(false == this.body.hasAction(param1))
                     {
                        return "run";
                     }
                  }
               }
               else if(false == this.body.hasAction(param1))
               {
                  return "walk";
               }
            }
            else if(false == this.body.hasAction(param1))
            {
               return "attack";
            }
         }
         else if(false == this.body.hasAction(param1))
         {
            return "magic";
         }
         return param1;
      }
      
      public function playAction(param1:String, param2:int = -1, param3:Function = null, param4:int = 0, param5:Function = null) : void
      {
         if(GConst.mNewPlayerMap.indexOf(GameService.scene.sceneID) != -1 && param1 == "stuck")
         {
            return;
         }
         if(-1 == param2)
         {
            param2 = this.body.getDir();
         }
         this.setActionName(this.reviseAction(param1));
         this.setDir(param2);
         this.mComFun = param3;
         this._delayFun = param5;
         var _loc6_:int = 0;
         this.runTime = _loc6_;
         this.frameID = _loc6_;
         if(this.body.visible)
         {
            this.frameNum = this.body.frameNum;
            this.averageTime = this.body.averageTime;
         }
         else if(this.horse.frameNum != -1)
         {
            this.frameNum = this.horse.frameNum;
            this.averageTime = this.horse.averageTime;
         }
         else
         {
            this.frameNum = this.body.frameNum;
            this.averageTime = this.body.averageTime;
         }
         this.isLoop = this.body.isLoop();
         this._isWorking = this.body.getActionName() != "idle" && this.body.getActionName() != "stuck";
         this._isPlaying = true;
         this.lastIndex = 0;
         this.regStartTime();
         this.delayTime = param4 > 0?getTimer() + param4:0;
         if(param4 == 0)
         {
            this.playFrame(this.frameID);
         }
      }
      
      public final function gotoAndStop(param1:String, param2:int = -1, param3:int = -1) : void
      {
         this.setActionName(this.reviseAction(param1));
         if(-1 == param2)
         {
            param2 = this.body.getDir();
         }
         this.setDir(param2);
         this.frameNum = this.body.frameNum;
         this._isPlaying = false;
         if(-1 == param3)
         {
            param3 = this.frameNum - 1;
         }
         this.playFrame(param3);
      }
      
      public function setActionName(param1:String) : Boolean
      {
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc3_:* = this.movies;
         for each(_loc2_ in this.movies)
         {
            if(null != _loc2_)
            {
               _loc2_.setActionName(param1);
            }
         }
         if(null != this.shadow)
         {
            if(this.shadow.frameNum == 1)
            {
               this.shadow.setActionName("idle");
            }
         }
         return false;
      }
      
      public function setDir(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc3_:* = this.movies;
         for each(_loc2_ in this.movies)
         {
            if(null != _loc2_)
            {
               if(VtyMovie(_loc2_).frameNum == 1)
               {
                  VtyMovie(_loc2_).setDir(0);
               }
               else
               {
                  _loc2_.setDir(param1);
               }
            }
         }
         if(null != this.shadow)
         {
            if(this.shadow.frameNum == 1)
            {
               this.shadow.setDir(0);
            }
         }
         this.sort();
      }
      
      public function setSmooth(param1:Boolean) : void
      {
         _smooth = param1;
      }
      
      public function playFrame(param1:int) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc2_:String = getActionName();
         this.frameID = param1;
         if(-1 == this.frameID)
         {
            this.frameID = this.frameNum - 1;
         }
         if(this.frameID > this.frameNum)
         {
            this.frameID = this.frameNum - 1;
         }
         if(0 > this.frameID)
         {
            this.frameID = 0;
         }
         var _loc6_:int = 0;
         var _loc5_:* = this.movies;
         for each(_loc3_ in this.movies)
         {
            if(null != _loc3_)
            {
               _loc4_++;
               if(_loc4_ > 0)
               {
                  if(this.movies[0].bitmapData != null)
                  {
                     _loc3_.playFrame(this.frameID);
                  }
                  else
                  {
                     _loc3_.bitmapData == null;
                  }
               }
               else
               {
                  _loc3_.playFrame(this.frameID);
               }
            }
         }
         if(_loc2_ == "attack" && this.body.getDir() == 2)
         {
            if(this.frameID < 3 || this.frameID == this.frameNum - 1)
            {
               if(this.wing && this.wing.parent)
               {
                  setChildIndex(this.wing,0);
               }
            }
            else if(this.wing && this.wing.parent)
            {
               setChildIndex(this.wing,numChildren - 1);
            }
         }
      }
      
      override public function destory() : void
      {
         var _loc2_:* = null;
         if(this.isRemoved)
         {
            return;
         }
         App.timer.clearTimer(onRender);
         this.isRemoved = true;
         var _loc1_:int = numChildren;
         while(true)
         {
            _loc1_--;
            if(_loc1_ <= -1)
            {
               break;
            }
            _loc2_ = removeChildAt(0);
            _loc2_.destory();
            _loc2_ = null;
         }
         this.body = null;
         this.shadow = null;
         this.weapon = null;
         this.head = null;
         if(null != this.movies)
         {
            this.movies.length = 0;
         }
         this.movies = null;
         var _loc3_:* = false;
         this.isLoop = _loc3_;
         _loc3_ = _loc3_;
         this._isPlaying = _loc3_;
         _loc3_ = _loc3_;
         this._isWorking = _loc3_;
         this._isITObj = _loc3_;
         _loc3_ = 0;
         this.stayST = _loc3_;
         _loc3_ = _loc3_;
         this.averageTime = _loc3_;
         _loc3_ = _loc3_;
         this.runTime = _loc3_;
         _loc3_ = _loc3_;
         this.delayTime = _loc3_;
         _loc3_ = _loc3_;
         this.frameNum = _loc3_;
         this.frameID = _loc3_;
         this.lastIndex = 0;
         this.mComFun = null;
         this._delayFun = null;
         super.destory();
      }
      
      private final function isTopDepth(param1:int) : Boolean
      {
         if(param1 > 0 && param1 < 5)
         {
            return true;
         }
         return false;
      }
      
      private final function sort() : void
      {
         var _loc1_:int = 0;
         if("avatar" == this.body.resType)
         {
            _loc1_ = this.body.getDir();
            if(this.isTopDepth(_loc1_))
            {
               this.sortMovie(this.shadow,this.horse,this.shield,this.wing,this.body,this.head,this.back,this.weapon);
            }
            else
            {
               this.sortMovie(this.shadow,this.horse,this.weapon,this.body,this.head,this.back,this.shield,this.wing);
            }
            if(this.wing && this.wing.parent && _loc1_ == 1)
            {
               setChildIndex(this.wing,numChildren - 1);
            }
            if(this.wing && this.wing.parent && _loc1_ == 2)
            {
               setChildIndex(this.wing,numChildren - 1);
            }
            if(this.wing && this.wing.parent && _loc1_ == 5)
            {
               setChildIndex(this.wing,0);
            }
            if(this.shield && this.shield.parent && _loc1_ == 4)
            {
               setChildIndex(this.shield,numChildren - 1);
            }
            if(this.wing && this.wing.parent)
            {
               this.wing.tx = 0;
               switch(int(_loc1_) - 2)
               {
                  case 0:
                     this.wing.tx = 3;
                     break;
                  default:
                     this.wing.tx = 3;
                     break;
                  default:
                     this.wing.tx = 3;
                     break;
                  default:
                     this.wing.tx = 3;
                     break;
                  case 4:
                     this.wing.tx = -3;
               }
            }
         }
      }
      
      private final function sortMovie(... rest) : void
      {
         var _loc5_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:int = rest.length;
         while(_loc4_ < _loc2_)
         {
            _loc5_ = rest.shift();
            if(null != _loc5_ && _loc5_.parent)
            {
               if(_loc3_ != getChildIndex(_loc5_))
               {
                  setChildIndex(_loc5_,_loc3_);
               }
               _loc3_ = _loc3_ + 1;
            }
            _loc4_++;
         }
      }
      
      override public function set filters(param1:Array) : void
      {
         if(GConst.STARLING_AVATER)
         {
            return;
         }
         .super.filters = param1;
      }
      
      private final function onRender() : void
      {
         this.onEnterFrame(0,GConst.GETTIME);
      }
      
      private final function regStartTime() : void
      {
         this.startTime = getTimer();
      }
      
      final function onEnterFrame(param1:int, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(null == parent)
         {
            return;
         }
         if(this.isRemoved)
         {
            return;
         }
         if(false == this._isPlaying && this.body.hasResource())
         {
            if(this.stayST > 0)
            {
               if(param2 - this.stayST >= 900)
               {
                  if(this.body.getActionName() != "dead")
                  {
                     this.playAction("idle");
                  }
                  this.stayST = 0;
               }
            }
            else if(this.body.hasResource() && this.body.frameID != 0 && this.body.getActionName() != "dead")
            {
               this.body.playFrame(0);
            }
            if(this.body.getActionName() == "dead")
            {
               if(this.getFrameID() != this.frameNum)
               {
                  this.playFrame(this.frameNum);
               }
            }
            return;
         }
         if(this.delayTime > 0)
         {
            if(param2 - this.delayTime >= -4)
            {
               this.delayTime = 0;
               if(null != this._delayFun)
               {
                  this._delayFun(this);
                  this._delayFun = null;
               }
               this.regStartTime();
               this.playFrame(0);
            }
            else
            {
               return;
            }
         }
         var _loc3_:* = (param2 - this.startTime) / this.averageTime >> 0;
         if(_loc3_ < 0)
         {
            _loc3_ = 0;
         }
         if(_loc3_ == this.lastIndex)
         {
            return;
         }
         this.lastIndex = _loc3_;
         if(param1 > 700)
         {
            this.frameID = 0;
         }
         else if(_loc3_ > this.frameNum && false == this.isLoop)
         {
            this.frameID = 0;
         }
         else
         {
            _loc3_ = int(_loc3_ % this.frameNum);
            this.frameID = _loc3_;
         }
         if(0 == this.frameID)
         {
            this._isWorking = false;
            if(false == this.isLoop)
            {
               this._isPlaying = false;
               if(null != this.body)
               {
                  if("avatar" == this.body.resType)
                  {
                     _loc4_ = this.body.getActionName();
                     var _loc6_:* = _loc4_;
                     if("attack" !== _loc6_)
                     {
                        if("magic" !== _loc6_)
                        {
                           if("walk" !== _loc6_)
                           {
                              if("run" !== _loc6_)
                              {
                                 if("stuck" !== _loc6_)
                                 {
                                    this.stayST = 0;
                                 }
                                 else
                                 {
                                    this.playAction("idle");
                                 }
                              }
                           }
                           this.stayST = param2 - 900 * 0.94;
                        }
                     }
                     this.playFrame(0);
                     this.stayST = param2;
                  }
               }
            }
            if(null != this.mComFun)
            {
               _loc5_ = this.mComFun;
               this.mComFun = null;
               _loc5_.apply(null,[this]);
            }
            if(false == this.isLoop)
            {
               if(this.body.getActionName() == "dead")
               {
                  this.playFrame(this.frameNum);
               }
               return;
            }
         }
         this.playFrame(this.frameID);
      }
      
      public function updataImage(... rest) : void
      {
         if(this.body && (this.frameNum != this.body.frameNum || this.averageTime != this.body.averageTime))
         {
            this.frameNum = this.body.frameNum;
            this.averageTime = this.body.averageTime;
         }
         if(_completeFun is Function)
         {
            _completeFun.apply();
         }
      }
      
      public function recycleResource() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         this.y = _loc2_;
         this.x = _loc2_;
         var _loc4_:int = 0;
         var _loc3_:* = this.movies;
         for each(_loc1_ in this.movies)
         {
            if(null != _loc1_)
            {
               _loc1_.recycleResource();
            }
         }
      }
   }
}
