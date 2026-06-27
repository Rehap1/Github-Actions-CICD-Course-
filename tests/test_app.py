import unittest

from app.app import route_request


class RouteRequestTests(unittest.TestCase):
    def test_health_route_returns_200(self):
        status_code, _ = route_request("/health")
        self.assertEqual(status_code, 200)

    def test_health_route_returns_ok_payload(self):
        _, payload = route_request("/health")
        self.assertEqual(payload, {"status": "ok"})


if __name__ == "__main__":
    unittest.main()
