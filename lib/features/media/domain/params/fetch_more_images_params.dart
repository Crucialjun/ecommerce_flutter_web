class FetchMoreImagesParams {
  final String category;
  final int loadCount;
  final DateTime lastFetchedDate;

  FetchMoreImagesParams(
      {required this.category,
      required this.loadCount,
      required this.lastFetchedDate});
}
