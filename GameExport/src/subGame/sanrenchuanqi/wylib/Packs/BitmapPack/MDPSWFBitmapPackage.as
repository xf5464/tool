package subGame.sanrenchuanqi.wylib.Packs.BitmapPack
{
	import subGame.sanrenchuanqi.wylib.Packs.BitmapPack.MDPBitmapData;
	import subGame.sanrenchuanqi.wylib.Packs.BitmapPack.MDPBitmapPackage;
	import subGame.sanrenchuanqi.wylib.Packs.BitmapPack.MDPSWFBitmapDirectory;

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
