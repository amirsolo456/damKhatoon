

enum State {
  success(200),
  movedPermanently(301),
  found(302),
  internalServerError(500);

  const State(this.code);

  final int code;
}


enum UsecaseState { success, failure }
