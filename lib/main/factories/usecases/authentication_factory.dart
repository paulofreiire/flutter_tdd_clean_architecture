import '../../../data/usecases/remote_authentication.dart';
import '../../../domain/usecases/authentication.dart';
import '../factories.dart';

Authentication makeRemoteAuthentication() {
  return RemoteAuthentication(
      httpClient: makeHttpAdapter(), url: makeApiUrl('login'));
}
