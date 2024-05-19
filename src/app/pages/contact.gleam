import app/components/link.{component as link}
import app/config.{
  bluesky, codeberg, discord, email, github, mastodon, sourcehut,
}
import app/layouts/page
import lustre/attribute.{class, href, rel}
import lustre/element.{type Element}
import lustre/element/html.{h1, p, text}

pub fn page() -> Element(msg) {
  use <- page.layout(page.Props(title: "Danielle Maywood - Contact"))

  [
    h1([class("text-4xl font-bold")], [text("Contact me")]),
    p([class("mt-4 text-lg")], [
      text("You can find me on "),
      link([href(email)], [text("Email")]),
      text(", "),
      link([href(mastodon), rel("me")], [text("Mastodon")]),
      text(", "),
      link([href(bluesky), rel("me")], [text("Bluesky")]),
      text(", "),
      link([href(discord), rel("me")], [text("Discord")]),
      text(", "),
      link([href(github), rel("me")], [text("GitHub")]),
      text(", "),
      link([href(sourcehut), rel("me")], [text("SourceHut")]),
      text(", or "),
      link([href(codeberg), rel("me")], [text("Codeberg")]),
      text("."),
    ]),
  ]
}
