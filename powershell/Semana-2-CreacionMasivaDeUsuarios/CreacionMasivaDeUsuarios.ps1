# Forma nativa de PowerShell para encontrar la carpeta del script
$rutaScript = $PSScriptRoot
$archivo = "$rutaScript\usuarios.txt"

# Verificación
if (Test-Path $archivo) {
    Write-Host "Archivo encontrado en: $archivo" -ForegroundColor Cyan
    $listaUsuarios = Get-Content $archivo
    
    foreach ($nombre in $listaUsuarios) {
        if (-not (Get-LocalUser -Name $nombre -ErrorAction SilentlyContinue)) {
            New-LocalUser -Name $nombre -NoPassword
            Write-Host "[OK] Usuario '$nombre' creado." -ForegroundColor Green
        } else {
            Write-Host "[!] El usuario '$nombre' ya existe." -ForegroundColor Yellow
        }
    }
} else {
    Write-Host "[ERROR] No se encuentra 'usuarios.txt' en la carpeta: $rutaScript" -ForegroundColor Red
}

Read-Host "`nPresiona Enter para finalizar"
