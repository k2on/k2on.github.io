@echo off & setLocal EnableDelayedExpansion
: Variables
set AUTH_LEVEL=0
set SHELL=BATCH
set USER=%username%
set func=
set errMsg=
set exit=0
set authStatus=0
set RESET=[0m
set BLACK=[30m
set RED=[31m
set GREEN=[32m
set YELLOW=[33m
set BLUE=[34m
set MAGENTA=[35m
set CYAN=[36m
set GREY=[37m
set DARK_GREY=[90m
set BRIGHT_RED=[91m
set BRIGHT_GREEN=[92m
set BRIGHT_YELLOW=[93m
set BRIGHT_BLUE=[94m
set BRIGHT_PURPLE=[95m
set BRIGHT_CYAN=[96m
set WHITE=[97m
set BG_BLACK=[40m
set BG_RED=[41m
set BG_GREEN=[42m
set BG_YELLOW=[43m
set BG_BLUE=[44m
set BG_MAGENTA=[45m
set BG_CYAN=[46m
set BG_GREY=[47m
set BG_DARK_GREY=[100m
set BG_BRIGHT_RED=[101m
set BG_BRIGHT_GREEN=[102m
set BG_BRIGHT_YELLOW=[103m
set BG_BRIGHT_BLUE=[104m
set BG_BRIGHT_PURPLE=[105m
set BG_BRIGHT_CYAN=[106m
set BG_WHITE=[107m
: The error function.
:func_error
if NOT "%func%" == "error" goto end_func_error
echo %RED%Error: %~1 %RESET%
exit /b
:end_func_error
: Show console colors.
:func_colors
if NOT "%func%" == "colors" goto end_func_colors
echo Colors
exit /b
:end_func_colors
: Process a main command.
:func_process_main
if NOT "%func%" == "process_main" goto end_func_process_main
set valid_command=0
: Show console colors.

if "%1" == "colors" (
    set valid_command=1


    colors
)
: Setup a new computer.

if "%1" == "setup" (
    set valid_command=1


    set errMsg=The 'setup' command is not supported for Windows.
    set func=error
        call :func_error "The 'setup' command is not supported for Windows."
    
)
: Sync apps with Brew bundle

if "%1" == "appsync" (
    set valid_command=1


    set errMsg=The 'appsync' command is not supported for Windows.
    set func=error
        call :func_error "The 'appsync' command is not supported for Windows."
    
)
: Pull changes from dotfiles repo

if "%1" == "dtpull" (
    set valid_command=1


    set errMsg=The 'dtpull' command is not supported for Windows.
    set func=error
        call :func_error "The 'dtpull' command is not supported for Windows."
    
)
: Push changes from dotfiles repo

if "%1" == "dtpush" (
    set valid_command=1


    set errMsg=The 'dtpush' command is not supported for Windows.
    set func=error
        call :func_error "The 'dtpush' command is not supported for Windows."
    
)
: Show a peen.
set is_command_peen=0
if "%1" == "peen" set is_command_peen=1
if "%1" == "penis" set is_command_peen=1

if "%is_command_peen%" == "1" (
    set valid_command=1


    set errMsg=The 'peen' command is not supported for Windows.
    set func=error
        call :func_error "The 'peen' command is not supported for Windows."
    
)
: Authenticate to an access level.

if "%1" == "auth" (
    set valid_command=1

: Argument validation.
set level=%1
if "%level%" == "" (
    set level=NO_INPUT
set /p level=%BRIGHT_GREEN%?%WHITE% Level %BRIGHT_CYAN%
echo %RESET%

)


if "!level!" LSS "1" (
    set errMsg=Arg 'level' must be at least 1
set func=error
    call :func_error "Arg 'level' must be at least 1"

    exit /b
)


if "!level!" GEQ "-Infinity" (
    set errMsg=Arg 'level' must be less than -Infinity
set func=error
    call :func_error "Arg 'level' must be less than -Infinity"

    exit /b
)


    set func=auth_!level!
    call :func_auth_!level!
)
: Clear the screen.
set is_command_clear=0
if "%1" == "clear" set is_command_clear=1
if "%1" == "cls" set is_command_clear=1
if "%1" == "c" set is_command_clear=1

if "%is_command_clear%" == "1" (
    set valid_command=1


    set func=main
        call :func_main 
    
)
: Exit the CLI.
set is_command_exit=0
if "%1" == "exit" set is_command_exit=1
if "%1" == "ex" set is_command_exit=1
if "%1" == "e" set is_command_exit=1

if "%is_command_exit%" == "1" (
    set valid_command=1


    echo %RED%Exiting...%RESET%
    set exit=1
)
: Show all the commands for the main menu.
set is_command_help=0
if "%1" == "help" set is_command_help=1
if "%1" == "?" set is_command_help=1
if "%1" == "h" set is_command_help=1

if "%is_command_help%" == "1" (
    set valid_command=1


    echo Showing commands for the main menu.
echo.
echo colors         %CYAN%Show console colors.%RESET%
echo auth ^<level^>   %CYAN%Authenticate to an access level.%RESET%
echo clear^|cls^|c    %CYAN%Clear the screen.%RESET%
echo exit^|ex^|e      %CYAN%Exit the CLI.%RESET%
echo help^|?^|h       %CYAN%Show all the commands for the main menu.%RESET%
echo.
)
if NOT "%valid_command%" == "1" (
set errMsg="%1" is not a valid command.
set func=error
    call :func_error ""%1" is not a valid command."

)
exit /b
:end_func_process_main
: Create the main prompt.
:func_prompt_main
if NOT "%func%" == "prompt_main" goto end_func_prompt_main
set input=NO_INPUT
set /p input=%RED%%USER%^>%RESET%
echo %RESET%

if "%input%" == "NO_INPUT" goto end_switch
set func=process_main
    call :func_process_main %input%

:end_switch
if "%exit%" == "0" (
set func=prompt_main
    call :func_prompt_main 

)
exit /b

exit /b
:end_func_prompt_main
: The main menu.
:func_main
if NOT "%func%" == "main" goto end_func_main

cls

echo %BG_DARK_GREY%User: %USER% ^| Time: %TIME%%RESET%
echo.

echo %BRIGHT_RED% ######    ######    ##################    ##################    #####        #####
echo %BRIGHT_YELLOW% ######   ######     ##################    ##################    ########     #####
echo %BRIGHT_GREEN% ######  ######      ##################    #####        #####    ##########   #####
echo %BRIGHT_CYAN% ############                              #####        #####    ############ #####
echo %BRIGHT_BLUE% ############                              #####        #####    ##### ############
echo %BRIGHT_PURPLE% ######  ######      ##################    #####        #####    #####   ##########
echo %BRIGHT_PURPLE% ######   ######     ##################    ##################    #####      #######
echo %BRIGHT_PURPLE% ######    ######    ##################    ##################    #####        #####
echo %RESET%

set func=prompt_main
    call :func_prompt_main 


exit /b
:end_func_main
if NOT "%c%" == "" (
set parts=%c%
set func=process_main
    call :func_process_main %parts%

pause
exit
)
set func=main
    call :func_main 
:cleanup
cls
