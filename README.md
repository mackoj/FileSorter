# DateSorter

This package contain a executable sorter.

In order to run it do `swift run sorter <input-file-path>`.

__<input-file-path>__ should contain path to regular files.

*exemple of <input-file-path>*
```
/Users/pikachu/Download/file1.txt
/Users/pikachu/Download/file2.txt
/Users/pikachu/Download/file3.txt
/Users/pikachu/Download/file4.txt
/Users/pikachu/Download/file5.txt
/Users/pikachu/Download/file6.txt
/Users/pikachu/Download/file7.txt
/Users/pikachu/Download/file8.txt
```

It will look line after line in the __<input-file-path>__ in order to find the related file and get its informations **creation date** or **modification date** in order to sort them.

```
USAGE: sorter <input-file-path> [--output-path <output-path>] [--in-place <in-place>] [--asc] [--desc] [--random] [--creation-date] [--modification-date] [--ignore-symlink] [--none] [--minimal] [--everything]

ARGUMENTS:
  <input-file-path>       File that contain a list of file to order.

OPTIONS:
  -o, --output-path <output-path>
                          Output path where to wrote the sorted content.
  -i, --in-place <in-place>
                          Write the sorted output into the inputFile. (default: true)
  --asc                   Ascending order < (default: desc)
  --desc                  Descending order > (default: desc)
  --random                Suffle 🎲 (default: desc)
  --creation-date         File system creation date. (default: creationDate)
  --modification-date     File system modification date. (default: creationDate)
  --ignore-symlink        Toggle the filtering of symlinks.
  --none                  Nothing to display. (default: minimal)
  --minimal               Display log of levels notice, warning, error and critical. (default: minimal)
  --everything            Display logs. (default: minimal)
  -h, --help              Show help information.
```

MIT
