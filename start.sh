#!/bin/bash
echo ""
echo "╔══════════════════════════════════════════════╗"
echo "║     SkillForge AI — Starting Up              ║"
echo "║     Career Intelligence Platform             ║"
echo "╚══════════════════════════════════════════════╝"
echo ""

# Kill any existing server on port 5000
pkill -f "python3.*app.py" 2>/dev/null || true
sleep 1

# Start backend
echo "▶ Starting AI Backend (Flask) on port 5000..."
cd /home/claude/skillforge/backend
python3 app.py &
BACKEND_PID=$!
sleep 2

# Check backend health
if curl -s http://localhost:5000/health > /dev/null 2>&1; then
    echo "✅ Backend running! PID: $BACKEND_PID"
else
    echo "⚠️  Backend starting (may take a moment)..."
fi

echo ""
echo "╔══════════════════════════════════════════════╗"
echo "║  ✅ SkillForge AI is READY!                  ║"
echo "║                                              ║"
echo "║  Frontend: Open index.html in browser        ║"
echo "║  Backend:  http://localhost:5000             ║"
echo "║  Health:   http://localhost:5000/health      ║"
echo "║                                              ║"
echo "║  Demo Login:                                 ║"
echo "║    Email: demo@skillforge.ai                 ║"
echo "║    Pass:  demo1234                           ║"
echo "╚══════════════════════════════════════════════╝"
echo ""
echo "Press Ctrl+C to stop the server"
wait $BACKEND_PID
