use std::fs;

fn main() {
    let fname = "../day1-input.txt";
    let contents = fs::read_to_string(fname)
        .expect("Reading the text file");

    // println!("With text:\n {contents}");
    dbg!(contents.len());

    let x = contents.parse()
}
