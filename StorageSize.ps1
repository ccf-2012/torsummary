# Run with PowerShell

$Drives = Get-PSDrive -PSProvider 'FileSystem' | Where-Object { $_.Name -ne 'C' }; # skip C drive
$sizeTable = [ordered]@{};

foreach($Drive in $drives) {
	Switch(Get-ChildItem -Path $Drive.Root -File -Recurse -Force -ErrorAction SilentlyContinue) {
        {$_.Name -match "[@-]\s?(Audies|ADE|ADWeb|ADAudio|ADeBook|ADMusic)" } { if ($sizeTable.Contains('Audiences')) { $sizeTable['Audiences'] += $_.Length; } else { $sizeTable['Audiences'] = $_.Length; } };
		{$_.Name -match "[@-]\s?(beAst)" } { if ($sizeTable.Contains('beAst')) { $sizeTable['beAst'] += $_.Length; } else { $sizeTable['beAst'] = $_.Length; } };
        {$_.Name -match "[@-]\s?(BeiTai)" } { if ($sizeTable.Contains('BeiTai')) { $sizeTable['BeiTai'] += $_.Length; } else { $sizeTable['BeiTai'] = $_.Length; } };
        {$_.Name -match "[@-]\s?(BTS)" } { if ($sizeTable.Contains('BTS')) { $sizeTable['BTS'] += $_.Length; } else { $sizeTable['BTS'] = $_.Length; } };
        {$_.Name -match "[@-]\s?(CHD|blucook|HQC|GBT|KAN|OneHD)" } { if ($sizeTable.Contains('CHD')) { $sizeTable['CHD'] += $_.Length; } else { $sizeTable['CHD'] = $_.Length; } };
        {$_.Name -match "[@-]\s?(Dream|DBTV|QHstudIo|HDo)" } { if ($sizeTable.Contains('DB')) { $sizeTable['DB'] += $_.Length; } else { $sizeTable['DB'] = $_.Length; } };
        {$_.Name -match "[@-]\s?(FRDS)" } { if ($sizeTable.Contains('FRDS')) { $sizeTable['FRDS'] += $_.Length; } else { $sizeTable['FRDS'] = $_.Length; } };
        {$_.Name -match "[@-]\s?(HDC)" } { if ($sizeTable.Contains('HDC')) { $sizeTable['HDC'] += $_.Length; } else { $sizeTable['HDC'] = $_.Length; } };
        {$_.Name -match "[@-]\s?(HDH)" } { if ($sizeTable.Contains('HDH')) { $sizeTable['HDH'] += $_.Length; } else { $sizeTable['HDH'] = $_.Length; } };
        {$_.Name -match "[@-]\s?(HDS)" } { if ($sizeTable.Contains('HDSky')) { $sizeTable['HDSky'] += $_.Length; } else { $sizeTable['HDSky'] = $_.Length; } };
        {$_.Name -match "[@-]\s?(LHD|LeagueHD|LeagueNF|LeagueTV|LeagueCD|LeagueWEB|i18n|CiNT)" } { if ($sizeTable.Contains('LemonHD')) { $sizeTable['LemonHD'] += $_.Length; } else { $sizeTable['LemonHD'] = $_.Length; } };
        {$_.Name -match "[@-]\s?(MTeam|MPAD|TnP)" } { if ($sizeTable.Contains('MT')) { $sizeTable['MT'] += $_.Length; } else { $sizeTable['MT'] = $_.Length; } };
        {$_.Name -match "[@-]\s?(Our|PbK|iLoveTV|FLTTH|Ao|MGs|HosT|iLoveHD)" } { if ($sizeTable.Contains('OB')) { $sizeTable['OB'] += $_.Length; } else { $sizeTable['OB'] = $_.Length; } };
        {$_.Name -match "[@-]\s?(PTer)" } { if ($sizeTable.Contains('PTer')) { $sizeTable['PTer'] += $_.Length; } else { $sizeTable['PTer'] = $_.Length; } };
        {$_.Name -match "[@-]\s?(PTH)" } { if ($sizeTable.Contains('PTH')) { $sizeTable['PTH'] += $_.Length; } else { $sizeTable['PTH'] = $_.Length; } };
        {$_.Name -match "[@-]\s?(PuTao)\b" } { if ($sizeTable.Contains('PuTao')) { $sizeTable['PuTao'] += $_.Length; } else { $sizeTable['PuTao'] = $_.Length; } };
        {$_.Name -match "[@-]\s?(CMCT)" } { if ($sizeTable.Contains('SSD')) { $sizeTable['SSD'] += $_.Length; } else { $sizeTable['SSD'] = $_.Length; } };
        {$_.Name -match "[@-]\s?(TJUPT)" } { if ($sizeTable.Contains('TJU')) { $sizeTable['TJU'] += $_.Length; } else { $sizeTable['TJU'] = $_.Length; } };
        {$_.Name -match "[@-]\s?(TLF)" } { if ($sizeTable.Contains('TLF')) { $sizeTable['TLF'] += $_.Length; } else { $sizeTable['TLF'] = $_.Length; } };
        {$_.Name -match "[@-]\s?(TTG|Wiki|NGB|DoA|ARiN|ExREN)" } { if ($sizeTable.Contains('TTG')) { $sizeTable['TTG'] += $_.Length; } else { $sizeTable['TTG'] = $_.Length; } };
        {$_.Name -match "[\[@-]\s?(U2)" } { if ($sizeTable.Contains('U2')) { $sizeTable['U2'] += $_.Length; } else { $sizeTable['U2'] = $_.Length; } };
        {$_.Name -match "[&@\[\-]\s?(VCB-S)" } { if ($sizeTable.Contains('VCB')) { $sizeTable['VCB'] += $_.Length; } else { $sizeTable['VCB'] = $_.Length; } };
    }
}

foreach($key in $sizeTable.keys)
{
    $totalSize = [Math]::Round(($sizeTable[$key]/1073741824),2);
    if ($totalSize -ne 0)
    {
        $message = '{0}: {1} GB' -f $key, $totalSize
        Write-Output $message
    }
}

"Any key to exit";
Read-Host | Out-Null;
Exit