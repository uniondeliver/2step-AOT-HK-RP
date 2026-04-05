@echo off
cd /d "%~dp0"
luabundler bundle Main.lua -p "./?.lua" -o Output/Bundled.lua -l 5.1
