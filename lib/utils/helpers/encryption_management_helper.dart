import 'package:encrypt/encrypt.dart';
import 'package:natural_slim_flutter_library/constants/api_constants.dart';

/// Class to handle data encryption and decryption
class EncryptionManagementHelper {

  /// Method to encrypt data
  static Encrypted encrypt(String dataToEncrypt) {
    try{
      // An encryption key object is created
      Key key = Key.fromUtf8(ApiConstants.keyEncryptDecrypt);

      // Initialize a 16-byte vector
      IV iv = IV.fromLength(16);

      // Under the AES encryption algorithm, the data is encrypted and the 
      // encryption object is returned
      return Encrypter(AES(key)).encrypt(dataToEncrypt, iv: iv);
    } catch (e) {
      rethrow;
    }
  }

  /// Method to decrypt data
  static String decrypt(String dataToDecrypt){
    try{
      // An encryption key object is created
      Key key = Key.fromUtf8(ApiConstants.keyEncryptDecrypt);

      // Initialize a 16-byte vector
      IV iv = IV.fromLength(16);

      // Under the AES encryption algorithm the data is decrypted and returned
      return Encrypter(AES(key)).decrypt64(dataToDecrypt, iv: iv);
    } catch (e) {
      rethrow;
    }
  }

}