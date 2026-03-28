#Semana-2: Creacion masiva de usuarios
$rutaScript = $PSScriptRoot

# Buscamos cualquier archivo que se llame usuarios (sea .txt o .csv)
$archivo = Get-ChildItem -Path $rutaScript -Filter "usuarios*" | Select-Object -First 1

if ($archivo) {
    Write-Host "[OK] Leyendo archivo: $($archivo.FullName)" -ForegroundColor Cyan
    $listaUsuarios = Get-Content $archivo.FullName
    
    foreach ($nombre in $listaUsuarios) {
        if (-not (Get-LocalUser -Name $nombre -ErrorAction SilentlyContinue)) {
            New-LocalUser -Name $nombre -NoPassword
            Write-Host "[OK] Usuario '$nombre' creado." -ForegroundColor Green
        } else {
            Write-Host "[!] El usuario '$nombre' ya existe." -ForegroundColor Yellow
        }
    }
} else {
    Write-Host "[ERROR] No hay ningún archivo que empiece por 'usuarios' en: $rutaScript" -ForegroundColor Red
}

Read-Host "`nPresiona Enter para finalizar"
