# Vimscript

> Thanks very much for writing what in my opinion is the
> finest text editor on the planet.  If I were to get another
> cat, I would name it "Vim". - [Bob
> Sheehan](https://vimhelp.org/quotes.txt.html)

---

## Assignment

```vim
let name = "Thomas Jefferson"
echo "Hello, " . name

" Global scope
let g:global_var = 'global'

" Local (to script) scope
let s:script_var = 'script'

" Local (to function) scope
let l:local_var = 'local'

" Window scope
let w:window_var = 'window'

" Buffer scope
let b:buffer_var = 'buffer'

" Tab scope
let t:tab_var = 'tab'
```

## Special Variables

```vim
" Interact with registers
let @/ = ''
echo @"

" Interact with environment variables
let @" = $SHELL
echo $PATH
```

## String Functions

```vim
tolower('HI') " => 'hi'
toupper('hi') " => 'HI'

strlen('hi') " => 2

split('one two three') " => ['one', 'two', 'three']
split('one.two.three', '.') " => ['one', 'two', 'three']

join(['a', 'b'], ',') " => 'a,b'
```

## Loops

```vim
" For loop
for s in list
  echo s
  continue  " jump to start of loop
  break     " breaks out of a loop
endfor

" While loop
while x < 5
  echo x
  x = x - 1
endwhile
```

## Execute `ex` Commands

```vim
execute "vsplit"
execute "e " . @"
```

## Execute `normal` Commands

```vim
normal G
normal! G   " skips key mappings

execute "normal! gg/foo\<cr>dd"
```

## Getting Filenames

```vim
echo expand("%") " path/file.txt
echo expand("%:t") " file.txt
echo expand("%:p:h") " /home/you/path/file.txt
echo expand("%:r") " path/file
echo expand("%:e") " txt
```

## Built-In Functions for Buffer Manipulation

```vim
echo getline(1) " => 'Contents of line 1'
echo getline(1, 2) " => ['Line 1', 'Line 2']

call setline(1, 'This is the first line')
```
