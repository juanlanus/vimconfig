# vimconfig
My (g)vim configuration

Yields a minimalistic window, with almost all the space devoted to 
text content. Like for example no menu bar.  
Also, it doesn't include a dazzling color scheme. 

## Installing

Clone the repo wherever it fits your directories organization.  
Then, set a symbolic link in your home directory pointing `.vim` to the repo, like for example
```
    ln -s ~/whatever/vimconfig .vim
```

At startup, vim will look for its configuratin files in this directory first.  

## Additional software

<b>tern</b>: (git submodule)  
Includes the tern autocompletion engine. 
<p>repo: <a href="https://github.com/ternjs/tern_for_vim">Tern for Vim</a> (<a href="http://ternjs.net/doc/manual.html#vim">docs</a>)</p>  
<pre>cd ~/.vim/bundle
git clone https://github.com/ternjs/tern_for_vim.git
npm install</pre>
<p>When the '<a href="http://vimdoc.sourceforge.net/htmldoc/options.html#%27completeopt%27">completeopt</a>'
(<code>cot</code>) option contains "menu" then matches for Insert mode
completion are displayed in a (rather primitive) popup menu. </p>
<p>Use CTRL-X CTRL-O in Insert mode to start the completion. </p>  

<b>vim-javascript</b>: (git submodule)  
The latest and greatest javascript configuraiton files. 

<b>ESLint</b>:  
An ES6 JS linter, that has to be installed using NPM.  
