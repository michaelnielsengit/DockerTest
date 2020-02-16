@Echo off
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\VMSMP\Parameters\SwitchList" /f
echo Attempted to delete viartual switch registry entry, see the line above for the status. If successful, now restart your PC
pause