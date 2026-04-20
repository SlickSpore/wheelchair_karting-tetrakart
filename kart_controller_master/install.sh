echo "===   ©   Wheelchair Karting® 2026     ==="
echo " *                                       *"
echo " *     DeltaKart Firmware Installer      *"
echo " *                                       *"
echo "====== Written by Ettore Caccioli ========"
echo "\n[+] Generating/Updating Startup File"

SERVICE_NAME="Wheelchair Karting® Delta Kart Core's Service"
CWD=$(pwd)
TARGET=gunicorn -c web/gunicorn_config.py web.app:app -w 1 -b 0.0.0.0:8000

SERVICE_PATH="/etc/systemd/system/kart.service"
SERVICE_FILE="[Unit]\nDescription=$SERVICE_NAME\nAfter=network.target\n\n[Service]\nExecStart=$TARGET\nRestart=always\nUser=root\nGroup=root\nWorkingDirectory=$CWD\nStandardOutput=journal\nStandardError=journal\n\n[Install]\nWantedBy=multi-user.target\n"

echo $SERVICE_FILE > $SERVICE_PATH
echo "[+] Install Process Done!"