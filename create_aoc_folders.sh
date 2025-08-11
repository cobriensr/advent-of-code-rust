#!/bin/bash

# Base directory for advent-of-code-rust
BASE_DIR="/Users/charlesobrien/Documents/Workspace/advent-of-code-rust"

# Create base directory if it doesn't exist
mkdir -p "$BASE_DIR"

echo "Setting up Advent of Code Rust structure in $BASE_DIR"
echo "======================================================="

# Create year folders from 2015 to 2025
for year in {2015..2025}; do
    year_folder="$BASE_DIR/$year"
    
    echo "Processing year: $year"
    
    # Create year folder if it doesn't exist
    if [ ! -d "$year_folder" ]; then
        mkdir -p "$year_folder"
        echo "  ✓ Created year folder: $year"
    else
        echo "  Year folder $year already exists"
    fi
    
    # Create day folders 01 through 25
    for day in {1..25}; do
        # Format day with zero padding
        day_padded=$(printf "%02d" $day)
        day_folder="$year_folder/day$day_padded"
        
        # Check if the folder already exists
        if [ -d "$day_folder" ]; then
            echo "  Day $day_padded already exists, skipping..."
        else
            # Create the Cargo project
            cargo new "$day_folder" --name "day$day_padded" 2>/dev/null
            
            if [ $? -eq 0 ]; then
                # Create additional helpful files
                touch "$day_folder/input.txt"
                touch "$day_folder/example.txt"
                
                # Add a basic template to main.rs
                cat > "$day_folder/src/main.rs" << 'EOF'
use std::fs;

fn main() {
    // Read input
    let input = fs::read_to_string("input.txt")
        .expect("Failed to read input file");
    
    // Part 1
    let part1_result = solve_part1(&input);
    println!("Part 1: {}", part1_result);
    
    // Part 2
    let part2_result = solve_part2(&input);
    println!("Part 2: {}", part2_result);
}

fn solve_part1(input: &str) -> i32 {
    // TODO: Implement part 1
    0
}

fn solve_part2(input: &str) -> i32 {
    // TODO: Implement part 2
    0
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_part1_example() {
        let example = fs::read_to_string("example.txt")
            .expect("Failed to read example file");
        assert_eq!(solve_part1(&example), 0); // Update expected value
    }
    
    #[test]
    fn test_part2_example() {
        let example = fs::read_to_string("example.txt")
            .expect("Failed to read example file");
        assert_eq!(solve_part2(&example), 0); // Update expected value
    }
}
EOF
                
                echo "    ✓ Day $day_padded created"
            else
                echo "    ✗ Error creating Day $day_padded"
            fi
        fi
    done
    
    # Create a workspace Cargo.toml for this year if it doesn't exist
    workspace_toml="$year_folder/Cargo.toml"
    if [ ! -f "$workspace_toml" ]; then
        echo "  Creating workspace Cargo.toml..."
        cat > "$workspace_toml" << EOF
[workspace]
resolver = "2"
members = [
    "day01", "day02", "day03", "day04", "day05",
    "day06", "day07", "day08", "day09", "day10",
    "day11", "day12", "day13", "day14", "day15",
    "day16", "day17", "day18", "day19", "day20",
    "day21", "day22", "day23", "day24", "day25"
]

[workspace.dependencies]
# Common dependencies for Advent of Code
# regex = "1"
# itertools = "0.12"
# rayon = "1.8"
# nom = "7"
# petgraph = "0.6"
# num = "0.4"
EOF
        echo "  ✓ Created workspace configuration"
    fi
    
    # Add a README for the year
    readme_file="$year_folder/README.md"
    if [ ! -f "$readme_file" ]; then
        cat > "$readme_file" << EOF
# Advent of Code $year - Rust Solutions

## Running Solutions

\`\`\`bash
# Run a specific day
cargo run --bin day01

# Run with release optimizations
cargo run --release --bin day01

# Run tests for a day
cargo test --bin day01
\`\`\`

## Progress

- [ ] Day 01
- [ ] Day 02
- [ ] Day 03
- [ ] Day 04
- [ ] Day 05
- [ ] Day 06
- [ ] Day 07
- [ ] Day 08
- [ ] Day 09
- [ ] Day 10
- [ ] Day 11
- [ ] Day 12
- [ ] Day 13
- [ ] Day 14
- [ ] Day 15
- [ ] Day 16
- [ ] Day 17
- [ ] Day 18
- [ ] Day 19
- [ ] Day 20
- [ ] Day 21
- [ ] Day 22
- [ ] Day 23
- [ ] Day 24
- [ ] Day 25
EOF
        echo "  ✓ Created README.md"
    fi
    
    echo "Completed: $year"
    echo "------------------------"
done

echo "======================================================="
echo "All done! Complete Advent of Code structure created."
echo ""
echo "Structure created:"
echo "  - Years: 2015-2025"
echo "  - Days: day01-day25 in each year"
echo "  - Each day is a Cargo project with template code"
echo "  - Each year has a workspace Cargo.toml"
echo ""
echo "To start solving:"
echo "  cd $BASE_DIR/<year>"
echo "  cargo run --bin day01"