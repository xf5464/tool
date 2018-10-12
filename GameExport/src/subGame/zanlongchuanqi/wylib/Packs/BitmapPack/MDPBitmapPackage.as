package subGame.zanlongchuanqi.wylib.Packs.BitmapPack
{
   import subGame.zanlongchuanqi.wylib.Packs.MDPackage;
   
   public class MDPBitmapPackage extends MDPackage
   {
       
      
      public function MDPBitmapPackage(param1:Class = null, param2:Class = null)
      {
         if(!param1)
         {
            param1 = MDPBitmapData;
         }
         if(!param2)
         {
            param2 = MDPBitmapDirectory;
         }
         super(param1,param2);
      }
   }
}
