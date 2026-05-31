@echo off
echo.
echo ========================================
echo Hospital Appointment System Setup
echo ========================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Python is not installed or not in PATH
    pause
    exit /b 1
)

echo Installing dependencies...
pip install -r requirements.txt

if %errorlevel% neq 0 (
    echo Error: Failed to install dependencies
    pause
    exit /b 1
)

echo.
echo Running database migrations...
python manage.py migrate

if %errorlevel% neq 0 (
    echo Error: Database migration failed
    pause
    exit /b 1
)

echo.
echo ========================================
echo Setup Complete!
echo ========================================
echo.
echo Next steps:
echo 1. Create a superuser account:
echo    python manage.py createsuperuser
echo.
echo 2. Create doctor specializations:
echo    python manage.py shell
echo    (Copy-paste the commands from the shell)
echo.
echo 3. Run the development server:
echo    python manage.py runserver
echo.
echo 4. Open your browser:
echo    http://localhost:8000
echo.
pause
