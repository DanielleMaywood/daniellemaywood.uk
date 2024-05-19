import app/components/header_link.{component as link}
import lustre/attribute.{class, href}
import lustre/element.{type Element}
import lustre/element/html.{header, li, nav, text, ul}

pub fn component() -> Element(msg) {
  header(
    [class("text-xl bg-neutral-300 dark:bg-neutral-900 mt-4 px-8 py-4 rounded")],
    [
      nav([], [
        ul([class("flex gap-8")], [
          li([], [link([href("/")], [text("Home")])]),
          li([], [link([href("/contact")], [text("Contact")])]),
          li([], [link([href("/blog")], [text("Blog")])]),
        ]),
      ]),
    ],
  )
}
