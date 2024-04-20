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
        class(
          "bg-fuchsia-50 dark:bg-neutral-900 dark:text-fuchsia-50 max-w-5xl p-4 mx-auto",
        ),
      ],
      [header(), main([class("mt-4 md:mt-16")], make())],
    ),
  ])
}
