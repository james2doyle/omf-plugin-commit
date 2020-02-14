function commit -d "Commit helper"
  # Display help message.
  if begin; contains -- -h $argv; or contains -- --help $argv; end
    commit.help
    return 0
  end

  # Determine the location to use.
  if test (count $argv) -eq 0
    commit.help
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
