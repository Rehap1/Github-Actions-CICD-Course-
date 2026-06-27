import unittest
from unittest.mock import patch

from app.app import route_request


class RouteRequestTests(unittest.TestCase):
    def test_health_route_returns_200(self):
        status_code, _ = route_request("/health")
        self.assertEqual(status_code, 200)

    def test_health_route_returns_ok_payload(self):
        _, payload = route_request("/health")
        self.assertEqual(payload, {"status": "ok"})

    def test_health_route_can_be_forced_unhealthy(self):
        with patch.dict("os.environ", {"FORCE_UNHEALTHY": "true"}, clear=False):
            status_code, payload = route_request("/health")

        self.assertEqual(status_code, 503)
        self.assertEqual(
            payload,
            {"status": "unhealthy", "reason": "FORCE_UNHEALTHY is enabled"},
        )

    def test_version_route_returns_visible_build_metadata(self):
        with patch.dict(
            "os.environ",
            {
                "APP_VERSION": "2026-04-14-123456789",
                "COMMIT_SHA": "abc1234",
                "IMAGE_TAG": "2026-04-14-123456789",
            },
            clear=False,
        ):
            status_code, payload = route_request("/version")

        self.assertEqual(status_code, 200)
        self.assertEqual(
            payload,
            {
                "app_version": "2026-04-14-123456789",
                "commit_sha": "abc1234",
                "image_tag": "2026-04-14-123456789",
            },
        )

    def test_status_route_returns_runtime_metadata(self):
        with patch.dict(
            "os.environ",
            {
                "APP_ENV": "assessment",
                "APP_VERSION": "2026-04-14-123456789",
                "COMMIT_SHA": "abc1234",
                "DEPLOYED_AT": "2026-04-14T10:15:00Z",
                "IMAGE_TAG": "2026-04-14-123456789",
                "DEPLOY_MODE": "vm-docker-ssh",
            },
            clear=False,
        ):
            status_code, payload = route_request("/status")

        self.assertEqual(status_code, 200)
        self.assertEqual(payload["status"], "ok")
        self.assertEqual(payload["environment"], "assessment")
        self.assertEqual(payload["app_version"], "2026-04-14-123456789")
        self.assertEqual(payload["commit_sha"], "abc1234")
        self.assertEqual(payload["deployed_at"], "2026-04-14T10:15:00Z")
        self.assertEqual(payload["image_tag"], "2026-04-14-123456789")
        self.assertEqual(payload["deployment_mode"], "vm-docker-ssh")
        self.assertEqual(payload["force_unhealthy"], False)
        self.assertTrue(payload["hostname"])


if __name__ == "__main__":
    unittest.main()
