#!/usr/bin/env bash

# Tinty hook script to write base16 colors to chezmoi.toml
# Place this somewhere in your PATH or reference it directly in tinty config

CHEZMOI_CONFIG="${CHEZMOI_CONFIG:-$HOME/.config/chezmoi/chezmoi.toml}"

# Build hex color from individual R, G, B env vars
hex_color() {
    local base="$1"
    local r_var="TINTY_SCHEME_PALETTE_${base}_HEX_R"
    local g_var="TINTY_SCHEME_PALETTE_${base}_HEX_G"
    local b_var="TINTY_SCHEME_PALETTE_${base}_HEX_B"
    echo "#${!r_var}${!g_var}${!b_var}"
}

# Generate the [data.cheztheme] section
generate_cheztheme() {
    cat <<EOF
[data.cheztheme]
themeName = "$TINTY_SCHEME_SLUG"
base00 = "$(hex_color BASE00)"
base01 = "$(hex_color BASE01)"
base02 = "$(hex_color BASE02)"
base03 = "$(hex_color BASE03)"
base04 = "$(hex_color BASE04)"
base05 = "$(hex_color BASE05)"
base06 = "$(hex_color BASE06)"
base07 = "$(hex_color BASE07)"
base08 = "$(hex_color BASE08)"
base09 = "$(hex_color BASE09)"
base0A = "$(hex_color BASE0A)"
base0B = "$(hex_color BASE0B)"
base0C = "$(hex_color BASE0C)"
base0D = "$(hex_color BASE0D)"
base0E = "$(hex_color BASE0E)"
base0F = "$(hex_color BASE0F)"
EOF
}

# Remove existing [data.cheztheme] section and everything until next section or EOF
remove_existing_section() {
    local file="$1"
    if [[ -f "$file" ]]; then
        # Use awk to remove the section
        awk '
            /^\[data\.cheztheme\]/ { in_section=1; next }
            in_section && /^\[/ { in_section=0 }
            !in_section { print }
        ' "$file"
    fi
}

# Main
main() {
    # Ensure config directory exists
    mkdir -p "$(dirname "$CHEZMOI_CONFIG")"

    if [[ -f "$CHEZMOI_CONFIG" ]]; then
        # Remove existing section and append new one
        local temp_file
        temp_file=$(mktemp)
        remove_existing_section "$CHEZMOI_CONFIG" > "$temp_file"
        
        # Remove trailing blank lines and add single newline before new section
        sed -i -e :a -e '/^\n*$/{$d;N;ba' -e '}' "$temp_file" 2>/dev/null || \
            sed -i '' -e :a -e '/^\n*$/{$d;N;ba' -e '}' "$temp_file"
        
        # Append new section
        echo "" >> "$temp_file"
        generate_cheztheme >> "$temp_file"
        
        mv "$temp_file" "$CHEZMOI_CONFIG"
    else
        # Create new file with just the cheztheme section
        generate_cheztheme > "$CHEZMOI_CONFIG"
    fi

}

main
