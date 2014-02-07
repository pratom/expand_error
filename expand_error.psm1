$oops_dir = $PSScriptRoot
. $oops_dir\describe_error.ps1
. $oops_dir\describe_global_errors_briefly.ps1
. $oops_dir\describe_error_briefly.ps1
<# . $oops_dir\ooooops_describe_global_error_variable.ps1 #>
Export-ModuleMember -Function describe_error_briefly 
Export-ModuleMember -Function describe_error 
Export-ModuleMember -Function describe_global_errors_briefly
<# Export-ModuleMember -Function ooooops_describe_global_error_variable  #>