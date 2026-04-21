# run-liquibase.ps1
# Loads .env file and runs Liquibase

# Load .env file
Get-Content .env | ForEach-Object {
    if ($_ -match '^\s*([^#][^=]+)=(.*)$') {
        $key   = $matches[1].Trim()
        $value = $matches[2].Trim()
        [System.Environment]::SetEnvironmentVariable($key, $value, "Process")
        Write-Host "Loaded: $key"
    }
}

# Run Liquibase
liquibase status