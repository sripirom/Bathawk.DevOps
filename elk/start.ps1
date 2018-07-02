# Start elasticsearch
function Start-Elasticsearch()
{
    Write-Host "Starting elasticsearch"
    Start-Process "cmd" -ArgumentList '/k','%CD%\thirdParty\elasticsearch\bin\elasticsearch.bat'
    Start-Sleep -s 15
     Write-Host "--------------------------------------------"
    Write-Host "Test call  elasticsearch"
    Invoke-RestMethod -Uri http://localhost:9200
}

function Start-Kibana()
{
    Write-Host "Starting kibana"
    Start-Process "cmd" -ArgumentList '/k','%CD%\thirdParty\kibana\bin\kibana.bat'
    Start-Sleep -s 15

    Write-Host "Browse to kibana"
    Start-Process -Path "http://localhost:5601"
    [System.Diagnostics.Process]::Start("http://localhost:5601")
    (New-Object -Com Shell.Application).Open("http://localhost:5601")
}


function Start-Logstash()
{
    Write-Host "Starting LogStash"
    Start-Process "cmd" -ArgumentList '/c','%CD%\thirdParty\logstash\bin\logstash.bat -f %CD%\thirdParty\logstash\bin\logstash_bulk.config'
    Start-Sleep -s 15
     Write-Host "--------------------------------------------"
}

if($args[0] -eq "Elasticsearch"){ Start-Elasticsearch }

if($args[0] -eq "Kibana"){ Start-Kibana }

if($args[0] -eq "LogStash"){ Start-Logstash }
