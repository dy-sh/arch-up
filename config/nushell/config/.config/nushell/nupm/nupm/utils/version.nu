# Commands related to handling versions
#
# We might move some of this to Nushell builtins

# Sort packages by version
def sort-by-version []: table<version: string> -> table<version: string> {
    sort-by version
}

# Check if the target version is equal or higher than the target version
def matches-version [version: string]: string -> bool {
    # TODO: Add proper version matching
    $in == $version
}

# Filter packages by version and sort them by version
export def filter-by-version [version: any]: table<version: string> -> table<version: string> {
    if $version == null {
        $in
    } else {
        $in | filter {|row| $row.version | matches-version $version}
    }
    | sort-by-version
}
