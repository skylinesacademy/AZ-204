
### AZ Copy example
$source='https://skylinesstgacct.blob.core.windows.net/container1/SampleFile.txt'
$destination='C:\Users\Owner\Desktop\Examples\BlobStorage'

azcopy copy $source $destination


### AzCli example
$source='C:\Users\Owner\Desktop\Examples\BlobStorage\SampleFile.txt'
$destination='https://secondstgacct.blob.core.windows.net/test'
az storage copy --source $source --destination $destination