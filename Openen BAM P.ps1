##################################################################################################################
#################### Script geschreven door Neal Peters                    #######################################
#################### BAM Omgeving openen    test                                #######################################
#################### Publicatie datum 8 Juli 2016                          #######################################
##################################################################################################################

 $response = read-host "Weet je zeker dat je de omgeving wilt dicht zetten? (Y/N)"
        if ( $response -ne "Y" ) { exit }

    $CitrixServer = 'NS-DD001'
    $session = New-PSSession -ComputerName $CitrixServer

        Enter-PSSession -Session $session
        Invoke-Command -Session $session -Scriptblock {

Import-Module Citrix*
Add-PSSnapin Citrix*

# Onderstaande variabelen zijn geimplementeerd in het script:

$desktopgroupname = "BAM_Productie"
$desktopgroupname2 = "BAM_Productie_w2k8" 
$adminfoldername1 = "BAM Productie\" 
$adminfoldername2 = "BAM Productie w2k8\" 

#### HIERONDER NIETS AANPASSEN ####

# Openen applicaties

$apps = Get-BrokerApplication -AdminFolderName "$adminfoldername1" 
$apps += Get-BrokerApplication -AdminFolderName "$adminfoldername2" 
foreach($app in $apps)
{
Set-BrokerApplication $app -Enabled $True
}

Write-Host "Alle $desktopgroupname Applicaties zijn ENABLED, druk op een toets om door te gaan"

					          Write-Host "End of Script"
                    $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}
Exit-PSSession