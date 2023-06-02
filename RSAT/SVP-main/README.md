To be able to list all the cmdlets in the module, import the module as well. Remember to import the DLL first.

PS C:\> Import-Module C:\ADModule\Microsoft.ActiveDirectory.Management.dll -Verbose

PS C:\> Import-Module C:\AD\Tools\ADModule\ActiveDirectory\ActiveDirectory.psd1

PS C:\> Get-Command -Module ActiveDirectory


https://github.com/samratashok/ADModule
