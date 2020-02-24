@echo off
title MicroG installer for amazfit pace

:MENU
echo ##########################################
echo #  MicroG installer for amazfit watches  #
echo #              By micrusa                #
echo ##########################################
echo.
echo 1. Install microG
echo 2. Uninstall microG
echo.
echo x. Exit
echo.
set /p OPT=Select an option: 
if %OPT%==1 goto INSTALL
if %OPT%==2 goto UNINSTALL
if %OPT%==x exit
if %OPT%==X exit
echo Wrong option
goto MENU
pause
exit


:UNINSTALL
echo Uninstalling microG
adb root
adb shell mount -o rw,remount /system
rm -f /system/etc/default-permissions/microg-permissions.xml
rm -f /system/etc/default-permissions/phonesky-permissions.xml
rm -f /system/etc/permissions/features.xml
rm -f /system/priv-app/FakeStore/FakeStore.apk
rm -f /system/priv-app/GmsCore/GmsCore.apk
rm -f /system/priv-app/GsfProxy/GsfProxy.apk
rm -f /system/priv-app/Phonesky/Phonesky.apk
adb shell reboot
echo MicroG uninstalled
pause
exit



:INSTALL
echo Installing microG...
adb root
adb shell mount -o rw,remount /system
adb push ./system/etc/default-permissions/microg-permissions.xml /system/etc/default-permissions/microg-permissions.xml
adb push ./system/etc/default-permissions/phonesky-permissions.xml /system/etc/default-permissions/phonesky-permissions.xml
adb push ./system/etc/permissions/features.xml /system/etc/permissions/features.xml
adb push ./system/priv-app/FakeStore/FakeStore.apk /system/priv-app/FakeStore/FakeStore.apk
adb push ./system/priv-app/GmsCore/GmsCore.apk /system/priv-app/GmsCore/GmsCore.apk
adb push ./system/priv-app/GsfProxy/GsfProxy.apk /system/priv-app/GsfProxy/GsfProxy.apk
adb push ./system/priv-app/Phonesky/Phonesky.apk /system/priv-app/Phonesky/Phonesky.apk
adb shell reboot
echo MicroG installed.
pause
exit