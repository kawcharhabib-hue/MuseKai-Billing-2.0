# MuseKAI Billing 2.0 ✈️
### Modern Travel Agency Billing, Ticketing Authority Settlement & Accounting Suite

**MuseKAI Billing 2.0** is an offline-ready, desktop billing and financial management system tailored for Travel & Tourism agencies, airlines consolidators, and cargo agents. Built on a lightweight, high-performance architecture powered by Neutralinojs, native Windows shell integration, and client-side encryption.

---

## 🌟 Key Highlights & Features

### 1. Dual-Pane Auto-Fit Invoice Studio
- **Adaptive Screen Fitting**: Live A4 invoice document scales dynamically to the exact window height, eliminating awkward scroll jumps or bottom cutoffs.
- **Document Zoom Engine**: Instant toggling between `⛶ Fit Screen`, `100% Print Size`, and smooth `🔍−` / `🔍＋` zoom controls.
- **Flight & Sector Detail Tracking**: Captures Passenger Name, PNR / Booking Reference, Ticket Number, Airline, Sector / Routing, and Travel Date.
- **Automatic Client Assignment**: Scanning or typing passenger details automatically bills the passenger directly, with manual override support for corporate or third-party sponsors.

### 2. Supplier & Ticketing Authority Accounting
- **Separation of Liabilities**: Cleanly isolates base airline ticket costs from agency service charges (`Ticket Cost + Service Charge = Selling Rate`).
- **Wholesaler Due Lists**: Tracks weekly and monthly net payable balances to ticketing authorities (Flydubai, Emirates, Oman Air, Akbar Travels, Travelport, etc.).
- **Commission & Fee Protection**: Agency service charges are 100% excluded from supplier payables, ensuring exact debt calculations and protected revenue.
- **Settlement Ledger & Reconciliation**: Log partial or full bank payments, references, and print official Supplier Settlement Statements with one click.

### 3. Financial Intelligence & Reporting
- **Accurate In-Words Converter**: Robust multi-currency amount-in-words engine for OMR, AED, SAR, USD, EUR, etc. (e.g., *"One Hundred Forty-Five Rials Omani and Five Hundred Baisa Only"*).
- **True Profit & Loss**: Live tracking of Gross Margins and Net Operating Profit factored against operational agency expenses.
- **AI Financial Advisor**: Built-in integration with Google Gemini Flash-Lite for automated profitability audits, route margins, and debt risk assessment.
- **Multi-Role Security**: Role-based access control (SuperAdmin, Admin, Counter Staff, Accountant) with encrypted credentials.

### 4. Enterprise Safety & Offline Vault
- **AES-GCM Local Vault**: Auto-rotating encrypted local snapshots ensure zero data loss during power outages or machine transitions.
- **Seamless Data Persistence**: File-based and local storage dual-layer persistence.

---

## 🚀 Installation & Distribution

### Windows Setup Installer
You can install MuseKAI Billing 2.0 using the standalone Windows Setup Wizard:
- **Installer File**: [`MuseKAI-Billing-Setup-v2.0.0.exe`](./MuseKAI-Billing-Setup-v2.0.0.exe)
- **Features**:
  - Full desktop & start menu shortcut integration.
  - Supports standard user (local app data) and system-wide administrator installation.
  - Automated check to prevent overwriting running instances.
  - Clean uninstaller registered in Windows Settings / Control Panel.

---

## 🛠️ Development & Building

### Prerequisites
- Node.js (v16+)
- Neutralinojs CLI: `npm install -g @neutralinojs/neu`
- Inno Setup 6 (for compiling the Windows installer)

### Quick Start
```bash
# 1. Run in development mode with live reload
neu run

# 2. Build production release bundle
neu build --release

# 3. Compile Windows Setup Installer (1-click)
./build-installer.bat
```

---

## 📂 Project Architecture

```
MuseKai Billing 2.0/
├── resources/
│   ├── index.html               # Main Single-Page Application & Engine
│   ├── neutralino.js            # Neutralino native bridge
│   ├── favicon.ico              # Window & tab icon
│   ├── company-logo.jpg         # Default agency branding asset
│   └── icons/
│       └── appIcon.png          # High-resolution application icon
├── neutralino.config.json       # App window, API permissions, & config
├── setup.iss                    # Inno Setup 6 compilation script
├── build-installer.bat          # Automated 1-click release and setup compiler
├── MuseKAI-Billing-Setup-v2.0.0.exe # Standalone Windows Setup Installer
├── ARCHITECTURE.md              # Detailed technical design & security specs
└── README.md                    # Project documentation
```

---

## 🔒 License & Ownership
Copyright © 2026 MuseKAI Technologies. Developed for Jaber Hilali Travel Tourism & Cargo. All rights reserved.
