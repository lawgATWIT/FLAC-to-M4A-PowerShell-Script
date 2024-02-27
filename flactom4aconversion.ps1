$flacFiles = Get-ChildItem -Filter *.flac

foreach ($file in $flacFiles) {
    $fileNameWithoutExtension = $file.BaseName
    
    $outputFileName = "$fileNameWithoutExtension.m4a"
    
    ffmpeg -i $file.FullName -c:a alac -vn -map_metadata 0 -map 0:a:0 $outputFileName
}
