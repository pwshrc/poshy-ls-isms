#!/usr/bin/env pwsh
$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest


function Get-ChildItemColorfully {
    Get-ChildItem @args `
    | Sort-Object { @((-not $_.PSIsContainer), $_.Name) } `
    | Format-Table
}
Export-ModuleMember -Function Get-ChildItemColorfully

function Get-ChildItemColorfullyCramped {
    Get-ChildItem @args `
    | Sort-Object { @((-not $_.PSIsContainer), $_.Name) } `
    | Format-Wide
}
Export-ModuleMember -Function Get-ChildItemColorfullyCramped

function Get-ChildItemColorfullyRevealingly {
    Get-ChildItem @args -Hidden `
    | Sort-Object { @((-not $_.PSIsContainer), $_.Name) } `
    | Format-Table
}
Export-ModuleMember -Function Get-ChildItemColorfullyRevealingly

function Get-ChildItemColorfullyRevealinglyCramped {
    Get-ChildItem @args -Hidden `
    | Sort-Object { @((-not $_.PSIsContainer), $_.Name) } `
    | Format-Wide
}
Export-ModuleMember -Function Get-ChildItemColorfullyRevealinglyCramped

function Get-ChildItemColorfullyRevealinglyRecursivelyWithRecency {
    [DateTimeOffset] $nowish = [DateTimeOffset]::UtcNow
    Get-ChildItem @args -Hidden -Recurse -Force `
    | Sort-Object { @((-not $_.PSIsContainer), ($nowish - $_.LastWriteTimeUtc)) } `
    | Format-Wide
}
Export-ModuleMember -Function Get-ChildItemColorfullyRevealinglyRecursivelyWithRecency

function Get-ChildItemColorfullyRevealinglyRecursively {
    [DateTimeOffset] $nowish = [DateTimeOffset]::UtcNow
    Get-ChildItem @args -Hidden -Recurse -Force `
    | Sort-Object { @((-not $_.PSIsContainer), $_.Name) } `
    | Format-Wide
}
Export-ModuleMember -Function Get-ChildItemColorfullyRevealinglyRecursively

function Get-ChildItemColorfullyWithRecency {
    [DateTimeOffset] $nowish = [DateTimeOffset]::UtcNow
    Get-ChildItem @args `
    | Sort-Object { @((-not $_.PSIsContainer), ($nowish - $_.LastWriteTimeUtc)) } `
    | Format-Table
}
Export-ModuleMember -Function Get-ChildItemColorfullyWithRecency

function Get-ChildItemColorfullyRevealinglyWithRecency {
    [DateTimeOffset] $nowish = [DateTimeOffset]::UtcNow
    Get-ChildItem @args -Hidden `
    | Sort-Object { @((-not $_.PSIsContainer), ($nowish - $_.LastWriteTimeUtc)) } `
    | Format-Table
}
Export-ModuleMember -Function Get-ChildItemColorfullyRevealinglyWithRecency

# TODO
# function Get-ChildItemColorfullyRevealinglyWithSize {
#     Get-ChildItem @args -Hidden `
#     | Sort-Object { @((-not $_.PSIsContainer), (-not $_.PSIsContainer) ? (0-$_.Length) : (0)) } `
#     | Format-Table
# }

function Get-ChildItemNamesOnly {
    Get-ChildItem @args `
    | Sort-Object { @((-not $_.PSIsContainer), $_.Name) } `
    | Select-Object -ExpandProperty Name
}
Export-ModuleMember -Function Get-ChildItemNamesOnly

Set-Alias -Name l -Value Get-ChildItemColorfullyCramped
Set-Alias -Name ls -Value Get-ChildItemColorfully
Set-Alias -Name sl -Value Get-ChildItemColorfully -Force  # Common typo.

Set-Alias -Name ll -Value Get-ChildItemColorfullyRevealingly
Set-Alias -Name la -Value Get-ChildItemColorfullyRevealinglyCramped
Set-Alias -Name lr -Value Get-ChildItemColorfullyRevealinglyRecursivelyWithRecency
Set-Alias -Name lt -Value Get-ChildItemColorfullyRevealinglyWithRecency
Set-Alias -Name ldot -Value Get-ChildItemColorfullyRevealingly
# Set-Alias -Name lsz -Value Get-ChildItemColorfullyRevealinglyWithSize
Set-Alias -Name lart -Value Get-ChildItemColorfullyRevealinglyWithRecency
Set-Alias -Name lrt -Value Get-ChildItemColorfullyWithRecency
Set-Alias -Name lsr -Value Get-ChildItemColorfullyRevealinglyRecursively
Set-Alias -Name lsn -Value Get-ChildItemNamesOnly

Set-Alias l1 -Value Get-ChildItemColorfully
Set-Alias lf -Value Get-ChildItemColorfully


Export-ModuleMember -Alias @(
    "l",
    "ls",
    "sl",
    "ll",
    "la",
    "lr",
    "lt",
    "ldot",
    # "lsz",
    "lart",
    "lrt",
    "lsr",
    "lsn",
    "l1",
    "lf"
)
