Function describe_global_errors_briefly
{

    $descriptions = ""
    $counter = 0
    if ($Global:error -eq $null)
    {
      $descriptions =  "`$Global:error is NULL ????" 
    }
    else
    {
        $copied = ( $Global:error | foreach { $_ } )

        $copied | Foreach {
         
         $descriptions += "

=====ERROR [$counter]  BEGIN==========================================================
$( describe_error $_ )
=====ERROR [$counter]  END============================================================
    " 
         $counter += 1
            }  
    }
<#.Replace( [Environment]::NewLine, "$([Environment]::NewLine)     " )  )#>

    $descriptions = $descriptions.Replace( [Environment]::NewLine, "$([Environment]::NewLine)          " )

    $descriptions_wrapped = "
--------------DESCRIBE GLOBAL ERROR VARIABLE.  COUNT=[$($copied.Count)]----BEGIN-------------------------------------

$descriptions

--------------DESCRIBE GLOBAL ERROR VARIABLE.  COUNT=[$($copied.Count)]----END---------------------------------------
"
    return $descriptions_wrapped
}
