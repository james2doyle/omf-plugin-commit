function commit.help
  echo "Commit helper for keepachangelog.com

Usage: commit [-h|--help] [-a|--added] [-c|--changed] [-d|--deprecated] [-r|--removed] [-f|--fixed] [-s|--security]
  Helper to prefix commit messages with the verbs from keepachangelog.com

Options:
  -h, --help           Display this help message and exit.
  -a, --added          Make a commit for \"Added\".
  -c, --changed        Make a commit for \"Changed\".
  -d, --deprecated     Make a commit for \"Deprecated\".
  -r, --removed        Make a commit for \"Removed\".
  -f, --fixed          Make a commit for \"Fixed\".
  -s, --security       Make a commit for \"Security\".
"
end
