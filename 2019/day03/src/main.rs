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
