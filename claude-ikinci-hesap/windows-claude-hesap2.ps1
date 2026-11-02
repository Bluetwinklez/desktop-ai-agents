# 2. Claude hesabi icin ayri pencere (ayri oturum/veri klasoru)
$data = if ($env:CLAUDE_HESAP2_DIR) { $env:CLAUDE_HESAP2_DIR } else { Join-Path $env:USERPROFILE "claude-hesap2" }
New-Item -ItemType Directory -Force -Path $data | Out-Null

$exe = $null
foreach ($root in @("$env:LOCALAPPDATA\AnthropicClaude", "$env:LOCALAPPDATA\Programs\Claude", "$env:ProgramFiles\Claude")) {
  if (Test-Path $root) {
    $exe = Get-ChildItem $root -Recurse -Filter claude.exe -ErrorAction SilentlyContinue |
           Sort-Object LastWriteTime -Descending | Select-Object -First 1 -ExpandProperty FullName
    if ($exe) { break }
  }
}
if (-not $exe) {
  # Store (MSIX) surumu
  $pkg = Get-AppxPackage *Claude* -ErrorAction SilentlyContinue | Select-Object -First 1
  if ($pkg) { $exe = Join-Path $pkg.InstallLocation "app\Claude.exe" }
}
if (-not $exe -or -not (Test-Path $exe)) { Write-Host "claude.exe bulunamadi. Yolu elle ver: .\windows-claude-hesap2.ps1"; exit 1 }
Start-Process -FilePath $exe -ArgumentList "--user-data-dir=`"$data`""
