#!/bin/bash

# Check arguments
if [ $# -ne 2 ]; then
    echo "Usage: ./update.sh <cask-name> <version>"
    echo "Example: ./update.sh petrichor 1.0.0-alpha-4"
    echo "Example: ./update.sh another-app 2.1.0"
    exit 1
fi

CASK_NAME=$1
VERSION=$2
CASK_FILE="Casks/${CASK_NAME}.rb"

# Check if cask file exists
if [ ! -f "$CASK_FILE" ]; then
    echo "❌ Error: Cask file not found: $CASK_FILE"
    echo "Available casks:"
    ls Casks/*.rb 2>/dev/null | xargs -n1 basename | sed 's/\.rb$//' | sed 's/^/  - /'
    exit 1
fi

# Extract current URL pattern from cask file
echo "📄 Reading URL pattern from $CASK_FILE..."
URL_PATTERN=$(grep -E '^\s*url\s+"' "$CASK_FILE" | sed 's/.*url "\(.*\)".*/\1/')

if [ -z "$URL_PATTERN" ]; then
    echo "❌ Error: Could not find URL pattern in $CASK_FILE"
    exit 1
fi

# Replace #{version} with actual version
DOWNLOAD_URL=$(echo "$URL_PATTERN" | sed "s/#{version}/$VERSION/g")

echo "🔗 Download URL: $DOWNLOAD_URL"
echo "📥 Downloading..."

# Download the file
if ! curl -L -o "temp_download" "$DOWNLOAD_URL"; then
    echo "❌ Error: Failed to download from $DOWNLOAD_URL"
    rm -f temp_download
    exit 1
fi

# Calculate SHA256
echo "🔐 Calculating SHA256..."
SHA256=$(shasum -a 256 temp_download | awk '{print $1}')
rm temp_download

# Update the cask file
echo "✏️  Updating $CASK_FILE..."
sed -i '' "s/version \".*\"/version \"$VERSION\"/" "$CASK_FILE"
sed -i '' "s/sha256 \".*\"/sha256 \"$SHA256\"/" "$CASK_FILE"

echo ""
echo "✅ Successfully updated $CASK_NAME to version $VERSION"
echo "📝 SHA256: $SHA256"
echo ""
echo "Next steps:"
echo "1. Test:   brew reinstall --cask $CASK_NAME"
echo "2. Commit: git add . && git commit -m 'Update $CASK_NAME to $VERSION'"
echo "3. Push:   git push origin main"
