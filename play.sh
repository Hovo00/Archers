#!/usr/bin/env bash
# Launches Mad Arrow in your browser via the bundled Ruffle web player.
set -e
cd "$(dirname "$0")"
cp -u mad-arrow.swf play/mad-arrow.swf
cd play
PORT=8743
( python3 -m http.server "$PORT" >/tmp/mad-arrow-server.log 2>&1 & echo $! > /tmp/mad-arrow-server.pid )
sleep 1
xdg-open "http://localhost:$PORT/" >/dev/null 2>&1 || firefox "http://localhost:$PORT/" >/dev/null 2>&1 &
echo "Mad Arrow is running at http://localhost:$PORT/"
echo "Server PID: $(cat /tmp/mad-arrow-server.pid). Stop it with: kill \$(cat /tmp/mad-arrow-server.pid)"
