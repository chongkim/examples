# """
# Example file for python.

# To run from command line:
#     python -m unittest python.py
#     python -m unittest python
#     python -m unittest python.MockTest
# """
import re
from unittest import TestCase, main
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
        lst = re.split(r'-', 'a-b--c')
        self.assertEqual(lst, ['a', 'b', '', 'c'])

    def test_dotall(self):
        s = 'hello\nthere'
        self.assertFalse(re.match('hello.there', s))
        self.assertTrue(re.match('hello.there', s, re.DOTALL))

    def test_findall(self):
        s = '<a>foo</a>\n  xx <a>bar</a>'
        self.assertEqual(re.findall(r'<a>.*?</a>', s, re.DOTALL), ['<a>foo</a>', '<a>bar</a>'])

    def test_capturing_group(self):
        s = '<a>foo</a>\n  xx <a>bar</a>'
        self.assertEqual(re.findall(r'<a>(.*?)</a>', s, re.DOTALL), ['foo', 'bar'])

    def test_noncapturing_group(self):
        s = '<a>foo</a>\n  xx <a>bar</a>'
        self.assertEqual(re.findall(r'<a>(?:.*?)</a>', s, re.DOTALL), ['<a>foo</a>', '<a>bar</a>'])


if __name__ == '__main__':
    main()
