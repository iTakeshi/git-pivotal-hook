git-pivotal-hook
=================

automatically add pivotal ticket numbers and pivotal commands to git commit message

### Dependencies
* Git
* Curl
* Ruby

### Install
```sh
curl -L https://raw.githubusercontent.com/iTakeshi/git-pivotal-hook/master/install.sh \
        | bash -s /path/to/project/root
```

You must specify the project root (which containes `.git` directory) as an argument of the script.

This install script will do 3 things:
* add blank file named `.pivotal_ticket_id` on your project root
* ignore the file by appending the filename into `.git/info/exclude`
* install `commit-msg` hook script in `.git/hooks`

### Usage
List ticket ids relating your work in `.pivotal_ticket_id` (one id in a line).
When you execute `git commit`, the hook script automatically append 
`[#1234567 #1234568]` to the commit message.

You can modify the appended string by some special commands specified in original
commit message.

#### add pivotal verbs
When you commit by executing `git commit -m 'foobar [fix]'`, the hook add the 
verb before the ticket ids like `[fix #1234567 #1234568]`. When the commit is
done, the brackets and the command (`[fix]` for this case) is deleted from the
commit message. Legal verbs: `fix`, `complete`, `finish`, `deliver`.

#### specify ids
When you commit by executing `git commit -m 'foobar [1111111]'`, the hook use the
number as the ticket id, then `[#1111111]` will be appended.
Just same as previous case, `[1111111]` in the original commit message will be deleted.
You can specify multiple ticket ids separated by white spaces.

#### both of them
You can do like that: `git commit -m 'foobar [fix 1111111 1111112]'`

### Author
iTakeshi

### License
```
The MIT License (MIT)
Copyright (c) 2016 iTakeshi

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

