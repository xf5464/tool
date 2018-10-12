package subGame.chiyue2.games.display.Avatar
{
   import flash.display.BitmapData;
   import flash.utils.Dictionary;
   import games.core.managers.EnterFrameManager;
   import games.core.managers.UrlManager;
   import games.core.services.GameService;
   import subGame.chiyue2.games.globalCons.GOperation;
   import morn.core.components.Image;
   
   public class VtyAvatarShadowManager
   {
      
      private static const PLAYER_RES_LIMIT:int = 5;
      
      private static const FRAME_DRAW_SHADOW:int = 1;
      
      private static const FRAME_RATE:int = 45;
      
      private static const FRAME_RATE_LIMIT:int = 10;
      
      private static const mShadowPointDic:Dictionary = new Dictionary();
      
      private static const mShadowUseDic:Dictionary = new Dictionary();
      
      private static const mImage:Image = new Image();
      
      private static var mBelowFrameRate:int;
      
      public static var mPlayerQuantity:int;
      
      public static var mIsStopCreateShadow:Boolean;
      
      public static var instance:Boolean;
       
      
      public function VtyAvatarShadowManager()
      {
         super();
      }
      
      private static function checkHide(... rest) : void
      {
         if(instance == false)
         {
            instance = true;
            GOperation.event.regist("eventMinFrame",checkHide);
            GOperation.event.regist("assistance_change_" + 28,checkHide);
         }
         if(EnterFrameManager.instance.minFrames < 45)
         {
            mBelowFrameRate = Number(mBelowFrameRate) + 1;
         }
         else
         {
            mBelowFrameRate = 0;
         }
         if(mPlayerQuantity > 5 || mBelowFrameRate > 10 || GameService.hang.isSelect(28))
         {
            mIsStopCreateShadow = true;
         }
         else
         {
            mIsStopCreateShadow = false;
         }
      }
      
      public static function decResUse(param1:String) : void
      {
         if(mShadowUseDic[param1])
         {
            delete mShadowUseDic[param1];
            mPlayerQuantity = Number(mPlayerQuantity) - 1;
         }
         checkHide();
      }
      
      public static function addResUse(param1:String) : void
      {
         if(mShadowUseDic[param1] == null)
         {
            mShadowUseDic[param1] = 1;
            mPlayerQuantity = Number(mPlayerQuantity) + 1;
         }
         checkHide();
      }
      
      public static function getDefaultShadow() : BitmapData
      {
         if(mImage.bitmapData == null)
         {
            mImage.skin = UrlManager.getDefaultShadowUrl();
         }
         return mImage.bitmapData;
      }
      
      public static function getShadow(param1:String, param2:String, param3:int, param4:int) : Array
      {
         if(mShadowPointDic[param1] == null)
         {
            mShadowPointDic[param1] = {};
         }
         var _loc7_:Object = mShadowPointDic[param1];
         if(_loc7_[param2] == null)
         {
            _loc7_[param2] = [];
         }
         var _loc6_:Array = _loc7_[param2];
         if(_loc6_[param3] == null)
         {
            _loc6_[param3] = [];
         }
         var _loc8_:Array = _loc6_[param3];
         if(_loc8_[param4] == null)
         {
            _loc8_[param4] = [];
         }
         var _loc5_:Array = _loc8_[param4];
         return _loc5_;
      }
      
      public static function delMonsterShadow(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:* = null;
         var _loc4_:Object = mShadowPointDic[param1];
         if(_loc4_ == null)
         {
            return;
         }
         var _loc12_:int = 0;
         var _loc11_:* = _loc4_;
         for each(_loc3_ in _loc4_)
         {
            var _loc10_:int = 0;
            var _loc9_:* = _loc3_;
            for each(_loc5_ in _loc3_)
            {
               var _loc8_:int = 0;
               var _loc7_:* = _loc5_;
               for each(_loc6_ in _loc5_)
               {
                  if(_loc6_.length > 0)
                  {
                     _loc2_ = _loc6_[1];
                     _loc2_.dispose();
                  }
                  _loc6_ = [];
               }
            }
         }
         return;
         §§push(delete mShadowPointDic[param1]);
      }
   }
}
