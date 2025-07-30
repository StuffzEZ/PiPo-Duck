import os
import socketpool
import wifi
import storage
import microcontroller
from duck import exe
from adafruit_httpserver import Server, Request, JSONResponse, POST, Response, GET

# Wi-Fi AP credentials
ssid = "PiPo_Ducky"
password = "ppod_430d"

print("Creating access point", ssid)
wifi.radio.stop_station()
wifi.radio.start_ap(ssid, password)
print("Access point created!")

pool = socketpool.SocketPool(wifi.radio)
server = Server(pool, "/static", debug=True)

# USB mass storage toggle
usb_enabled = True

def disable_usb_drive():
    storage.disable_usb_drive()
    print("USB Drive Disabled")

def enable_usb_drive():
    storage.enable_usb_drive()
    print("USB Drive Enabled")

# Serve the HTML frontend
@server.route("/")
def base(request: Request):
    with open("index.html", "r") as file:
        html_content = file.read()
    headers = {"Content-Type": "text/html"}
    return Response(request, html_content, headers=headers)

# Execute ducky script received from frontend
@server.route("/api", POST, append_slash=True)
def api(request: Request):
    req = request.json()
    payload = req["content"]
    payload = payload.splitlines()
    exe(payload)
    return JSONResponse(request, {"message": "Done"})

# List .picods files from local /scripts folder
@server.route("/scripts", GET)
def list_scripts(request: Request):
    try:
        files = [f for f in os.listdir("/scripts") if f.endswith(".picods")]
        return JSONResponse(request, {"scripts": files})
    except Exception as e:
        return JSONResponse(request, {"error": str(e)}, status=500)

# Return content of selected .picods script
@server.route("/scripts/<filename>", GET)
def get_script(request: Request, filename: str):
    try:
        if ".." in filename or not filename.endswith(".picods"):
            return JSONResponse(request, {"error": "Invalid filename"}, status=400)
        with open(f"/scripts/{filename}", "r") as file:
            content = file.read()
        return Response(request, content, headers={"Content-Type": "text/plain"})
    except Exception as e:
        return JSONResponse(request, {"error": str(e)}, status=500)

# Optional USB mass storage toggle (currently unused in frontend)
@server.route("/toggle_usb", POST)
def toggle_usb(request: Request):
    global usb_enabled
    try:
        if usb_enabled:
            disable_usb_drive()
            usb_enabled = False
            return JSONResponse(request, {"status": "disabled"})
        else:
            enable_usb_drive()
            usb_enabled = True
            return JSONResponse(request, {"status": "enabled"})
    except Exception as e:
        return JSONResponse(request, {"error": str(e)}, status=500)

# Start server
server.serve_forever("192.168.4.1", 80)