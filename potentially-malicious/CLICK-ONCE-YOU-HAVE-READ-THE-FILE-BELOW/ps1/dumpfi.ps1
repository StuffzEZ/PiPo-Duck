Add-Type -AssemblyName System.Windows.Forms
$result = [System.Windows.Forms.MessageBox]::Show(
    'Warning: This will dump saved Wi-Fi passwords to the CIRCUITPY drive (D:). Continue?',
    'Warning',
    [System.Windows.Forms.MessageBoxButtons]::OKCancel,
    [System.Windows.Forms.MessageBoxIcon]::Warning
)

if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
    $timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
    $pcname = $env:COMPUTERNAME
    $outputPath = "D:\dumpfi\$timestamp-$pcname.dfi22"
    $profiles = netsh wlan show profiles
    foreach ($line in $profiles) {
        if ($line -match "All User Profile\s*:\s*(.+)") {
            $name = $matches[1].Trim()
            $details = netsh wlan show profile name="$name" key=clear
            $pw = ($details | Select-String "Key Content").ToString().Split(":")[1].Trim()
            if ($pw) {
                Add-Content -Path $outputPath -Value "$name : $pw"
            }
        }
    }
}
