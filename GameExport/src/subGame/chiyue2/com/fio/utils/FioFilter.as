package subGame.chiyue2.com.fio.utils
{
   import flash.display.DisplayObject;
   import flash.geom.ColorTransform;
   
   public class FioFilter
   {
       
      
      public function FioFilter()
      {
         super();
      }
      
      public static function setColor(param1:Object, param2:uint = 0) : void
      {
         var colorTransform:ColorTransform = null;
         var obj:Object = param1;
         var newColor:uint = param2;
         if(null == obj)
         {
            return;
         }
         if(obj is DisplayObject)
         {
            colorTransform = obj.transform.colorTransform;
            with(_loc4_)
            {
               
               redMultiplier = greenMultiplier = blueMultiplier = 1;
               if(newColor < 1)
               {
                  alphaMultiplier = 1;
                  redOffset = greenOffset = blueOffset = alphaOffset = 0;
               }
               else
               {
                  redOffset = newColor >> 16;
                  greenOffset = newColor >> 8 & 255;
                  blueOffset = newColor & 255;
               }
            }
            obj.transform.colorTransform = colorTransform;
         }
      }
      
      public static function toLight(param1:Object, param2:Number = 0.3) : void
      {
         var colorTransform:ColorTransform = null;
         var obj:Object = param1;
         var rate:Number = param2;
         if(null == obj)
         {
            return;
         }
         if(obj is DisplayObject)
         {
            if(rate < 0)
            {
               rate = 0;
            }
            if(rate > 1)
            {
               rate = 1;
            }
            colorTransform = obj.transform.colorTransform;
            with(colorTransform)
            {
               
               alphaOffset = -rate * 100;
            }
            obj.transform.colorTransform = colorTransform;
         }
      }
      
      private static function toGray(param1:Object) : void
      {
         var colorTransform:ColorTransform = null;
         var obj:Object = param1;
         if(null == obj)
         {
            return;
         }
         if(obj is DisplayObject)
         {
            colorTransform = obj.transform.colorTransform;
            with(colorTransform)
            {
               
               redMultiplier = 0.3;
               greenMultiplier = 0.4;
               blueMultiplier = 0.3;
               redOffset = 40;
               greenOffset = 30;
               blueOffset = 30;
            }
            obj.transform.colorTransform = colorTransform;
         }
      }
   }
}
