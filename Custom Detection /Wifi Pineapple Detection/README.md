#WiFi Pineapple Detection Query

## Purpose
This query is designed to detect suspicious behavior associated with rogue wireless access points, specifically devices like the **Hak5 WiFi Pineapple**, which are used for wireless man-in-the-middle (MitM) attacks, DNS spoofing, and rogue captive portals.

## Description
WiFi Pineapple devices often redirect users to local IPs while impersonating trusted connectivity-check domains (e.g., `msftconnecttest.com`, `apple.com`). They typically operate on IP ranges such as `172.16.42.x`, `192.168.x.x`, or `10.0.x.x`.

This query:
- Flags DNS requests for common captive portal test domains resolving to local or rogue IP addresses
- Correlates those requests with recent network connections to the same rogue IPs
- Surfaces the initiating process and command line for investigation

## Use Case
Use this query to:
- Identify devices that may have connected to a rogue WiFi AP
- Detect MitM setups that intercept initial web traffic
- Correlate suspicious local DNS responses with subsequent PowerShell activity

## Data Sources Required
- `DeviceNetworkEvents`
- `DeviceEvents`

## Tactics & Techniques (MITRE ATT&CK)
- **T1557.002** – Adversary-in-the-Middle: Rogue Wi-Fi Access Point
- **T1040** – Network Sniffing
- **T1566.002** – Spearphishing via Service (captive portal spoofing)

## Recommendations
- Pair with additional detections for PowerShell beaconing and unexpected gateway switching
- Alert on any internal device resolving known test domains to local IP addresses
- Review devices contacting `172.16.42.1` and similar IPs for unauthorized software or command execution

## References
- https://attack.mitre.org/techniques/T1557/002/
- https://docs.hak5.org/wifi-pineapple/
- https://www.sans.org/white-papers/39543/
