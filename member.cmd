@echo off
rem English only on purpose: in one test cmd.exe broke Chinese lines in this UTF-8 batch file (2026-10-09).
chcp 65001 >nul
cd /d "%~dp0"
title Member - my-team
if not exist "%~dp0opencode.exe" (
  echo.
  echo   opencode.exe is not in this folder yet.
  echo   Drag opencode.exe into this folder, next to AGENTS.md.
  echo   Then double-click member.cmd again.
  echo.
  echo   This folder: %~dp0
  echo.
  pause
  exit /b 1
)
rem Keep the window title (Leader / Member) so the two windows are easy to tell apart.
set OPENCODE_DISABLE_TERMINAL_TITLE=1
rem This window is the member only: the other name tag is switched off here, so Tab cannot swap it.
set "OPENCODE_CONFIG_CONTENT={"agent":{"leader":{"disable":true}}}"
"%~dp0opencode.exe" --agent member
