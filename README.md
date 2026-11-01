# IGM Companion — source review snapshot (0.26)

Optional C#/Windows Forms helper for Imperial Galactic Map. This repository is
prepared for inspection and a Nexus Mods quarantine review of the Companion
executable shipped in the Steam 0.59 bundle. It is separate from the in-game DLL
and from Quick Portal Glyphs - Bookmarks.

## Build

Read [BUILD.md](BUILD.md). On Windows x64, install the .NET Framework **4.8 Developer
Pack** (runtime alone is not the reference-assembly pack). In PowerShell, from
this repository, run:

```powershell
.\build.ps1
```

The script finds the Windows C# compiler and the 4.8 reference assemblies, compiles
only `src/Core.cs`, `src/ImperialCore.cs` and `src/Interface.cs`, embeds `IGM.Glyphs`
and copies the runtime resources to `build/IGM/`. It performs no downloads and
does not install into your game. Parameters allow explicit compiler/reference
assembly paths. Do not compile the historical Verify*.cs tests into the GUI.

## Runtime purpose

- Read a save selected by the user; decode JSON/LZ4 and collect catalogue data.
- Edit emblem styling and export local catalogue/name/icon files for IGM.
- Block export while a process named NMS is running.
- Store tool preferences in the user's LocalApplicationData/ImperialGalacticMap.
- Keep backups of existing destination files before export, with rollback logic.

Place a compiled application's contents in `No Man's Sky/Binaries/IGM/`, keeping
its resource files together. Its local destination is `IGM_datos` alongside it.
No saves, tokens, accounts or user catalogues are included here.

## What this snapshot does and does not establish

The three source files are preserved from the previously supplied source review
snapshot. Runtime assets are copied byte-for-byte from the supplied 0.59 bundle.
The supplied binary's assembly references, class/method names and resource file
names were inspected for consistency. See [SECURITY_REVIEW.md](SECURITY_REVIEW.md)
and [PROVENANCE.json](PROVENANCE.json) for the exact executable SHA256.

**The Windows build and GUI were not executed during this packaging session. A
byte-identical reproduction of the supplied executable has not been established.**
Build metadata/compiler versions may differ. This is not an antivirus result or
an assurance that Nexus will approve it. The existing executable remains 0.26;
its older built-in catalogue is not the 121-record catalogue in the current DLL.

## Contents

`src/`: three GUI source units and embedded glyph atlas.
`runtime/`: config, languages, icon/logo and all178 emblem images required by the
unchanged interface. `build.ps1`: local Windows compiler recipe. `notices/`:
original resource credits. No game DLL, helper EXE, installer or private save.

See [NOTICE.md](NOTICE.md) before redistributing resource assets; inclusion for
review does not assert that third-party artwork is under an open-source license.

Unofficial community project; not affiliated with Hello Games or Nexus Mods.
