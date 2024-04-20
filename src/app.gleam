import app/config
import app/pages/contact
import app/pages/home
import app/tools/tailwind
import lustre/ssg

pub fn main() {
  let assert Ok(_) =
    ssg.new("./dist")
    |> ssg.add_static_dir("./public")
    |> ssg.add_static_route("/", home.page())
    |> ssg.add_static_route("/contact", contact.page())
    |> ssg.use_index_routes
    |> ssg.build

  let assert Ok(_) = tailwind.build("../src/app.css", "./" <> config.theme_path)
}
