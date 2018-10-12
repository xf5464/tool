package  subGame.juezhanshachen.animation
{
   import flash.display.BitmapData;
   
   public class ZBitmapData extends BitmapData
   {
       
      
      public function ZBitmapData(param1:int, param2:int, param3:Boolean = true, param4:uint = 4.294967295E9)
      {
         super(param1,param2,param3,param4);
         ObjectRecord.rcd(this);
      }
   }
}
