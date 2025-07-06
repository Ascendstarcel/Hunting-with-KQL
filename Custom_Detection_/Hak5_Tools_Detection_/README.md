# Bad USB / HID Attack Detection (Rubber Ducky, Bash Bunny, Hak5 Tools)

## Overview

Detecting malicious USB devices such as the **Rubber Ducky**, **Bash Bunny**, and other **Hak5 attack tools** is inherently difficult because they mimic trusted Human Interface Devices (HIDs) such as keyboards or network adapters. These devices often bypass traditional USB security controls and operate as if they are legitimate input or network hardware.

While native detection of the hardware is limited, their activity can often be detected through the **behavior they cause on the host after being connected**.

This hunting pack includes **KQL queries** designed for use with **Microsoft Sentinel** or **Microsoft Defender for Endpoint**. These queries detect suspicious post-connection activity such as unexpected PowerShell execution, HID-based payload delivery, unauthorized account creation, credential access, or malicious network activity.

---

## Key Detection Areas

### 1. HID Emulation (Rubber Ducky-style attacks)
- Detect keyboard emulation payloads delivering scripts or commands
- Identify rapid PowerShell or CMD execution after user logon
- Flag unusual command-line patterns like `-enc`, `DownloadString`, or `Invoke-Expression`

### 2. Bash Bunny / USB Ethernet Mode
- Identify creation of new network interfaces (169.254.x.x range)
- Correlate USB mount events with PowerShell web requests to rogue local servers

### 3. Script Execution from USB Drives
- Execution of `.ps1`, `.vbs`, `.bat`, or `.cmd` from removable media
- Launch of `powershell.exe`, `cmd.exe`, `wscript.exe` from USB paths (e.g., `E:\`, `F:\`)

### 4. Account Creation or Privilege Changes
- Use of `net user add` or `net localgroup administrators` shortly after USB insert or login

### 5. Defense Evasion and Payload Staging
- Disabling Defender or system firewall via `powershell.exe`, `netsh`, or `sc.exe`
- Dropping or executing malicious DLLs or scripts from non-standard paths

---

## Example Use Cases

- **Rubber Ducky HID payloads** creating a backdoor user account within seconds of login
- **Bash Bunny in Ethernet mode** serving PowerShell scripts to the target over a local IP
- **Script execution from USB** triggering ransomware pre-staging or recon commands
- **Credential access attempts** via `mimikatz`, `procdump`, or LSASS memory dumps

---

## How to Use

Import or paste the provided KQL queries into:

- Microsoft Defender for Endpoint advanced hunting
- Microsoft Sentinel scheduled analytics rules
- Custom detection content in your SIEM

For best results, combine multiple queries using time-based joins and correlation logic to reduce false positives and increase fidelity.

---

## Requirements

- Microsoft Defender for Endpoint or Microsoft Sentinel
- Audit logging for process creation, USB mount events, and PowerShell execution
- Optional: Enhanced logging for network interface changes and removable media

---

## References

- [Mitre ATT&CK: T1204.001 - User Execution: Malicious File](https://attack.mitre.org/techniques/T1204/001/)
- [Mitre ATT&CK: T1059.001 - PowerShell](https://attack.mitre.org/techniques/T1059/001/)
- [Mitre ATT&CK: T1036.005 - Masquerading: Match Legitimate Name or Location](https://attack.mitre.org/techniques/T1036/005/)
- [Hak5 Rubber Ducky Documentation](https://docs.hak5.org/hak5-usb-rubber-ducky/)
- [Hak5 Bash Bunny Wiki](https://docs.hak5.org/hak5-bash-bunny/)

