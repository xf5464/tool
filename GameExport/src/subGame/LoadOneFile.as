package subGame
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;

	public class LoadOneFile
	{
		
		private var url:String;
		
		private var callback:Function;
		
		private var relativePath:String;
		
		private var outputFolder:String;
		
		public function LoadOneFile()
		{
		}
		
		private var urlLoader:URLLoader;
		
		private var urlRequest:URLRequest;
		
		public function load($url:String, $relativePath:String, $outputFolder:String, $callback:Function):void
		{
			
			url = $url;
			
			callback = $callback;
			
			relativePath = $relativePath;
			
			outputFolder = $outputFolder;
				
			if (url.indexOf(".") == -1)
			{
				if (this.callback != null)
				{
					this.callback();
				}
				
				return;
			}
			
			if (urlLoader == null)	
			{
				urlLoader = new URLLoader();
				urlLoader.addEventListener(Event.COMPLETE, onLoadComplete);
				urlLoader.addEventListener(IOErrorEvent.IO_ERROR, onIoError);
			}
			
			if (url.indexOf(".xml") != -1 || url.indexOf(".txt") != -1)
			{
				urlLoader.dataFormat = URLLoaderDataFormat.TEXT;
				
				isBinary = false;
			}
			else
			{
				urlLoader.dataFormat = URLLoaderDataFormat.BINARY;
				
				isBinary = true
			}
			
			if (urlRequest == null)
			{
				urlRequest = new URLRequest(url);
			}
			else
			{
				urlRequest.url = url;
			}
			
			trace("采集" + url);
			
			try
			{
				urlLoader.load(urlRequest);
			}
			catch(e:Error)
			{
				if (this.callback != null)
				{
					this.callback();
				}
				
				trace("error:" + e.toString());
			}
		}
		
		protected function onIoError(event:IOErrorEvent):void
		{
			trace("onIoError：" + event.toString())
			
			if (this.callback != null)
			{
				this.callback();
			}
			
		}
		
		private var isBinary:Boolean = false;
		
		protected function onLoadComplete(event:Event):void
		{
			var file:File;
			
			var fs:FileStream;
			
			if (!isBinary)
			{
				file = new File(this.outputFolder + relativePath);
				
				if (!file.isDirectory)
				{
					fs = new FileStream();
					fs.open(file, FileMode.WRITE);
					fs.writeUTFBytes(event.target.data);
					fs.close();
				}
			}
			else
			{
				file = new File(this.outputFolder + relativePath);
				
				if (!file.isDirectory)
				{
					fs = new FileStream();
					fs.open(file, FileMode.WRITE);
					fs.writeBytes(event.target.data);
					fs.close();
				}
			}
			
			if (this.callback != null)
			{
				this.callback();
			}
		}
		
	}
}