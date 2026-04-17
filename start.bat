@echo off
echo Starting SkillForge AI...
echo Installing dependencies...
pip install flask flask-cors PyPDF2 reportlab scikit-learn
echo Starting Backend...
start /b python skillforge_backend.py
echo.
echo ==========================================
echo SkillForge AI is ready!
echo.
echo URL: http://localhost:5000
echo Demo Email: demo@skillforge.ai
echo Demo Password: demo1234
echo ==========================================
echo Opening in browser...
start http://localhost:5000
pause
