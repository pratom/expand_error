expand_error
==============

powershell module - creates a standardized, readable string from either the global variable error ($global:error) or an object caught in a catch block.

# Examples
### Describe the caught exception
```powershell
import-module .\expand_error\expand_error.psm1
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
```

### Describe the caught exception, and all of the uncaught / uncleared errors in $global:error
```powershell
import-module .\expand_error\expand_error.psm1
$ErrorActionPreference="Stop"

try
{
    1/0
}
catch
{
    $desc = (describe_error -obj:$_)
    write-host $desc
    $desc = (describe_global_errors_briefly);
    write-host $desc
}
```

### Describe the caught exception, issue a warning, and log all of it for later diagnosis
```powershell
import-module .\expand_error\expand_error.psm1
import-module .\log_this\log_this.psm1
$ErrorActionPreference="Stop"

try
{
    1/0
}
catch
{
    $desc = (describe_error -obj:$_)
    write-warning $desc
    $desc += (describe_global_errors_briefly);
    log_this $desc
}
```
