param(
[string]$path = "C:\Users\Public\Pictures\Sample Pictures\Penguins.jpg",
[int]$fw = 8,
[int]$fh = 12)
[System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") | Out-Null
$bmp = [System.Drawing.Bitmap]::FromFile($path);
$chars = @('#', '8', '0', 'V', '1', 'i', ':', '*', '|', '.', ' ');
for($sy = 0; $sy -lt $bmp.Height / $fh; $sy++)
{
for ($sx = 0; $sx -lt $bmp.Width / $fw; $sx++)
{
    [float]$tb = 0;
    for($fy = 0; $fy -lt $fh; $fy++)
    {
        for($fx = 0; $fx -lt $fw; $fx++)
        {
            $p = $bmp.GetPixel($sx * $fw + $fx, $sy * $fh + $fy);
            $tb += $p.GetBrightness();
        }
    }
    $idx = [int]($tb / ($fw * $fh) * $chars.Length);
    if($idx -eq $chars.Length)
    {
        $idx--;
    }
    Write-Host $chars[$idx] -NoNewline
}
Write-Host
}
$bmp.Dispose();
