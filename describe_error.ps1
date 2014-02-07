<#

DONE_TODO: create an object, pass around in descriptions, instead of the string.  add to the object the overall message.  Add to the object as per the property.  So, if message, add to object's message, if stacktrace, add to the object's stack trace, if etc, etc.

TODO: Exception                       =[Data              =[System.Collections.ListDictionaryInternal]

#>



<#
.EXAMPLE
    $ErrorActionPreference="SilentlyContinue"
    1/0
    $desc = (describe_error -obj:$error[0])
    write-host $desc
.EXAMPLE
    $ErrorActionPreference="Stop"
    try
    {
        1/0
    }
    catch
    {
        $desc = (describe_error -obj:$_)
        write-host $desc
    }
#>
Function describe_error ( $obj )
{
    if ($obj -eq $null ) {return "HEY!  This error 'thing' is NULL."}

    $type = ""
    $obj | Get-Member | ForEach-Object{
        $type =( $_.TypeName )
    }
    $ret_msg = ""
    switch ( $type )
    {
        "System.Management.Automation.ParseException"                       { $ret_msg = (describe_error_briefly -parse_exception_to_read:$obj  )}
        "System.Management.Automation.CmdletInvocationException"            { $ret_msg = (describe_error_briefly -cmdlet_invocation_exception_to_read:$obj  )}
        "System.Management.Automation.ErrorRecord"                          { $ret_msg = ( describe_error_briefly -errorRecord_to_read:$obj  )}
        "System.Management.Automation.ActionPreferenceStopException"        { $ret_msg = (describe_error_briefly -action_preference_stop_exception_to_read:$obj  )}
        "System.Management.Automation.ParameterBindingException"            { $ret_msg = (describe_error_briefly -parameter_binding_exception_to_read:$obj  )}
        default                                                             { $ret_msg = (describe_error_briefly -object:$obj )}
    }
    if ($ret_msg -eq $null) { $ret_msg = "??? Hmmm.....We describe this error object as NULL ???"}
    return $ret_msg
}
