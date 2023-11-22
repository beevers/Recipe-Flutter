enum ServerErrorType { connectionTimeout, serverFailure, serverSuccess }

class InjectServerErrorCheck {
  bool serverErrorCheck(ServerErrorType errorType) {
    if (errorType == ServerErrorType.connectionTimeout) {
      return true;
    } else if (errorType == ServerErrorType.serverFailure) {
      return true;
    } else if (errorType == ServerErrorType.serverSuccess) {
      return true;
    } else {
      return false;
    }
  }
}
