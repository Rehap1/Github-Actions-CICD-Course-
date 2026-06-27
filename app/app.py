import json
import os
import socket
from http.server import BaseHTTPRequestHandler, HTTPServer


def env_flag_is_true(name, default="false"):
    value = os.getenv(name, default)
    return value.strip().lower() in {"1", "true", "yes", "on"}


def get_runtime_metadata():
    return {
        "environment": os.getenv("APP_ENV", "local"),
        "app_version": os.getenv("APP_VERSION", "dev"),
        "commit_sha": os.getenv("COMMIT_SHA", "unknown"),
        "deployed_at": os.getenv("DEPLOYED_AT", "unknown"),
        "image_tag": os.getenv("IMAGE_TAG", "unknown"),
        "deployment_mode": os.getenv("DEPLOY_MODE", "local-direct"),
        "force_unhealthy": env_flag_is_true("FORCE_UNHEALTHY"),
        "hostname": socket.gethostname(),
    }


def route_request(path):
    if path == "/health":
        if env_flag_is_true("FORCE_UNHEALTHY"):
            return 503, {"status": "unhealthy", "reason": "FORCE_UNHEALTHY is enabled"}
        return 200, {"status": "ok"}

    if path == "/version":
        metadata = get_runtime_metadata()
        return 200, {
            "app_version": metadata["app_version"],
            "commit_sha": metadata["commit_sha"],
            "image_tag": metadata["image_tag"],
        }

    if path == "/status":
        payload = {"status": "ok"}
        payload.update(get_runtime_metadata())
        return 200, payload

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
