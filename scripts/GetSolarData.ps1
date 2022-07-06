#this script gets the data from the enphase api
$jsonConfig = Get-Content -Raw -Path config.json | ConvertFrom-Json

$response = Invoke-RestMethod "https://api.enphaseenergy.com/api/v2/systems/2319758/summary?key=$($jsonConfig.apikey)&user_id=$($jsonConfig.username)" -Method 'GET' -Headers $headers
$response | ConvertTo-Json | Set-Content ../solardata.json

