# Windows build instructions

1. Use Windows x64 and Microsoft .NET Framework **4.8 Developer Pack**:
   https://dotnet.microsoft.com/en-us/download/dotnet-framework/net48
2. Download/clone the repository so `src`, `runtime` and `build.ps1` are siblings.
3. Open PowerShell in that directory. Run `.\build.ps1`. If Windows marks the
   downloaded script as blocked, inspect its contents and use the file Properties
   unblock control if appropriate for your own machine. This guide does not change
   system execution policy. A manual compiler command is provided below.
4. The output is `build/IGM/IGM_Companion.exe` with the resource files alongside it.
5. Building does not run the GUI or install it in NMS. Test in a separate directory
   first; use copies of save inputs when testing export behavior.

Explicit paths, if auto-detection cannot find your development tools:

```powershell
.\build.ps1 -Compiler 'C:\Windows\Microsoft.NET\Framework64\v4.0.30319\csc.exe' -ReferenceDirectory 'C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.8'
```

## Manual C# recipe (Developer Command Prompt)

From this repository, create `build\IGM`, then use the Windows .NET Framework
compiler with 4.8 reference assemblies configured. Only these three source files
belong in the application:

```bat
csc /nologo /target:winexe /platform:x64 /optimize+ /codepage:65001 /out:build\IGM\IGM_Companion.exe /win32icon:runtime\IGM_Companion.ico /resource:src\glyphs.png,IGM.Glyphs /reference:System.dll /reference:System.Core.dll /reference:System.Drawing.dll /reference:System.Windows.Forms.dll /reference:System.Web.Extensions.dll src\Core.cs src\ImperialCore.cs src\Interface.cs
```

Copy the contents of `runtime` into `build\IGM` after compiling. The PowerShell
recipe explicitly binds all assemblies to the 4.8 reference directory and is the
preferred version. Do not replace the target references with Mono implementation
assemblies or a modern .NET runtime: this application uses .NET Framework WinForms
and System.Web.Extensions.

The source package has not been rebuilt on Windows in this preparation session.
No bit-for-bit reproducibility or GUI test is claimed. SHA256 values document the
original provided binary and unchanged inputs, not a promised output hash.

Compiler documentation: https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/compiler-options/
Resource documentation: https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/compiler-options/win32icon-compiler-option
