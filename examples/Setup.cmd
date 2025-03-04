@echo off

@python --version 2>&1 | findstr " 3.12"
if %ERRORLEVEL% NEQ 0 (
  @echo Pre-requisites:
  @echo Python 3.12.x from https://www.python.org
  @echo Use pyenv to manage multiple Python versions
  goto error_exit
)

@echo Creating a Python virtual environment
call Python -m venv .venv
if %ERRORLEVEL% NEQ 0 (
  @echo There was an error when creating a Python virtual environment.
  goto error_exit
)

@echo Activating the virtual environment
Set-ExecutionPolicy RemoteSigned
call .venv\Scripts\activate

@echo Installing dependencies...
pip install -r requirements.txt

:error_exit
