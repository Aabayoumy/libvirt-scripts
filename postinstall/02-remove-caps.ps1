Get-WindowsCapability -Online |
Where-Object -FilterScript {
  ($_.Name -split '~')[0] -in @(
    'Browser.InternetExplorer';
    'MathRecognizer';
    'Microsoft.Windows.Notepad';
    'OpenSSH.Client';
    'Microsoft.Windows.MSPaint';
    'Microsoft.Windows.PowerShell.ISE';
    'App.Support.QuickAssist';
    'App.StepsRecorder';
    'Media.WindowsMediaPlayer';
    'Microsoft.Windows.WordPad';
  );
} | Remove-WindowsCapability -Online *&gt;&amp;1 &gt;&gt; "$env:TEMP\remove-caps.log";