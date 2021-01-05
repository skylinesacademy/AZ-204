using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function processed a request."

# Interact with query parameters or the body of the request.
$name = $Request.Query.Name
if (-not $name) {
  $name = $Request.Body.Name
}

$body = "This HTTP triggered function executed successfully. Pass a name in the query string or in the request body for a personalized response."

if ($name) {

  $multipartContent = [System.Net.Http.MultipartFormDataContent]::new()
  $stringHeader = [System.Net.Http.Headers.ContentDispositionHeaderValue]::new("form-data")
  $stringHeader.Name = "template_id"
  $StringContent = [System.Net.Http.StringContent]::new("148125073")
  $StringContent.Headers.ContentDisposition = $stringHeader
  $multipartContent.Add($stringContent)

  $stringHeader = [System.Net.Http.Headers.ContentDispositionHeaderValue]::new("form-data")
  $stringHeader.Name = "username"
  $StringContent = [System.Net.Http.StringContent]::new("jf781")
  $StringContent.Headers.ContentDisposition = $stringHeader
  $multipartContent.Add($stringContent)

  $stringHeader = [System.Net.Http.Headers.ContentDispositionHeaderValue]::new("form-data")
  $stringHeader.Name = "password"
  $StringContent = [System.Net.Http.StringContent]::new("Itissunday1")
  $StringContent.Headers.ContentDisposition = $stringHeader
  $multipartContent.Add($stringContent)

  $stringHeader = [System.Net.Http.Headers.ContentDispositionHeaderValue]::new("form-data")
  $stringHeader.Name = "text0"
  $StringContent = [System.Net.Http.StringContent]::new("Who has two thumbs and likes Azure?")
  $StringContent.Headers.ContentDisposition = $stringHeader
  $multipartContent.Add($stringContent)

  $stringHeader = [System.Net.Http.Headers.ContentDispositionHeaderValue]::new("form-data")
  $stringHeader.Name = "text1"
  $StringContent = [System.Net.Http.StringContent]::new($name)
  $StringContent.Headers.ContentDisposition = $stringHeader
  $multipartContent.Add($stringContent)

  $stringHeader = [System.Net.Http.Headers.ContentDispositionHeaderValue]::new("form-data")
  $stringHeader.Name = "font"
  $StringContent = [System.Net.Http.StringContent]::new("arial")
  $StringContent.Headers.ContentDisposition = $stringHeader
  $multipartContent.Add($stringContent)

  $requestbody = $multipartContent

  $response = Invoke-RestMethod 'https://api.imgflip.com/caption_image' -Method 'POST' -Headers $headers -Body $requestbody
  $body = $response.data.url

}

# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
  StatusCode = [HttpStatusCode]::OK
  Body       = $body
})
