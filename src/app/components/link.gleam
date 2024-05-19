import lustre/attribute.{type Attribute, class}
import lustre/element.{type Element}
import lustre/element/html.{a}

pub fn component(
  attrs: List(Attribute(msg)),
  children: List(Element(msg)),
) -> Element(msg) {
  a(
    [
      class("hover:text-pink-600 decoration-pink-600"),
      class("dark:hover:text-pink-400 dark:decoration-pink-400"),
      class("focus:outline-none focus:text-pink-600 dark:focus:text-pink-400"),
      class("inline-block underline decoration-2 underline-offset-2"),
      ..attrs
    ],
    children,
  )
}
