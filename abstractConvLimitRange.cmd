@echo off
rem The purpose of this batch script is to automate abstract conversions
rem for a limited range of files in the Project Directory. 
rem If you would like to convert all of files in the project directory,
rem please see abstractConversion.cmd
rem To run the script set the following 3 variables:
    rem suffixLeast is the lowest numbered file in range. For example:
    rem If the file name is AUA2016-000015.docx, set suffixLeast=000015
    rem suffixMost is the highest numbered file in range
    rem newFolder is the new folder to be created for the conversions. 
    rem For example, newFolder might be AbstractNoAuthorsforReview 

    set suffixLeast=000120
    set suffixMost=000125
    set newFolder=AbstractNoAuthor

rem Make 2 directories.

    mkdir Submission\%newFolder%\
    mkdir Submission\out\%newFolder%\

rem Convert to decimal number

    set /a suffixLeastDec=1%suffixLeast% %% 100000
    set /a suffixMostDec=1%suffixMost% %% 100000

    setlocal enabledelayedexpansion

rem For each .docx file in the root
rem Parse the file number from the filename, convert to decimal number
rem Move all the .docx in the set range to Submission\newFolder

    for %%f in (*.docx) do (
        set filename=%%~nf & set filesuffix=!filename:~-6! & set /a filesuffixDec=1!filesuffix! %% 100000
        if !filesuffixDec! geq %suffixLeastDec% (
            if !filesuffixDec! leq %suffixMostDec% ( 
                move %%f Submission\%newFolder%\ 
                echo %%f moved to Submission\%newFolder%\        
            )
        )
     )

rem For each .txt file in the root
rem Parse the file number from the filename, convert to decimal number
rem Copy all the .txt in the set range to the root directory and state the move(add condition of success?)

    for %%f in (Original\*.txt) do (
        set filename=%%~nf & set filesuffix=!filename:~-6! & set /a filesuffixDec=1!filesuffix! %% 100000
        if !filesuffixDec! geq %suffixLeastDec% (
            if !filesuffixDec! leq %suffixMostDec% ( 
                copy /v /y %%f .
                echo %%f copied to Project Root
            )
        )
    )