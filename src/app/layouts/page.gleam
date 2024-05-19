import app/layouts/base
import lustre/attribute.{alt, class, height, src, width}
import lustre/element.{type Element}
import lustre/element/html.{aside, div, img}

pub type Props {
  Props(title: String)
}

pub fn layout(props: Props, make: fn() -> List(Element(msg))) -> Element(msg) {
  use <- base.layout(base.Props(title: props.title))

  [
    div([class("flex justify-between gap-8")], [
      div([], make()),
      aside([], [
        img([
          class("hidden md:block rounded-xl"),
          class("border-4 border-neutral-300 dark:border-neutral-800"),
          src("/images/avatar.webp"),
          alt("Profile picture"),
          width(150),
          height(150),
        ]),
      ]),
    ]),
  ]
}
