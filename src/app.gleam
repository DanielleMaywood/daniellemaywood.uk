import app/config
import app/pages/blog
import app/pages/contact
import app/pages/home
import app/tools/tailwind
import gleam/dict
import gleam/list
import lustre/ssg
import lustre/ssg/djot
import simplifile
import tom

pub fn main() {
  let posts =
    get_blog_posts()
    |> list.fold(dict.new(), fn(posts, post) {
      let assert Ok(metadata) = djot.metadata(post)
      let assert Ok(slug) = tom.get_string(metadata, ["slug"])

      let post =
        djot.content(post)
        |> djot.render(blog.renderer())

      dict.insert(posts, slug, #(metadata, post))
    })

  let assert Ok(_) =
    ssg.new("./dist")
    |> ssg.add_static_dir("./public")
    |> ssg.add_static_route("/", home.page())
    |> ssg.add_static_route("/blog", blog.page(posts))
    |> ssg.add_dynamic_route("/blog", posts, blog.post)
    |> ssg.add_static_route("/contact", contact.page())
    |> ssg.use_index_routes
    |> ssg.build

  let assert Ok(_) = tailwind.build("../src/app.css", "./" <> config.theme_path)
}

fn get_blog_posts() -> List(String) {
  let assert Ok(posts) = simplifile.get_files("./src/app/pages/blog")

  list.map(posts, fn(post) {
    let assert Ok(content) = simplifile.read(post)

    content
  })
}
