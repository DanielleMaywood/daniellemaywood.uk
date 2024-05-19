import app/components/header.{component as header}
import app/config
import lustre/attribute.{attribute, class, href, name, rel, type_}
import lustre/element.{type Element}
import lustre/element/html.{body, head, html, link, main, meta, title}

pub type Props {
  Props(title: String)
}

pub fn layout(props: Props, make: fn() -> List(Element(msg))) -> Element(msg) {
  html([], [
    head([], [
      meta([attribute("charset", "utf-8")]),
      meta([name("viewport"), attribute("content", "width=device-width")]),
      link([rel("stylesheet"), href("/" <> config.theme_path)]),
      link([rel("me"), href(config.mastodon)]),
      link([rel("icon"), type_("image/png"), href("/images/favicon.webp")]),
      link([
        rel("preload"),
        attribute("as", "font"),
        href("/fonts/space-grotesk-latin-wght-normal.woff2"),
        type_("font/woff2"),
        attribute("crossorigin", ""),
      ]),
      title([], props.title),
    ]),
    body(
      [
        // "bg-gleam-pink/10 text-gleam-black dark:bg-gleam-blacker dark:text-gleam-white max-w-5xl p-4 mx-auto",
        class("text-neutral-800 bg-neutral-100"),
        class("dark:text-neutral-200 dark:bg-neutral-950"),
        class("max-w-5xl mx-auto px-4"),
      ],
      [header(), main([class("m-4")], make())],
    ),
  ])
}
