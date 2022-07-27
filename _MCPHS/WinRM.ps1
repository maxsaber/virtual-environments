winrm create winrm/config/Listener?Address=*+Transport=HTTPS '@{Hostname="pkrvmklxyx61sxk.eastus.cloudapp.azure.com"; CertificateThumbprint="fa8c89e7a21df0e472abb599ee2dab4ac596536b"}'

New-SelfSignedCertificate -Subject ServerAuthentication -DnsName "pkrvmklxyx61sxk.eastus.cloudapp.azure.com" -CertStoreLocation Cert:\LocalMachine\My




winrm delete winrm/config/Listener?Address=*+Transport=HTTPS


# Add a new firewall rule
port=5986
netsh advfirewall firewall add rule name="Windows Remote Management (HTTPS-In)" dir=in action=allow protocol=TCP localport=$port



$soptions = New-PSSessionOption -SkipCACheck
$winrmPort = "5986"
Enter-PSSession -ComputerName "pkrvmklxyx61sxk.eastus.cloudapp.azure.com" -Port $winrmPort -Credential $cred -SessionOption $soptions -UseSSL


-TextExtension @("2.5.29.37={text}1.3.6.1.5.5.7.3.1") 