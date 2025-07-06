# Adversary-Based Detection Queries

## Overview

This directory contains detection and hunting queries mapped to adversary behaviors as documented in the MITRE ATT&CK framework. Each folder represents a threat actor or campaign, with detection logic aligned to the techniques observed in publicly attributed activity.

The goal is to help defenders implement structured and threat-informed detection coverage based on real-world adversary behavior.

## Purpose

- Provide actionable detection logic for common adversary techniques
- Support security operations teams in threat hunting and incident response
- Map detections to MITRE ATT&CK for consistent reporting and prioritization
- Enable structured adversary emulation and control validation

## Contents

Each subfolder contains:

- MITRE ATT&CK technique-aligned queries
- Detection logic in Kusto Query Language (KQL) and/or other formats
- Context or rationale for how and why each technique is used
- References to threat intelligence where applicable

## References

- MITRE ATT&CK Framework  
  https://attack.mitre.org/

- MITRE ATT&CK Techniques by Tactic  
  https://attack.mitre.org/matrices/enterprise/

- MITRE ATT&CK Navigator  
  https://mitre-attack.github.io/attack-navigator/

- Sigma Rule Format for Detection Engineering  
  https://sigmahq.io/

- Microsoft Threat Intelligence: Detection and Hunting Guidance  
  https://www.microsoft.com/security/blog/

- Elastic Security: Threat Detection with EQL and Sigma  
  https://www.elastic.co/security-labs

- Red Canary Threat Detection Reports  
  https://redcanary.com/threat-detection-report/

- CISA Known Exploited Vulnerabilities Catalog  
  https://www.cisa.gov/known-exploited-vulnerabilities-catalog

- Mandiant Threat Intelligence Resources  
  https://www.mandiant.com/resources

- ATT&CK-Based Threat Detection and Hunting with KQL  
  https://learn.microsoft.com/en-us/azure/sentinel/hunting

- Detection Engineering Wiki  
  https://detectionengineering.wiki/


