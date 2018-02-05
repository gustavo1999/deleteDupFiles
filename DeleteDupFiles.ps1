# NAME: 
#    DeleteDuplicateFiles - Removes files having duplicate file names from the specified directory
#
#    Copyright 2015 Gustavo Lopez
#
# USAGE:
#    DeleteDuplicateFiles Directory Pattern1 Pattern2
# 
#    Directory - The parent directory from which duplicate files will be removed
#    Pattern1 - regular expression
#    Pattern2 - regular expression

# Example: deleteDuplicateFiles  -Directory "C:\Users\username\Documents" -Pattern1 "\(1\)" -Pattern2 "\(2\)" 
# would delete files in the currrent directory and its subdirectories 
# where the filename contains the string "(1)" or the string "(2)"
# numbers inside parenthesis are a common filename pattern that occurs in Windows operating systems when files are duplicates

Function DeleteDuplicateFiles($Directory,$Pattern1,$Pattern2){
    Foreach($File in Get-ChildItem $Directory -Force -Recurse)
    {
        IF ((($File.BaseName -match $Pattern1) -or ($File.BaseName -match $Pattern2)) -and (-Not($_.PSIsContainer))) {
            Write-Host "$("deleted: ")$($File.FullName)"
            Write-Host ""
            Remove-Item $File.FullName
        }
    }
}

