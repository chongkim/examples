from unittest import TestCase
from unittest.mock import Mock


class MockTest(TestCase):
    def test_mock_call_args(self):
        f = Mock()

        f('a', 'b', 'c', foo='bar')
        args, kwargs = f.call_args
        self.assertEqual(args, ('a', 'b', 'c'))
        self.assertEqual(kwargs, {'foo': 'bar'})
