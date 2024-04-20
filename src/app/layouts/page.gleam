import app/layouts/base
import lustre/attribute.{alt, class, height, src, width}
import lustre/element.{type Element}
import lustre/element/html.{aside, img}

pub type Props {
  Props(title: String)
}

pub fn layout(props: Props, make: fn() -> List(Element(msg))) -> Element(msg) {
  use <- base.layout(base.Props(title: props.title))

  [
    aside([class("float float-right")], [
      img([
        class("hidden md:block border border-4 border-black rounded-full ml-4"),
        src("/images/avatar.webp"),
        alt("Profile picture"),
        width(150),
        height(150),
      ]),
    ]),
    ..make()
  ]
}
