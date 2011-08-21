# PowerCurl

A simple curl implementation in PowerShell.

## Why

I've been working with Twilio and a bunch of other rest APIs and wanted an easy way to test them without having to leave Visual Studio. So, I figured why not build a basic PowerShell implementation of curl (using the same command-line signature) and deliver it via NuGet so that it can be used via the NuGet Package Manager console.

## Usage

Just like curl: 

	curl -X <verb> <url> -u <username>:<password>

## Example using Twilio Rest API

	curl -X GET 'https://api.twilio.com/2010-04-01/Accounts/{AccountSid}.xml' -u {AccountSid}:{AuthToken}

or

	curl -X GET 'https://api.twilio.com/2010-04-01/Accounts/{AccountSid}.json' -u {AccountSid}:{AuthToken}

## Benefits of PowerShell

Using the Twilio example above, you could easily parse this xml using:

	([xml](curl -X get https://api.twilio.com/2010-04-01/Accounts/{AccountSid}.xml -u {AccountSid}:{AuthToken})).TwilioResponse.Account

PowerShell Output:

	Sid             : {AccountSid}
	FriendlyName    : {Your Account Name}
	Status          : {active | suspended | closed} 
	DateCreated     : {DateCreated}
	DateUpdated     : {DateUpdated}
	AuthToken       : {AuthToken}
	Type            : {Type}
	Uri             : /2010-04-01/Accounts/{AccountSid}.xml
	SubresourceUris : SubresourceUris

## Disclaimer

This is by no means a full implementation of all of curl's features. Initially, I plan to support basic HTTP GET, POST, PUT, DELETE, etc. If you want to see more, fork me and feel free to add to it.

## Copyright

Copyright (c) 2011 Adam Anderly

## License

MS-PL