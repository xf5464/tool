package subGame.zanlongchuanqi.wylib.Packs.BitmapPack
{
   public class MDPSWFBitmapPackage extends MDPBitmapPackage
   {
       
      
      public function MDPSWFBitmapPackage(param1:Class = null, param2:Class = null)
      {
         if(!param1)
         {
            param1 = MDPBitmapData;
         }
         if(!param2)
         {
            param2 = MDPSWFBitmapDirectory;
         }
         super(param1,param2);
      }
   }
}
