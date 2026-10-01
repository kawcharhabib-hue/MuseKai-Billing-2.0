; ============================================================
; MuseKAI Travel Agency Billing & Accounting Suite
; Inno Setup 6 Professional Installer Script
; ============================================================

#define MyAppName "MuseKAI Travel Agency Billing & Accounting Suite"
#define MyAppShortName "MuseKAI Billing"
#define MyAppVersion "2.0.0"
#define MyAppPublisher "MuseKAI Technologies"
#define MyAppURL "https://musekai.com"
#define MyAppExeName "MuseKAI-Billing-win_x64.exe"

[Setup]
; Basic Application Identification
AppId={{5E87F3B1-948A-4217-B2A0-8F92F7641B20}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppShortName} v{#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}

; Destination Directories
DefaultDirName={autopf}\{#MyAppShortName}
DefaultGroupName={#MyAppShortName}
AllowNoIcons=yes

; User Privileges: Support both Standard Users and System Administrators
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog

; Output configuration
OutputDir=dist\installer
OutputBaseFilename=MuseKAI-Billing-Setup-v2.0.0
SetupIconFile=installer_icon.ico
UninstallDisplayIcon={app}\installer_icon.ico

; Visual styling
WizardStyle=modern
WizardSizePercent=115
InfoBeforeFile=WELCOME.txt

; Compression and Packaging
Compression=lzma2/ultra64
SolidCompression=yes

; Process Management: Ensure app is closed before updating/uninstalling
CloseApplications=yes
CloseApplicationsFilter=*{#MyAppExeName}*

; Permissions: Ensure write access for local databases and backups
[Dirs]
Name: "{app}"; Permissions: users-full

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[Files]
Source: "dist\MuseKAI-Billing\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "dist\MuseKAI-Billing\resources.neu"; DestDir: "{app}"; Flags: ignoreversion
Source: "neutralino.config.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "installer_icon.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "company-logo.jpg"; DestDir: "{app}"; Flags: ignoreversion; DestName: "company-logo.jpg"
Source: "resources\favicon.ico"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\{#MyAppShortName}"; Filename: "{app}\{#MyAppExeName}"; WorkingDir: "{app}"; IconFilename: "{app}\installer_icon.ico"
Name: "{group}\{cm:UninstallProgram,{#MyAppShortName}}"; Filename: "{uninstallexe}"; IconFilename: "{app}\installer_icon.ico"
Name: "{autodesktop}\{#MyAppShortName}"; Filename: "{app}\{#MyAppExeName}"; WorkingDir: "{app}"; Tasks: desktopicon; IconFilename: "{app}\installer_icon.ico"

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppShortName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent; WorkingDir: "{app}"
