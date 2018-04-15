" This is a comment
echo 'foo' | " nned to start a new command to  inline comment otherwise it thinks it's a string
echo "foo" | " You can run it as :echo 'foo'

echo &sw | "shows the value of sw option

function! Foo(arg)  " needs to start with a capital letter
  echo a:arg
endfunction

call Foo(hello)

function! Foo(arg)
  return a:arg
endfunction

echo Foo('hello')

echo type('x') == v:t_string
help type() " for more info

" .* maximum expansion
echo substitute('foo(x) bar(x2)', '(.*)', '-', '')
"=> foo-

" .{-} minimal expansion
echo substitute('foo(x) bar(x2)', '(.\{-\})', '-', '')
"=> foo- bar(x2)
