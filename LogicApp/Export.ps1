

$parameters = @{
    Token = (az account get-access-token | ConvertFrom-Json).accessToken
    LogicApp = 'SkylinesLogicApp'
    ResourceGroup = 'Skylines'
    SubscriptionId = (Get-AzContext).Subscription.Id
    Verbose = $true
}

Get-LogicAppTemplate @parameters | Out-File ./SkylinesLogicApp.json