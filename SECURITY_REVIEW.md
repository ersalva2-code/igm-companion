# Companion review notes

## Supplied executable

Name: `IGM_Companion.exe`, Companion0.26, packaged in `IGM_STEAM_059.zip`.
SHA256: `7324b2a49547bb54db46a84d8f36ba0630f480379f083783b134dcd24805b933`.
The cleaned Companion ZIP retained exactly those executable bytes; removing
unrelated bundle files did not rebuild or alter it. The actual filename/file ID
on Nexus must be provided by the uploader; no Nexus file ID is inferred here.

## Review surfaces

- `src/Core.cs`: selected-file reads, LZ4 decoding, save parsing, local imports,
  SHA256 calculation, catalogue merge, icon codecs, backed-up export writes.
- `src/Interface.cs`: WinForms interface, image selection and local preference
  persistence, explicit import/export controls.
- `src/ImperialCore.cs`: protected built-in92-system catalogue and emblem drawing.
- `build.ps1`: compiler invocation and copying local runtime resources only.

The `Data.Export` code checks `Process.GetProcessesByName("NMS")` to refuse export
while the game runs. That presence check is distinct from process injection.
Writes include the selected catalogue export destination, tool preferences under
LocalApplicationData/ImperialGalacticMap, and user-requested project files.
Inspect all paths and error/rollback branches directly in the source.

## Static observations and limits

Assembly metadata of the supplied EXE references only mscorlib, System,
System.Core, System.Drawing, System.Windows.Forms and System.Web.Extensions.
The IGM class/method names and runtime filenames were compared to these sources.
No network client or unmanaged DLL-import declaration was found in these three
source units. This observation is not a complete binary audit or an AV scan.

A Windows rebuild, fresh GUI execution and binary-equivalence verification were
not performed here. The code is a recovered review snapshot from the earlier
source package; its provenance and inputs are recorded, not a proven reproducible
build. No change to the quarantined binary is proposed in this review request.
