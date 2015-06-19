Plugin Patches
==============

VIntSearch
----------
```diff
--- a/autoload/VIntSearch.vim
+++ b/autoload/VIntSearch.vim
@@ -433,6 +433,7 @@ function! s:GetRepoDirFrom(filepath)
                return ''
        endif
 python << EOF
+import os
 repodirs = vim.eval('g:vintsearch_repodirs')
 filepath = vim.eval('a:filepath')
 dir = os.path.dirname(filepath)
```


vim-cscope-utils
----------------
```diff
--- a/plugin/cscope_utils.vim
+++ b/plugin/cscope_utils.vim
@@ -77,7 +77,6 @@ vim.command('cs kill -1')
 ctags_db, _ = LocateIndexDatabaseFile(CTAGS_OUT)
 if ctags_db:
   vim.command('set tags+=%s' % ctags_db)
-  print 'Loaded ctags database.'
 
 # Load cscope index database.
 cscope_db, base_path = LocateIndexDatabaseFile(CSCOPE_OUT)
@@ -88,13 +87,11 @@ if cscope_db is None:
     base_path = ''
 if cscope_db:
   vim.command('cs add %s %s' % (cscope_db, base_path))
-  print 'Loaded cscope database.'
 
 # Load pycscope index database.
 pycscope_db, base_path = LocateIndexDatabaseFile(PYCSCOPE_OUT)
 if pycscope_db:
   vim.command('cs add %s %s' % (pycscope_db, base_path))
-  print 'Loaded pycscope database.'
 
 EOF
 endfunction
@@ -173,7 +170,7 @@ if os.path.exists(base_path):
     ctags_files = os.path.join(db_path, CTAGS_FILES)
     Spawn(ConstructFindArgs('.', ['*'], ctags_files, ignore_paths=ignore_paths),
           cwd=base_path)
-    Spawn(['ctags', '-L', '%s' % ctags_files, '--tag-relative=yes', '-f',
+    Spawn(['ctags', '-L', '%s' % ctags_files, '--tag-relative=yes', '--fields=+l', '-f',
           '%s' % os.path.join(db_path, CTAGS_OUT)],
           cwd=base_path)
   except CalledProcessError as e:
```
