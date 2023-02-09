abstract class XmlParser<T> {
  T parse(String rawXml);
}

abstract class ParameterizedXmlParser<T, P> {
  T parse(String rawXml, P parameter);
}
