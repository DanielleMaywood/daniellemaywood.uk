import lustre/attribute.{type Attribute, class}
import lustre/element.{type Element}
import lustre/element/html.{a}

pub fn component(
  attrs: List(Attribute(msg)),
  children: List(Element(msg)),
) -> Element(msg) {
  a(
    [
      class(
        "inline-block dark:decoration-fuchsia-300 underline underline-offset-4 decoration-2 hover:decoration-4 focus:outline-none focus:decoration-4",
      ),
      ..attrs
    ],
    children,
  )
}
