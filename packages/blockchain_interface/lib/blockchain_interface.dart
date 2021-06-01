library blockchain_interface;

abstract class BlockchainInterface {
  Future<String> getAddressBalance(String address);
}
