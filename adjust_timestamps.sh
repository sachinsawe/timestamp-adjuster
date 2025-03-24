#!/bin/bash

# Ensure correct usage
if [[ $# -ne 3 ]]; then
    echo "Usage: $0 <directory> <file_pattern> <hours_to_add>"
    echo "Example: $0 /path/to/dir '*.mov' 9.5"
    echo "         $0 /path/to/dir 'IMG_.*\.JPG' -3"
    exit 1
fi

# Assign arguments
DIR="$1"
PATTERN="$2"
HOURS_TO_ADD="$3"

# Validate directory
if [[ ! -d "$DIR" ]]; then
    echo "Error: Directory '$DIR' does not exist."
    exit 1
fi

# Validate HOURS_TO_ADD is a number
if ! [[ "$HOURS_TO_ADD" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Hours to add must be a valid number (e.g., 9.5 or -3)."
    exit 1
fi

# Check if 'SetFile' command is available
if ! command -v SetFile &> /dev/null; then
    echo "SetFile command not found. Please install Xcode Command Line Tools: xcode-select --install"
    exit 1
fi

# Find matching files based on pattern
FILES=$(find "$DIR" -type f -name "$PATTERN" 2>/dev/null)

# If no files found, exit
if [[ -z "$FILES" ]]; then
    echo "No files matching pattern '$PATTERN' found in '$DIR'."
    exit 0
fi

# Process each matching file
for file in $FILES; do
    if [[ -f "$file" ]]; then
        # Get the original creation timestamp
        original_date=$(GetFileInfo -d "$file")

        # Convert it to UNIX timestamp
        original_timestamp=$(date -j -f "%m/%d/%Y %H:%M:%S" "$original_date" "+%s")

        # Convert hours to seconds using 'bc' for decimal support
        seconds_to_add=$(echo "$HOURS_TO_ADD * 3600" | bc)

        # Convert result to integer
        new_timestamp=$(echo "$original_timestamp + $seconds_to_add" | bc | awk '{print int($1)}')

        # Convert back to formatted date
        new_date=$(date -j -f "%s" "$new_timestamp" "+%m/%d/%Y %H:%M:%S")

        # Apply the new timestamp to "Date Created"
        SetFile -d "$new_date" "$file"

        # Apply the same timestamp to "Date Modified"
        touch -t "$(date -j -f "%s" "$new_timestamp" "+%Y%m%d%H%M.%S")" "$file"

        echo "Updated: $file | Old: $original_date -> New: $new_date"
    fi
done

echo "Timestamp adjustment complete!"
