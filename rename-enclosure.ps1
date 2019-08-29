# Sample code to rename enclosure in Synergy

connect-HPOVMgmt -hostname '<OV-IP-host>' -credential (get-credential)

$name           = '0000A66101'
$new_name       = 'BLVC0001'

$this_enclosure = get-HPOVEnclosure -name $this_name
if $this_enclosure
{
    $uri            = $this_enclosure.uri

    $body = @{"op" = "replace"; "path" = "/name"; "value" = "new_name"}
    $headers = @{'content-type'= 'application/json'; "If-Match" = '*'}


    send-HPOVRequest -uri $uri "PATCH" $body -AddHeader $headers
}
