complete -c commit -s h -l help -d "Print the help" -f
complete -c commit -s a -l added -d "Make a commit for \"Added\"" -f
complete -c commit -s c -l changed -d "Make a commit for \"Changed\"" -f
complete -c commit -s d -l deprecated -d "Make a commit for \"Deprecated\"" -f
complete -c commit -s r -l removed -d "Make a commit for \"Removed\"" -f
complete -c commit -s f -l fixed -d "Make a commit for \"Fixed\"" -f
complete -c commit -s s -l security -d "Make a commit for \"Security\"" -f

function __commit_entries
  echo "help,added,changed,deprecated,removed,fixed,security" | string split ,
end

complete -f -c commit -a '(__commit_entries)'
