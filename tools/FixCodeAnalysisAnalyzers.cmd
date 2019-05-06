@echo off

set _msbuildPath="C:\Program Files\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin"

%_msbuildPath%\msbuild "..\src\CommandLine.sln" /t:Build /p:Configuration=Debug /v:m /m

"..\src\CommandLine\bin\Debug\net461\roslynator" fix "..\src\Roslynator.sln" ^
 --msbuild-path %_msbuildPath% ^
 --analyzer-assemblies ^
  "..\src\CommandLine\bin\Debug\net461\Roslynator.CSharp.Analyzers.dll" ^
  "..\src\CommandLine\bin\Debug\net461\Roslynator.CSharp.Analyzers.CodeFixes.dll" ^
  "..\src\CodeAnalysis.Analyzers.CodeFixes\bin\Debug\netstandard1.3\Roslynator.CodeAnalysis.Analyzers.dll" ^
  "..\src\CodeAnalysis.Analyzers.CodeFixes\bin\Debug\netstandard1.3\Roslynator.CodeAnalysis.Analyzers.CodeFixes.dll" ^
 --projects CodeAnalysis.Analyzers CodeAnalysis.Analyzers.CodeFixes ^
 --format ^
 --verbosity d ^
 --file-log "roslynator.log" ^
 --file-log-verbosity diag ^
 --diagnostic-fix-map "RCS1155=Roslynator.RCS1155.OrdinalIgnoreCase" ^
 --file-banner " Copyright (c) Josef Pihrt. All rights reserved. Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information."

pause