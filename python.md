```python
        f = Mock()

        f('a', 'b', 'c', foo='bar')
        args, kwargs = f.call_args
        # => args = ('a', 'b', 'c')
        # => kwargs = {'foo': 'bar'}
```


```python
        import re
        lst = re.split(r'-', 'a-b--c')
        assert lst == ['a', 'b', '', 'c']

        # match across lines
        s = 'hello\nthere'
        assert not re.match('hello.there', s)
        assert re.match('hello.there', s, re.DOTALL)

        s = '<a>foo</a>\n  xx <a>bar</a>'
        assert re.findall(r'<a>.*?</a>', s, re.DOTALL) == ['<a>foo</a>', '<a>bar</a>']

        # capturing group
        s = '<a>foo</a>\n  xx <a>bar</a>'
        assert re.findall(r'<a>(.*?)</a>', s, re.DOTALL == ['foo', 'bar']

        # noncapturing group
        s = '<a>foo</a>\n  xx <a>bar</a>'
        self.assertEqual(re.findall(r'<a>(?:.*?)</a>', s, re.DOTALL), ['<a>foo</a>', '<a>bar</a>'])
```


```python
# check if path exists
import os
self.assertFalse(os.path.exists('/this-does-not-exists'))
```


```python
# print args
for arg in sys.argv:
    print(arg)
```


```python
# read file line by line
with open("file.txt", "r") as f:
    for line in f:
        pass
```


```python
# load module in repl
from importlib import reload

reload(mymodule)
```

```python
# zerofill a number as string
assert str(12).zfill(3) == "012"
```
