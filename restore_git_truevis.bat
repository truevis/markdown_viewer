@echo off
setlocal enabledelayedexpansion

:: restore_git_truevis.bat - Restore .git folder for a truevis repository
:: Usage: restore_git_truevis.bat <repo_name>
:: Example: restore_git_truevis.bat bse-document_analysis

if "%~1"=="" (
    echo.
    echo ERROR: Repository name not provided.
    echo.
    echo Usage: restore_git_truevis.bat ^<repo_name^>
    echo.
    echo Example: restore_git_truevis.bat bse-document_analysis
    echo.
    echo This script restores the .git folder for a specified repository
    echo located in C:\GitHub\ and owned by truevis on GitHub.
    echo.
    exit /b 1
)

set "REPO_NAME=%~1"
set "GITHUB_URL=https://github.com/truevis/%REPO_NAME%"
set "LOCAL_FOLDER=C:\GitHub\%REPO_NAME%"

echo.
echo ========================================
echo Git Restoration Script for Truevis Repos
echo ========================================
echo.
echo      Repository Name: %REPO_NAME%
echo         GitHub URL: %GITHUB_URL%
echo       Local Folder: %LOCAL_FOLDER%
echo.
echo ========================================
echo.

:: Check if local folder exists
echo Verifying local folder exists: "%LOCAL_FOLDER%"
if not exist "%LOCAL_FOLDER%" (
    echo ERROR: Local folder does not exist.
    exit /b 1
)
echo OK: Local folder found.
echo.

:: Navigate to local folder
echo Navigating to local folder...
echo   ^> cd /d "%LOCAL_FOLDER%"
cd /d "%LOCAL_FOLDER%" || (
    echo ERROR: Cannot navigate to "%LOCAL_FOLDER%"
    exit /b 1
)
echo OK: Current directory is now "%CD%"
echo.

:: Check if .git folder already exists and remove it
echo Checking for existing .git directory...
if exist ".git" (
    echo WARNING: .git folder already exists. Removing it to reinitialize.
    echo   ^> rmdir /s /q ".git"
    rmdir /s /q ".git"
    if errorlevel 1 (
        echo ERROR: Failed to remove existing .git directory.
        exit /b 1
    )
    echo OK: Existing .git folder removed.
) else (
    echo INFO: No existing .git folder found.
)
echo.

:: Initialize git repository
echo Initializing git repository...
echo   ^> git init
git init
if errorlevel 1 (
    echo ERROR: Failed to initialize git repository.
    exit /b 1
)
echo OK: Git repository initialized.
echo.

:: Add remote origin
echo Adding remote origin...
echo   ^> git remote add origin "%GITHUB_URL%"
git remote add origin "%GITHUB_URL%"
if errorlevel 1 (
    echo INFO: git remote add failed. Trying to set-url instead.
    echo   ^> git remote set-url origin "%GITHUB_URL%"
    git remote set-url origin "%GITHUB_URL%"
    if errorlevel 1 (
        echo ERROR: Failed to add or set remote origin URL.
        exit /b 1
    )
)
echo OK: Remote origin set to "%GITHUB_URL%".
echo.

:: Fetch from GitHub
echo Fetching from GitHub...
echo   ^> git fetch origin
git fetch origin
if errorlevel 1 (
    echo ERROR: Failed to fetch from GitHub. Please check:
    echo   - GitHub URL is correct: %GITHUB_URL%
    echo   - You have access to the repository
    echo   - Internet connection is working
    exit /b 1
)
echo OK: Fetch successful.
echo.

:: Add all local files
echo Adding local files to staging...
echo   ^> git add .
git add .
if errorlevel 1 (
    echo ERROR: Failed to add local files to staging.
    exit /b 1
)
echo OK: All local files added to staging area.
echo.

:: Check if there are files to commit
echo Committing local changes if any...
git diff --cached --quiet
if errorlevel 1 (
    echo INFO: Staged changes detected. Committing...
    echo   ^> git commit -m "Local changes - automated restore"
    git commit -m "Local changes - automated restore"
    if errorlevel 1 (
        echo ERROR: Failed to commit local changes.
        exit /b 1
    )
    echo OK: Local changes committed.
    
    echo.
    echo Handling branch name...
    for /f %%i in ('git rev-parse --abbrev-ref HEAD') do set "CURRENT_BRANCH=%%i"
    
    if /i "!CURRENT_BRANCH!"=="master" (
        echo INFO: Current branch is master. Renaming to main.
        echo   ^> git branch -m master main
        git branch -m master main
        if errorlevel 1 (
            echo ERROR: Failed to rename master to main.
            exit /b 1
        )
        echo OK: Branch renamed to main.
    ) else (
        echo INFO: Current branch is !CURRENT_BRANCH!. No rename needed.
    )
    
    echo.
    echo Setting up branch tracking...
    echo   ^> git branch --set-upstream-to=origin/main main
    git branch --set-upstream-to=origin/main main
    if errorlevel 1 (
        echo WARNING: Failed to set upstream branch. This may be expected.
    ) else (
        echo OK: Branch main is now tracking origin/main.
    )
    
    echo.
    echo Pushing local changes to GitHub as priority...
    echo INFO: Force pushing local repository to make it the authoritative version.
    echo   ^> git push --force origin main
    git push --force origin main
    if errorlevel 1 (
        echo ERROR: Failed to push changes to GitHub.
        exit /b 1
    )
    echo OK: Local repository successfully pushed as priority to GitHub.
) else (
    echo.
    echo INFO: No local changes to commit.
    echo Checking out remote main branch...
    echo   ^> git checkout main
    git checkout main
    if errorlevel 1 (
        echo ERROR: Could not check out main branch.
        exit /b 1
    )
    echo OK: Switched to branch main.
)

echo.
echo ========================================
echo Git Restoration Complete!
echo ========================================
echo.
echo Final git status:
git status
echo.
echo Repository successfully restored and synchronized.
echo.
