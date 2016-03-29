Function DeleteDupFiles($Directory,$Pattern1,$Pattern2){
    Foreach($File in Get-ChildItem $Directory -Force -Recurse)
    {
        IF ((($File.BaseName -match $Pattern1) -or ($File.BaseName -match $Pattern2)) -and (-Not($_.PSIsContainer))) {
            Write-Host "$("deleted: ")$($File.FullName)"
            Write-Host ""
            Remove-Item $File.FullName
        }
    }
}

#Example Usage
#Be careful when using this commmand, if you don't know what you are doing 
#you may inadvertently delete file you did not intend to delete
#the command below will delete files where the filename contains the string "(1)" or the string "(2)"
#which is a common filename pattern that occurs in Windows operating systems when files are duplicates
#obviously this is a (perhaps too) simplistic approach
#another approach might compare filesizes, etc.
#deleteDupFiles  -Directory "C:\Users\username\Documents" -Pattern1 "\(1\)" -Pattern2 "\(2\)" 