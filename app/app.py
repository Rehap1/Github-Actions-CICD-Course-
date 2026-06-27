import json
from http.server import BaseHTTPRequestHandler, HTTPServer


def route_request(path):
    if path == "/health":
        return 200, {"status": "ok"}

    return 404, {"error": "not found"}


class AppHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        status_code, payload = route_request(self.path)
        body = json.dumps(payload).encode("utf-8")

        self.send_response(status_code)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)

    def log_message(self, format, *args):
        return


def run():
    server = HTTPServer(("0.0.0.0", 8000), AppHandler)
    print("Server running on http://0.0.0.0:8000")
    server.serve_forever()


if __name__ == "__main__":
    run()
