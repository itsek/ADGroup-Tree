function ADgroup-Tree {
    
    [cmdletbinding()]
    param (
        [parameter(ValueFromPipeline)]
        $Groupname = "",
        $Depth = " "
    )
    
    $Members = Get-ADObject -Identity $Groupname -Properties Member | Select-Object -ExpandProperty Member | Sort-Object -Property @{expr={(Get-ADObject -Identity $_).ObjectClass}; desc=$true}
    $Depth = $Depth.Insert(0,"     ")
    Write-Host "$Depth|    Members of $($Groupname)" -ForegroundColor Green

    Foreach ($Member in $Members) {

        $Object = Get-ADObject -Identity $Member 

        if ($Object.ObjectClass -eq "user") {
            Write-Host "$Depth|--- User $($Object.Name)"
        }

        elseif ($Object.ObjectClass -eq "group") {
            Write-Host "$Depth|--- Group $($Object.Name)" 
            ADgroup-Tree -Groupname $Object.DistinguishedName -Depth $Depth
        }
    }
}
