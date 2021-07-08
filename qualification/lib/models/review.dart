class Review {
  String username;
  String comment;
  int itemId;

  Review(this.itemId, this.username, this.comment);

  int getItemId() {
    return this.itemId;
  }
}
