Help for options
```
        help 'fo'
        h 'fo'
```

edit register
```
        :let @q='<c-r><c-r>q'
```
set colorcolumn
```
        :set colorcolumn=80,100
        :let &colorcolumn=join(range(80,100),',')
```


show where the option is set
```
        :verbose set tw?
```

set different diff algorithm
```
:set diffopt=algorithm:patience
```
