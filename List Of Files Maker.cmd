@echo OFF
SETLOCAL

:DropFolder1
ECHO Drag and drop the Folder from which you would like to make a list of names of the files inside it
SET /p Folder1= 
IF '%Folder1%' == '' ( 
	ECHO You entered an empty message, so please
	goto DropFolder1
)

REM if folder wrapped with " than removes them
IF '^%Folder1:~0,1%' == '^"' ( 
	ECHO It Starts with "
	SET Folder1=%Folder1:~1,-1%
)

REM Create an empty File
echo. 2> "%~dp0List.txt"

echo.
echo I am working on it, just give a sec...
echo.

SET /A nbrElements=0
setlocal ENABLEDELAYEDEXPANSION
FOR %%f IN ("%Folder1%\*") DO (
	SET /A nbrElements=nbrElements+1
	echo !nbrElements!- %%~nf >> "%~dp0List.txt"
)

ECHO Done :)
ECHO You can check the List.txt file next to the program
ECHO Copyrights - Sergio Wehbe
pause