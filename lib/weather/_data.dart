part of weather_widget;

class _Data extends StatelessWidget {
  final Widget title;
  final Widget subtitle;

  const _Data({
    Key key,
    this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      subtitle: subtitle,
    );
  }
}
