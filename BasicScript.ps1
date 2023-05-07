$domainObj = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
$PDC = ($domainObj.PdcRoleOwner).Name
$SearchString = "LDAP://"
$SearchString += $PDC + "/"
$DistinguishedName = "DC=$($domainObj.Name.Replace('.', ',DC='))"
$SearchString += $DistinguishedName

#==========================================================================================================================================
#
#$SearchString
#
#==========================================================================================================================================
#DirectorySearcher class with the LDAP provider path + SearchRoot, which is the node in the Active Directory hierarchy where searches start.
#The search root takes the form of an object instantiated from the DirectoryEntry class. 
#When no arguments are passed to the constructor, the SearchRoot will indicate that every search should return results from the entire Active Directory. 
#
#$Searcher = New-Object System.DirectoryServices.DirectorySearcher([ADSI]$SearchString)
#$objDomain = New-Object System.DirectoryServices.DirectoryEntry($SearchString,"corp.com\offsec", "lab")
#$Searcher.SearchRoot = $objDomain
#
#==========================================================================================================================================
#filter  samAccountType attribute;  0x30000000 (decimal 805306368) filter property to enumerate all users in the domain
#https://learn.microsoft.com/en-us/windows/win32/adschema/a-samaccounttype?redirectedfrom=MSDN
#
#$Searcher = New-Object System.DirectoryServices.DirectorySearcher([ADSI]$SearchString)
#$objDomain = New-Object System.DirectoryServices.DirectoryEntry
#$Searcher.SearchRoot = $objDomain
#$Searcher.filter="samAccountType=805306368"
#$Searcher.FindAll()
#
#==========================================================================================================================================
#
#Loop so each returned object prints each property attribute on its own line
#
#$Searcher = New-Object System.DirectoryServices.DirectorySearcher([ADSI]$SearchString)
#$objDomain = New-Object System.DirectoryServices.DirectoryEntry
#$Searcher.SearchRoot = $objDomain
#$Searcher.filter="samAccountType=805306368"
#$Result = $Searcher.FindAll()
#Foreach($obj in $Result)
#{
#Foreach($prop in $obj.Properties)
#{
#$prop
#}
#Write-Host "------------------------"
#}
#
==========================================================================================================================================

$Searcher.filter="name=Jeff_Admin"
