class ServerException implements Exception{

}
class OfflineException implements Exception{

}
class UserNotFoundException implements Exception{

}
 class InvalidInputException implements Exception{

}
class NotFoundException implements Exception{

}
class EmptyCacheException implements Exception{

}
class ImageNotUploadException implements Exception{

}

abstract class QrScannerException implements Exception {
 final String message;
 const QrScannerException(this.message);
}

class ImageNotSelectedException extends QrScannerException {
 const ImageNotSelectedException() : super('No image selected');
}

class QrScanException extends QrScannerException {
 const QrScanException([String msg = 'Failed to scan QR'])
     : super(msg);
}
