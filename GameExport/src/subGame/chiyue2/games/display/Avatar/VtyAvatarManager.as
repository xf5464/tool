package subGame.chiyue2.games.display.Avatar
{
   
   
   public class VtyAvatarManager
   {
      
      public static var isPixelCheck:Boolean = true;
      
      public static var offsetConfig:XML;
      
      public static var offSex:int = 1;
      
      public static const RESOURCE_NAME_HORSE:String = "horse";
      
      public static const RESOURCE_NAME_HAIR:String = "hair";
      
      public static const RESOURCE_NAME_CLOTHUI:String = "avatarui";
      
      public static const RESOURCE_NAME_WEAPONUI:String = "weaponui";
      
      public static const RESOURCE_NAME_SHENWUUI:String = "shenwuui";
      
      public static const RESOURCE_NAME_HUANMOUI:String = "huanmoui";
      
      public static const RESOURCE_NAME_HAIRUI:String = "hairui";
      
      public static const RESOURCE_NAME_PRECIOUS:String = "precious";
      
      public static const RESOURCE_NAME_PRECIOUSUI:String = "preciousUI";
      
      public static const RESOURCE_NAME_WINDUI:String = "wingui";
      
      public static const RESOURCE_NAME_SHIELDUI:String = "shieldui";
      
      public static const RESOURCE_NAME_FOOTUI:String = "haloui";
      
      public static const RESOURCE_NAME_ITEM_EFFECT:String = "itemseffect";
      
      public static const RESOURCE_NAME_WEAPON:String = "weapon";
      
      public static const RESOURCE_NAME_AVATAR:String = "avatar";
      
      public static const RESOURCE_NAME_NPC:String = "npc";
      
      public static const RESOURCE_NAME_SKILL:String = "skill";
      
      public static const RESOURCE_NAME_EFFECT:String = "effect";
      
      public static const RESOURCE_NAME_WING:String = "wing";
      
      public static const RESOURCE_NAME_AVATARBACK:String = "avatarback";
      
      public static const RESOURCE_NAME_SHIELD:String = "shield";
      
      public static const ACTION_IDLE:String = "idle";
      
      public static const ACTION_WALK:String = "walk";
      
      public static const ACTION_RUN:String = "run";
      
      public static const ACTION_ATTACK:String = "attack";
      
      public static const ACTION_MAGIC:String = "magic";
      
      public static const ACTION_STUCK:String = "stuck";
      
      public static const ACTION_DEAD:String = "dead";
      
      public static const ACTION_REVIVE:String = "revive";
      
      public static const RESOURCE_NAME_HORSE_ID:String = "1";
      
      public static const RESOURCE_NAME_HAIR_ID:String = "2";
      
      public static const RESOURCE_NAME_CLOTHUI_ID:String = "3";
      
      public static const RESOURCE_NAME_WEAPONUI_ID:String = "4";
      
      public static const RESOURCE_NAME_SHENWUUI_ID:String = "5";
      
      public static const RESOURCE_NAME_HUANMOUI_ID:String = "6";
      
      public static const RESOURCE_NAME_HAIRUI_ID:String = "7";
      
      public static const RESOURCE_NAME_PRECIOUS_ID:String = "8";
      
      public static const RESOURCE_NAME_PRECIOUSUI_ID:String = "9";
      
      public static const RESOURCE_NAME_FOOTUI_ID:String = "10";
      
      public static const RESOURCE_NAME_WEAPON_ID:String = "11";
      
      public static const RESOURCE_NAME_AVATAR_ID:String = "12";
      
      public static const RESOURCE_NAME_NPC_ID:String = "13";
      
      public static const RESOURCE_NAME_SKILL_ID:String = "14";
      
      public static const RESOURCE_NAME_EFFECT_ID:String = "15";
      
      public static const RESOURCE_NAME_WING_ID:String = "16";
      
      public static const RESOURCE_NAME_AVATARBACK_ID:String = "17";
      
      public static const ACTION_IDLE_ID:String = "1";
      
      public static const ACTION_WALK_ID:String = "2";
      
      public static const ACTION_RUN_ID:String = "3";
      
      public static const ACTION_ATTACK_ID:String = "4";
      
      public static const ACTION_MAGIC_ID:String = "5";
      
      public static const ACTION_STUCK_ID:String = "6";
      
      public static const ACTION_DEAD_ID:String = "7";
      
      public static const ACTION_REVIVE_ID:String = "8";
       
      
      public function VtyAvatarManager()
      {
         super();
      }
      
      public static function setRootUrl(param1:String, param2:String) : void
      {
         loadRes();
      }
      
      private static function loadRes() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < 4)
         {
            _loc2_ = 0;
            while(_loc2_ < 8)
            {
               resMgr.loadResourceByteArray("avatar",String(_loc1_ + 1),"idle",_loc2_);
               resMgr.loadResourceByteArray("avatar",String(_loc1_ + 1),"run",_loc2_);
               if(_loc1_ < 2)
               {
                  resMgr.loadResourceByteArray("hair",String((_loc1_ + 1) * 11),"idle",_loc2_);
                  resMgr.loadResourceByteArray("hair",String((_loc1_ + 1) * 11),"run",_loc2_);
               }
               _loc2_++;
            }
            _loc1_++;
         }
      }
      
      public static function setVersion(param1:String) : void
      {
         resMgr.version = null != param1?param1:"";
      }
      
      public static function setConfig(param1:Object) : void
      {
         resMgr.setConfig(param1 as Array);
         initDefault();
         loopCache();
      }
      
      public static function initDefault() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         resMgr.initDefault("0");
         resMgr.initDefault("1");
         resMgr.initDefault("2");
         resMgr.initDefaultResource(WebParamInfo.getInfo().assetsUrl + "body.png");
         resMgr.initDefaultShadowResource(WebParamInfo.getInfo().assetsUrl + "shadow.png");
         App.loader.load(UrlManager.getDefaultShadowUrl(),1);
         _loc1_ = 0;
         while(_loc1_ < 4)
         {
            _loc2_ = 0;
            while(_loc2_ < 8)
            {
               resMgr.loadResourceByteArray("avatar",String(_loc1_ + 1),"idle",_loc2_);
               resMgr.loadResourceByteArray("avatar",String(_loc1_ + 1),"run",_loc2_);
               if(_loc1_ < 2)
               {
                  resMgr.loadResourceByteArray("hair",String((_loc1_ + 1) * 11),"idle",_loc2_);
                  resMgr.loadResourceByteArray("hair",String((_loc1_ + 1) * 11),"run",_loc2_);
               }
               _loc2_++;
            }
            _loc1_++;
         }
         App.timer.doOnce(15000,nextActionLoad);
      }
      
      private static function nextActionLoad() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < 4)
         {
            _loc2_ = 0;
            while(_loc2_ < 8)
            {
               resMgr.loadResourceByteArray("avatar",String(_loc1_ + 1),"attack",_loc2_);
               resMgr.loadResourceByteArray("avatar",String(_loc1_ + 1),"dead",_loc2_);
               resMgr.loadResourceByteArray("avatar",String(_loc1_ + 1),"magic",_loc2_);
               resMgr.loadResourceByteArray("avatar",String(_loc1_ + 1),"walk",_loc2_);
               if(_loc1_ < 2)
               {
                  resMgr.loadResourceByteArray("hair",String((_loc1_ + 1) * 11),"walk",_loc2_);
                  resMgr.loadResourceByteArray("hair",String((_loc1_ + 1) * 11),"attack",_loc2_);
                  resMgr.loadResourceByteArray("hair",String((_loc1_ + 1) * 11),"magic",_loc2_);
                  resMgr.loadResourceByteArray("hair",String((_loc1_ + 1) * 11),"dead",_loc2_);
               }
               _loc2_++;
            }
            _loc1_++;
         }
      }
      
      public static function showRes() : void
      {
         resMgr.showRes();
      }
      
      public static function initStyle(param1:String, param2:String) : void
      {
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < 8)
         {
            resMgr.loadResourceByteArray(param2,param1,"idle",_loc3_);
            resMgr.loadResourceByteArray(param2,param1,"run",_loc3_);
            _loc3_++;
         }
      }
      
      public static function setBaseRes(param1:String, param2:Object) : void
      {
         resMgr.restoreDone(param2,param1);
      }
      
      public static function loopCache() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < 8)
         {
            resMgr.setLoopCache("skill",String(_loc1_ + 2080));
            _loc1_++;
         }
         resMgr.setLoopCache("effect","102");
      }
      
      public static function clearCache() : void
      {
         resMgr.clearBitmapData(true);
         resMgr.finishingMemory();
      }
   }
}
