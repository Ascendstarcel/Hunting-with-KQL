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

