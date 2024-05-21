# Active Reconnaissance on Web Application

## Setup

```mermaid
graph TD
    subgraph Setup
        A[Create Docker Network]
        B[Deploy Target Containers]
        B1[DVWA (web1)]
        B2[DVWA (web2)]
        B3[MySQL (db)]
        B4[Tomcat (app)]
        A --> B
        B --> B1
        B --> B2
        B --> B3
        B --> B4
    end

    subgraph Reconnaissance
        C[Network Discovery] --> D[Port Scanning]
        D --> E[Service Enumeration]
        E --> F[Banner Grabbing]
        F --> G[Vulnerability Scanning]
        E -->|Parallel Step| H[Packet Sniffing]
        G --> I[Reporting and Analysis]
    end

    subgraph Tools
        J[Nmap]
        K[Nmap, Socket]
        L[Socket]
        M[Nmap scripts, Metasploit]
        N[Scapy, Tshark]
        O[Reporting tools]
    end

    Setup --> Reconnaissance

    C --> J
    D --> J
    E --> K
    F --> L
    G --> M
    H --> N
    I --> O

    style Setup fill:#ffcccc,stroke:#333,stroke-width:2px,color:#000
    style Reconnaissance fill:#ccffcc,stroke:#333,stroke-width:2px,color:#000
    style Tools fill:#99ccff,stroke:#333,stroke-width:2px,color:#000