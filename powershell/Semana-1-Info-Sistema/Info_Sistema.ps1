#Script de la Semana 1
#Objetivo: Información del sistema, discos y usuarios [cite: 19, 22]

Clear-Host
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "   INFO DE SISTEMA" -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Yellow

# 1. Información del Equipo [cite: 22]
Write-Host "`n[+] INFORMACIÓN DEL EQUIPO:" -ForegroundColor Cyan
Get-CimInstance Win32_OperatingSystem | Select-Object CSName, Caption, Version | Format-Table

# 2. Espacio en Disco [cite: 22]
Write-Host "[+] ESPACIO EN DISCO:" -ForegroundColor Cyan
Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" | Select-Object DeviceID, @{Name="FreeGB";Expression={[math]::round($_.FreeSpace/1GB,2)}}, @{Name="SizeGB";Expression={[math]::round($_.Size/1GB,2)}} | Format-Table

# 3. Usuarios Locales [cite: 22]
Write-Host "[+] USUARIOS LOCALES:" -ForegroundColor Cyan
Get-LocalUser | Select-Object Name, Enabled, Description | Format-Table

# --- PAUSA FINAL CORREGIDA ---
Write-Host "`n==========================================" -ForegroundColor Yellow
Write-Host "Presiona cualquier tecla para cerrar esta ventana..." -ForegroundColor Yellow
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
