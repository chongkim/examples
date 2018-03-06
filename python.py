# """
# Example file for python.

# To run from command line:
#     python -m unittest python.py
#     python -m unittest python
#     python -m unittest python.MockTest
# """
from unittest import TestCase
from unittest.mock import Mock


class MockTest(TestCase):
    def test_mock_call_args(self):
        f = Mock()

        f('a', 'b', 'c', foo='bar')
        args, kwargs = f.call_args
        self.assertEqual(args, ('a', 'b', 'c'))
        self.assertEqual(kwargs, {'foo': 'bar'})


class ReTest(TestCase):
    def test_split(self):
        import re
        lst = re.split(r'-', 'a-b--c')
        self.assertEqual(lst, ['a', 'b', '', 'c'])
