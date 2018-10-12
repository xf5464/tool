package subGame.juezhanshachen
{
   import flash.utils.Dictionary;
   
   public class GlobalConsts
   {
      
      public static const ENUM_NAME_WORD_MLJ:String = "mlj";
      
      public static const ENUM_NAME_WORD_CJZS:String = "cjzs";
      
      public static const ENUM_NAME_WORD_MLJQ:String = "mljq";
      
      public static const ENUM_NAME_WORD_XXDL:String = "xxdl";
      
      public static const ENUM_NAME_MLJ:String = "热血沙城";
      
      public static const ENUM_NAME_CJZS:String = "裁决战史";
      
      public static const ENUM_NAME_MLJQ:String = "魔龙崛起";
      
      public static const ENUM_NAME_XXDL:String = "血腥大陆";
      
      public static const MAX_EFFECT_ATTACKSPEED_RUN:int = 10;
      
      public static const MAX_EFFECT_ATTACKSPEED:int = 10;
      
      public static var PLAYER_ATT_BASE_PER:Number = 0.8;
      
      public static const BASE_MAX_DISTANCE:int = 500;
      
      public static var DELAY_BIND_TIME:int = 1000;
      
      public static const MAX_FIND_NUM:int = 2000;
      
      public static var RANDOMFEMALES:Vector.<int> = Vector.<int>([100001,100002,100005,10304201,10306201,10308201,20304201,20306201,20308201,30304201,30306201,30308201,40301201,40302201]);
      
      public static var RANDOMMALES:Vector.<int> = Vector.<int>([100001,100003,10004,10304101,10306101,10308101,20304101,20306101,20308101,30304101,30306101,30308101,40301101,40302101]);
      
      public static var RANDOMWEPS:Vector.<int> = Vector.<int>([40101001,40101002,40101003,40102001,40102002,undefined,20103001,20104001,20105001,20106001,20107001,20108001,20109001,10103001,10104001,10105001,10106001,10107001,10108001,10109001,30103001,30104001,30105001,30106001,30107001,30108001,30109001,40109001,40109002,40109003,40109004]);
      
      public static var ACTION_KEYS_MAP:Dictionary = createActionKeysMap();
      
      public static const ZOOM_NUM:Number = 1;
      
      public static const VIEW_WIDTH:int = 1920;
      
      public static const VIEW_HEIGHT:int = 1080;
      
      public static const VIEWOBJ_WIDTH:int = 1920;
      
      public static const VIEWOBJ_HEIGHT:int = 1080;
      
      public static const VIEW_LEFT_OFFSET:int = 0;
      
      public static const VIEW_TOP_OFFSET:int = 0;
      
      public static const GRID_WIDTH:int = 54;
      
      public static const GRID_HEIGHT:int = 36;
      
      public static const CHUNK_WIDTH:int = 512;
      
      public static const CHUNK_HEIGHT:int = 512;
      
      public static const AREA_SIZEX:int = 70;
      
      public static const AREA_SIZEY:int = 43;
      
      public static const ZONE_WIDTH:int = GRID_WIDTH * AREA_SIZEX * ZOOM_NUM;
      
      public static const ZONE_HEIGHT:int = GRID_HEIGHT * AREA_SIZEY * ZOOM_NUM;
      
      public static const BASE_ATT_SPEED:int = 800;
      
      public static const BASE_SPEED:int = 1;
      
      public static const EQUIP_MAX:int = 13;
      
      public static const MIN_JUMP_TIME:int = 500;
      
      public static const MAX_ACCOUNT:uint = 140;
      
      public static const MAX_PASSWORD:uint = 140;
      
      public static const MAX_ACCAPASS:uint = MAX_ACCOUNT + MAX_PASSWORD;
      
      public static const PINGMARGIN:uint = 15000;
      
      public static const PING:uint = 1735289200;
      
      public static const PONG:uint = 1735290736;
      
      public static const TICK:uint = 1801677172;
      
      public static const EA_STAND:int = 0;
      
      public static const EA_RUN:int = 2;
      
      public static const EA_WALK:int = 3;
      
      public static const EA_STANDBY:int = 4;
      
      public static const EA_CREATE:int = 5;
      
      public static const EA_DIG:int = 6;
      
      public static const EA_GATHER:int = 7;
      
      public static const EA_WOUND:int = 9;
      
      public static const EA_DEAD:int = 10;
      
      public static const EA_PROGRESS:int = 13;
      
      public static const EA_WINK_MOVE:int = 14;
      
      public static const EA_BEAT_FLAT:int = 15;
      
      public static const EA_AC_NIL:int = 17;
      
      public static const EA_RIDE:int = 18;
      
      public static const EA_ATTACK:int = 19;
      
      public static const EA_ATTACK2:int = 20;
      
      public static const EA_ATTACK3:int = 21;
      
      public static const EA_COLLIDE:int = 23;
      
      public static const EA_BACKOUT:int = 24;
      
      public static const EA_FREEDOM:int = 25;
      
      public static const EA_AC_MAX:int = 26;
      
      public static const BIND_ACTION_LAYER_HELMET:Vector.<int> = Vector.<int>([30,30,30,30,30,30,30,30]);
      
      public static const BIND_ACTION_LAYER_WEP:Vector.<int> = Vector.<int>([-6,10,80,40,40,40,80,10]);
      
      public static const BIND_ACTION_LAYER_WEPEFF:Vector.<int> = Vector.<int>([-1,20,90,50,50,50,90,20]);
      
      public static const BIND_ACTION_LAYER_SWING:Vector.<int> = Vector.<int>([50,50,50,-50,-50,-50,50,50]);
      
      public static const BIND_ACTION_LAYER_SWINGEFF:Vector.<int> = Vector.<int>([70,70,70,-40,-40,-40,70,70]);
      
      public static const BIND_ACTION_LAYER_HORSE_TOP:Vector.<int> = Vector.<int>([-10,-10,10,10,10,10,10,-10]);
      
      public static const BIND_ACTION_LAYER_HORSE_BOTTOM:Vector.<int> = Vector.<int>([-30,-30,0,0,0,0,0,-30]);
      
      public static const MODEL_BIND_ACTION_LAYER_HELMET:Vector.<int> = Vector.<int>([30,30,30,30,30,30,30,30]);
      
      public static const MODEL_BIND_ACTION_LAYER_WEP:Vector.<int> = Vector.<int>([40,10,80,40,40,40,80,10]);
      
      public static const MODEL_BIND_ACTION_LAYER_WEPEFF:Vector.<int> = Vector.<int>([50,20,90,50,50,50,90,20]);
      
      public static const MODEL_BIND_ACTION_LAYER_SWING:Vector.<int> = Vector.<int>([-50,50,50,-50,-50,-50,50,50]);
      
      public static const MODEL_BIND_ACTION_LAYER_SWINGEFF:Vector.<int> = Vector.<int>([-40,70,70,-40,-40,-40,70,70]);
      
      public static const MODEL_BIND_ACTION_LAYER_HORSE_TOP:Vector.<int> = Vector.<int>([10,-10,10,10,10,10,10,-10]);
      
      public static const MODEL_BIND_ACTION_LAYER_HORSE_BOTTOM:Vector.<int> = Vector.<int>([0,-30,0,0,0,0,0,-30]);
       
      
      public function GlobalConsts()
      {
         super();
      }
      
      private static function createActionKeysMap() : Dictionary
      {
         var _loc1_:Dictionary = new Dictionary();
         _loc1_[EA_STAND] = "stand";
         _loc1_[EA_RUN] = "run";
         _loc1_[EA_WALK] = "walk";
         _loc1_[EA_DEAD] = "death";
         _loc1_[EA_ATTACK] = "attack";
         _loc1_[EA_ATTACK2] = "casting";
         _loc1_[EA_ATTACK3] = "attack2";
         _loc1_[EA_WOUND] = "injured";
         _loc1_[EA_STANDBY] = "standby";
         _loc1_[EA_COLLIDE] = "collide";
         _loc1_[EA_CREATE] = "create";
         _loc1_[EA_DIG] = "excavate";
         _loc1_[EA_GATHER] = "dig";
         _loc1_[EA_FREEDOM] = "freedom";
         return _loc1_;
      }
	  
	  public static var actionCopyMap:Dictionary = createActionCopyMap();
      
      public static function createActionCopyMap() : Dictionary
      {
         var _loc1_:Dictionary = new Dictionary();
         _loc1_["res/animation/player/female"] = [ACTION_KEYS_MAP[EA_STAND],ACTION_KEYS_MAP[EA_FREEDOM]];
         _loc1_["res/animation/player/male"] = [ACTION_KEYS_MAP[EA_STAND],ACTION_KEYS_MAP[EA_FREEDOM]];
         _loc1_["res/animation/player/female/ride"] = [ACTION_KEYS_MAP[EA_STAND],ACTION_KEYS_MAP[EA_FREEDOM]];
         _loc1_["res/animation/player/male/ride"] = [ACTION_KEYS_MAP[EA_STAND],ACTION_KEYS_MAP[EA_FREEDOM]];
         _loc1_["res/animation/weapon/female"] = [ACTION_KEYS_MAP[EA_STAND],ACTION_KEYS_MAP[EA_FREEDOM]];
         _loc1_["res/animation/weapon/male"] = [ACTION_KEYS_MAP[EA_STAND],ACTION_KEYS_MAP[EA_FREEDOM]];
         _loc1_["res/animation/weapon/female/ride"] = [ACTION_KEYS_MAP[EA_STAND],ACTION_KEYS_MAP[EA_FREEDOM]];
         _loc1_["res/animation/weapon/male/ride"] = [ACTION_KEYS_MAP[EA_STAND],ACTION_KEYS_MAP[EA_FREEDOM]];
         _loc1_["res/animation/head/female"] = [ACTION_KEYS_MAP[EA_STAND],ACTION_KEYS_MAP[EA_FREEDOM]];
         _loc1_["res/animation/head/male"] = [ACTION_KEYS_MAP[EA_STAND],ACTION_KEYS_MAP[EA_FREEDOM]];
         _loc1_["res/animation/head/female/ride"] = [ACTION_KEYS_MAP[EA_STAND],ACTION_KEYS_MAP[EA_FREEDOM]];
         _loc1_["res/animation/head/male/ride"] = [ACTION_KEYS_MAP[EA_STAND],ACTION_KEYS_MAP[EA_FREEDOM]];
         _loc1_["res/animation/wing"] = [ACTION_KEYS_MAP[EA_STAND],ACTION_KEYS_MAP[EA_FREEDOM]];
         _loc1_["res/animation/wing/ride"] = [ACTION_KEYS_MAP[EA_STAND],ACTION_KEYS_MAP[EA_FREEDOM]];
         _loc1_["res/animation/mount"] = [ACTION_KEYS_MAP[EA_STAND],ACTION_KEYS_MAP[EA_FREEDOM]];
         _loc1_["res/animation/monster/6023.qmr"] = [ACTION_KEYS_MAP[EA_RUN],ACTION_KEYS_MAP[EA_WALK]];
         _loc1_["res/animation/monster/6026.qmr"] = [ACTION_KEYS_MAP[EA_RUN],ACTION_KEYS_MAP[EA_WALK]];
         _loc1_["res/animation/monster/1024.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         _loc1_["res/animation/monster/1000.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         _loc1_["res/animation/monster/3046.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         _loc1_["res/animation/monster/3007.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         _loc1_["res/animation/monster/6002.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         _loc1_["res/animation/monster/2020.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         _loc1_["res/animation/monster/6022.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         _loc1_["res/animation/monster/1053.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         _loc1_["res/animation/monster/3002.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         _loc1_["res/animation/monster/1063.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         _loc1_["res/animation/monster/7441.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         _loc1_["res/animation/monster/7430.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         _loc1_["res/animation/monster/2012.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         _loc1_["res/animation/monster/6201.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         _loc1_["res/animation/monster/6202.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         _loc1_["res/animation/monster/6203.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         _loc1_["res/animation/monster/6204.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         _loc1_["res/animation/monster/6205.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         _loc1_["res/animation/monster/6206.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         _loc1_["res/animation/monster/6207.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         _loc1_["res/animation/monster/6208.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         _loc1_["res/animation/monster/6209.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         _loc1_["res/animation/monster/6210.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         _loc1_["res/animation/monster/6211.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         _loc1_["res/animation/monster/6212.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         _loc1_["res/animation/monster/6213.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         _loc1_["res/animation/monster/6214.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         _loc1_["res/animation/monster/6215.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         _loc1_["res/animation/monster/6216.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         _loc1_["res/animation/monster/6217.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         _loc1_["res/animation/monster/6218.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         _loc1_["res/animation/monster/6219.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         _loc1_["res/animation/monster/6220.qmr"] = [ACTION_KEYS_MAP[EA_WALK],ACTION_KEYS_MAP[EA_RUN]];
         return _loc1_;
      }
   }
}
