function commit -d "Commit helper"
  if test (count $argv) -eq 0
    if not type -q fzf
      echo "fzf command cannot be found"

      return 1
    end

    set selection (commit.list | fzf --tac +s -e --header='[fuzzy:commit]' | perl -lne 'print $1 if /(--\w+)/i')
    if [ $selection ]
      commandline -r "commit $selection"
      commandline -f execute
    end

    return 0
  end

  set -l gitt (git rev-parse --is-inside-work-tree 2>/dev/null)
  if test "$gitt" != "true"
    echo "Not a git repository"

    return 0
  end

  set -l gits (git diff --cached --exit-code)
  if test -z "$gits"
    echo "No staged commits"

    return 0
  end

  set -l options (fish_opt --short=h --long=help)
  set options $options (fish_opt --short=a --long=added)
  set options $options (fish_opt --short=c --long=changed)
  set options $options (fish_opt --short=d --long=deprecated)
  set options $options (fish_opt --short=r --long=removed)
  set options $options (fish_opt --short=f --long=fixed)
  set options $options (fish_opt --short=s --long=security)
  argparse $options -- $argv

  # Display help message.
  if test -n "$_flag_help"; or test -n "$_flag_h"
    commit.help

    return 0
  end

  if test -n "$_flag_added"; or test -n "$_flag_a"
    # replace the current command buffer with this string:
    commandline -r "git commit -m \"Added: \""
    # move the cursor to the inside of the quotes
    commandline -C 22
  end

  if test -n "$_flag_changed"; or test -n "$_flag_c"
    commandline -r "git commit -m \"Changed: \""
    commandline -C 24
  end

  if test -n "$_flag_deprecated"; or test -n "$_flag_d"
    commandline -r "git commit -m \"Deprecated: \""
    commandline -C 27
  end

  if test -n "$_flag_removed"; or test -n "$_flag_r"
    commandline -r "git commit -m \"Removed: \""
    commandline -C 24
  end

  if test -n "$_flag_fixed"; or test -n "$_flag_f"
    commandline -r "git commit -m \"Fixed: \""
    commandline -C 22
  end

  if test -n "$_flag_security"; or test -n "$_flag_s"
    commandline -r "git commit -m \"Security: \""
    commandline -C 25
  end
end
