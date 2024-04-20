import app/components/link.{component as link}
import lustre/attribute.{class, href}
import lustre/element.{type Element}
import lustre/element/html.{header, li, nav, text, ul}

pub fn component() -> Element(msg) {
  header([class("text-lg font-semibold")], [
    nav([], [
      ul([class("flex justify-center md:justify-end gap-8")], [
        li([], [link([href("/")], [text("Home")])]),
        li([], [link([href("/contact")], [text("Contact")])]),
      ]),
    ]),
  ])
}
