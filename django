run test verbose

```bash
./manage.py test -v 2 app.tests.test_foo
```

make arbitrary sql calls
```python
from django.db import connection

with connection.cursor() as cursor():
    cursor.execute('select 1')
    if fetch_one_one:
        row = cursor.fetchone()  # fetch one record as list of values
    else:
        for row in cursor.fetchall():
            pass
```

Turn on debugging in the console:

```
import logging

logger = logging.getLogger('dbjango.db.backends')
logger.setLevel(logging.DEBUG)
logger.addHandler(Logging.StreamHandler())
```
