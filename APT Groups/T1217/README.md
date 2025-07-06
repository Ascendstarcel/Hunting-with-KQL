# T1217 – Browser Information Discovery

## MITRE ATT&CK Technique

- **Technique ID:** T1217  
- **Tactic:** Discovery  
- **Platform:** Windows, Linux, macOS  
- **Description:** Adversaries may collect information about web browsers installed on the system, including version, configuration files, plugins, or user-agent strings. This information can help tailor follow-on attacks, such as delivering compatible exploits or extracting session tokens and credentials.

## Use Cases for Detection

This technique is often used in the reconnaissance phase of an attack. Detection opportunities exist across several event sources:

| Data Source          | Detection Focus                                          |
|----------------------|----------------------------------------------------------|
| Process Events       | Command-line tools accessing browser registry or config  |
| Script Block Logs    | PowerShell or shell scripts enumerating browser data     |
| File Access Events   | Suspicious reads from browser profile or login data      |
| Network Events       | Outbound calls to fingerprinting or profiling services   |

## Common Adversary Behaviors

- Use of `reg query`, `wmic`, or PowerShell to identify browser versions
- Access to files such as:
  - `Login Data`, `History`, or `Cookies` in Chrome
  - Firefox `prefs.js` or SQLite profile files
- Headless browser automation tools to extract user-agent information
- Outbound HTTP requests to browser fingerprinting services

## Sample KQL Detection Query (Microsoft Defender for Endpoint)

```kql
let browsers = dynamic(["Internet Explorer", "Chrome", "Firefox", "Edge"]);
let browserPaths = dynamic(["\\AppData\\Local\\Google\\Chrome\\User Data",
                            "\\AppData\\Roaming\\Mozilla\\Firefox\\Profiles",
                            "\\AppData\\Local\\Microsoft\\Edge\\User Data"]);
let suspiciousUrls = dynamic(["ipinfo.io", "browserleaks.com", "whatismybrowser.com"]);

union
DeviceProcessEvents
| where FileName in~ ("powershell.exe", "pwsh.exe", "cmd.exe", "reg.exe", "wmic.exe")
| where ProcessCommandLine has_any ("reg query", "Get-ItemProperty", "UserAgent", "HKLM\\Software\\Microsoft\\Internet Explorer", "Chrome", "Firefox", "Edge")
| project Timestamp, DeviceName, InitiatingProcessFileName, FileName, ProcessCommandLine, ReportType="ProcessRegistryBrowserDiscovery"

, DeviceFileEvents
| where FolderPath has_any (browserPaths)
| where InitiatingProcessFileName !in~ ("chrome.exe", "firefox.exe", "msedge.exe", "iexplore.exe")
| project Timestamp, DeviceName, InitiatingProcessFileName, FileName, FolderPath, ReportType="SuspiciousBrowserFileAccess"

, DeviceNetworkEvents
| where RemoteUrl has_any (suspiciousUrls)
| where InitiatingProcessFileName !in~ ("chrome.exe", "firefox.exe", "msedge.exe", "iexplore.exe")
| project Timestamp, DeviceName, InitiatingProcessFileName, RemoteUrl, InitiatingProcessCommandLine, ReportType="BrowserFingerprintingNetwork"

, DeviceProcessEvents
| where FileName in~ ("wmic.exe", "powershell.exe", "cmd.exe")
| where ProcessCommandLine has_any ("wmic product get", "Get-WmiObject", "Get-CimInstance")
| where ProcessCommandLine has_any (browsers)
| project Timestamp, DeviceName, FileName, ProcessCommandLine, ReportType="WMICOrScriptBrowserEnumeration"

| order by Timestamp desc

