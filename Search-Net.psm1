
function Search-Net{

[CmdletBinding()]
	Param(
		[Parameter(Mandatory=$True,Position=0)]
		[String]$SearchFor,
		
		[Parameter(Mandatory=$False,Position=1)]
		[String]$Use
	)

	$ErrorActionPreference = "SilentlyContinue"
	If ($Error) {$Error.Clear()}
	$SearchFor = $SearchFor.Trim()
	If (!($SearchFor)) {
		Write-Host
		Write-Host "Text That You Wish To Search For Has Not Been Entered." -ForeGroundColor "Yellow"
		Write-Host "Execution of the Script Has been Ternimated." -ForeGroundColor "Yellow"
		Write-Host
		Exit
	}
	$Use = $Use.Trim()
	$SearchFor = $SearchFor -Replace "\s+", " "
	$SearchFor = $SearchFor -Replace " ", "+"

	Switch ($Use) {
		"Google" {
			# -- "Use Google To Search"
			$Query = "https://www.google.com/search?q=$SearchFor"
		}
		"Bing" {
			# -- "Use Bing Search Engine To Search"
			$Query = "http://www.bing.com/search?q=$SearchFor"
		}
		"YouTube" {
			# -- "Use Bing Search Engine To Search"
			$Query = "http://www.youtube.com/search?q=$SearchFor"
		}
		Default {$Query = "https://www.merriam-webster.com/dictionary/$SearchFor"}
	}
	If ($Query -NE "No Search Engine Specified") {
		## -- Detect the Default Web Browser
		Start $Query
	}
	Else {
		Write-Host
		Write-Host $Query -ForeGroundColor "Yellow"
		Write-Host "Execution of the Script Has been Ternimated." -ForeGroundColor "Yellow"
		Write-Host
	}
	
}
	