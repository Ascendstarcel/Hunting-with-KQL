# APT29 - Detection Queries by MITRE ATT&CK Technique

## Overview

APT29, also known as Cozy Bear or The Dukes, is a state-sponsored threat group attributed to the Russian Foreign Intelligence Service (SVR). The group is known for conducting long-term espionage campaigns targeting government, diplomatic, healthcare, and research organizations, particularly across North America and Europe.

APT29 is characterized by its stealth, operational security, and use of legitimate services and credentials to maintain access.

This repository contains detection and hunting queries mapped to MITRE ATT&CK techniques observed in APT29 campaigns. The goal is to provide defenders with actionable logic to detect, investigate, and respond to behaviors consistent with this adversary.

## Repository Structure

Each file corresponds to a specific MITRE ATT&CK technique and includes the following:

- MITRE Technique ID and name
- Brief description of how APT29 uses the technique
- Detection logic (typically in Kusto Query Language for Microsoft Defender/Sentinel)
- References to public threat intelligence

## Usage

The queries in this repository are designed for:

- Threat hunting
- Detection engineering
- Control validation
- ATT&CK mapping and reporting

Security teams can adapt the queries to their environment and data sources. Where possible, queries are written with generic patterns to ensure broader applicability.

## Techniques Covered

| Technique ID | Technique Name                      | File Name                              | Status        |
|--------------|-------------------------------------|----------------------------------------|---------------|
| T1217        | Browser Information Discovery       | T1217_BrowserInformationDiscovery.kql  | Complete      |
| T1059.001    | Command and Scripting: PowerShell   | T1059.001_PowerShellUsage.kql          | Complete      |
| T1082        | System Information Discovery        | T1082_SystemInfoDiscovery.kql          | Complete      |
| T1112        | Modify Registry                     | T1112_ModifyRegistry.kql               | In progress   |
| T1003.001    | LSASS Memory Credential Dumping     | T1003.001_LSASSDumping.kql             | Planned       |
| T1560.001    | Archive via Utility                 | T1560.001_ArchiveViaUtility.kql        | Planned       |

