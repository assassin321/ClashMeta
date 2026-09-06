@echo off
REM build_local.bat - 仅编译，不下载运行时资产

echo === Building ClashMeta (local only) ===

echo [1/2] Building ClashMeta.exe (wails)...
wails build -platform windows/amd64
if %ERRORLEVEL% neq 0 (
    echo ERROR: Wails build failed
    exit /b 1
)

echo [2/2] Building ClashMetaHelper.exe...
go build -ldflags "-s -w" -o build\bin\ClashMetaHelper.exe .\cmd\clashmeta-helper\
if %ERRORLEVEL% neq 0 (
    echo ERROR: Helper build failed
    exit /b 1
)

echo === Build complete ===
dir build\bin\*.exe
