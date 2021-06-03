import 'package:blockchain_interface/blockchain_interface.dart';
import 'package:zilliqa_api/zilliqa_api.dart';

class CryptoRepository {

  final BlockchainInterface _apiClient;

  CryptoRepository({ZilliqaApiClient? apiClient}) : _apiClient = apiClient ?? ZilliqaApiClient();
  
    Future<String> getBalance(String address) {
      return _apiClient.getAddressBalance(address);
    }
}
