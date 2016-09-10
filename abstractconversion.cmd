@echo off

rem The purpose of this batch script is to automate abstract conversions
rem for all of the files in the Project Directory. 
rem If you would like to convert a limited range of files in a list,
rem please see abstractConvLimitrange.cmd
rem Give the variable newFolder a new name if you would like,
rem for example, AbstractNoAuthorsforReview,
rem and run the script from the root of project.

rem Create variable newFolder.

    set newFolder=AbstractNoAuthor

rem Make 2 directories.

    mkdir Submission\%newFolder%\
    mkdir Submission\out\%newFolder%\
   
rem While there are Word docs in the root, iterate through them.
rem mv Word docs to Submission\newFolder

    for %%f in (*.docx) do move %%f Submission\%newFolder%\ & echo %%f moved to Submission\%newFolder%\  

rem iterate through .txt docs in original\*.txt and copy them to current(root) directory
rem copy /v /y Original\*.txt 

    for %%f in (Original\*.txt) do copy /v /y %%f . & echo %%f copied to Project Root