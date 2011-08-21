function powercurl($X, $url, $d, $u) {
    $verb = $X
    $params = $d

    $req = [System.Net.WebRequest]::Create($url)
    $req.Method = $verb
    $req.ContentLength = 0
    $cred = $u.split(":")
    if ($u) {
        $req.Credentials = new-object System.Net.NetworkCredential($cred[0],$cred[1])
    } else {
        $req.Credentials = [System.Net.CredentialCache]::DefaultCredentials
    }
    if ($verb -eq "POST") {
        $req.ContentType = "application/x-www-form-urlencoded"
        # Write the request
        if ($params) {
            $bytes = [System.Text.Encoding]::ASCII.GetBytes($params)
            $req.ContentLength = $bytes.Length
            $requestStream = $req.GetRequestStream()
            $requestStream.Write($bytes, 0, $bytes.Length) #Push it out there
            $requestStream.Close()
        }
    }
    $response = $req.GetResponse()
    $reader = new-object System.IO.StreamReader($response.GetResponseStream())
    $result = $reader.ReadToEnd()
    $reader.Close()
    $result
}