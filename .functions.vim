" Copies the OpenGrok URL for the current line to your clipboard
" Usage: Xrog [version=xr-dev]
" Argument: The XR version; defaults to xr-dev
" Note:
" You *must* be in a valid XR workspace located 3 levels from / (root)
" For example: /nobackup/aksiksi/my_workspace
function! s:xr_opengrok(...)
   if a:0 == 0
       let l:opengrok_url = 'http://wwwin-opengrok.cisco.com/xr-dev/xref/' 
   elseif a:0 == 1
       let l:opengrok_url = 'http://wwwin-opengrok.cisco.com/' . a:1 . '/xref/' 
   else
       echo 'Usage: Xrog [version=xr-dev]'
       return 0
   endif
   
   let l:path_list = split(expand('%:p'), '/')
   
   " File probably not in an XR repo
   if len(path_list) <= 3
       echo 'Path too short; are you in an XR workspace?'
       return 0
   endif

   " Extract relevant portion of path
   let l:extracted = path_list[3:]

   " Copy full OpenGrok URL to clipboard
   let l:full_url = opengrok_url . join(extracted, '/') . '#' . line('.')
   let @+ = full_url

endfunction 

command! -nargs=* Xrog call s:xr_opengrok(<f-args>)

