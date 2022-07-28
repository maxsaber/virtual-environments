
# Download agent: https://vstsagentpackage.azureedge.net/agent/2.206.1/vsts-agent-win-x64-2.206.1.zip
# Configuration instructions: https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/v2-windows?view=azure-devops

# Create the agent
Set-Location C:\
mkdir agent
mkdir agentdl

# Download agent
Invoke-WebRequest -Uri https://vstsagentpackage.azureedge.net/agent/2.206.1/vsts-agent-win-x64-2.206.1.zip -OutFile C:\agentdl\vsts-agent-win-x64-2.206.1.zip

# Unzip agent files
cd agent
Add-Type -AssemblyName System.IO.Compression.FileSystem ; [System.IO.Compression.ZipFile]::ExtractToDirectory("C:\agentdl\vsts-agent-win-x64-2.206.1.zip", "$PWD")

# Remove agent ZIP download and temp directory
rmdir c:\agentdl -Recurse -Confirm:$false

# Configure the agent
.\config.cmd