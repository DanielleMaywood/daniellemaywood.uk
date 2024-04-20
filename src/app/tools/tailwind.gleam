import shellout

pub fn build(input: String, output: String) -> Result(String, #(Int, String)) {
  shellout.command(
    run: "bunx",
    with: ["@tailwindcss/cli@next", "--input", input, "--output", output],
    in: "./dist",
    opt: [],
  )
}
