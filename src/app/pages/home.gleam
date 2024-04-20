import app/components/link.{component as link}
import app/layouts/page
import lustre/attribute.{class, href}
import lustre/element.{type Element}
import lustre/element/html.{h1, h3, li, p, text, ul}

pub fn page() -> Element(msg) {
  use <- page.layout(page.Props(title: "Danielle Maywood"))

  [
    h1([class("text-4xl font-bold")], [text("Danielle Maywood")]),
    p([class("mt-4 text-lg")], [
      text("Computer Science student at Loughborough University"),
    ]),
    h3([class("mt-4 text-2xl font-bold")], [text("Projects")]),
    ul([class("text-lg list-disc ml-4 mt-2")], [
      li([], [
        link([href("https://github.com/DanielleMaywood/glexer")], [
          text("Glexer"),
        ]),
        text(" - Lexer for the Gleam programming language, written in Gleam."),
      ]),
    ]),
  ]
}
