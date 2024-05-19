import app/components/link
import lustre/attribute.{type Attribute, class}
import lustre/element.{type Element}
import lustre/element/html.{a}

pub fn component(
  attrs: List(Attribute(msg)),
  children: List(Element(msg)),
) -> Element(msg) {
  link.component([class("underline-offset-8 decoration-4"), ..attrs], children)
}
