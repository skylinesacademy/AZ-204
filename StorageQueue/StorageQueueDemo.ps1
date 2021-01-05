$storageAccount = Get-AzStorageAccount -ResourceGroupName Skylines -Name skylinesdemostgacct
$ctx = $storageAccount.Context

$queue = Get-AzStorageQueue -Name skylinesqueue -Context $ctx



# Create a new message using a constructor of the CloudQueueMessage class
$queueMessage = [Microsoft.Azure.Storage.Queue.CloudQueueMessage]::new("Sample message 1")

# Add a new message to the queue
$queue.CloudQueue.AddMessageAsync($QueueMessage)

# Add two more messages to the queue
$queueMessage = [Microsoft.Azure.Storage.Queue.CloudQueueMessage]::new("Sample message 2")
$queue.CloudQueue.AddMessageAsync($QueueMessage)

$queueMessage = [Microsoft.Azure.Storage.Queue.CloudQueueMessage]::new("Sample message 3")
$queue.CloudQueue.AddMessageAsync($QueueMessage)