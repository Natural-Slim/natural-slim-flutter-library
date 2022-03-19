import 'package:encrypt/encrypt.dart';
import 'package:natural_slim_flutter_library/constants/api_constants.dart';

class EncryptionManagement {

  static Encrypted encrypt(String dataToEncrypt) {
    try{
      String plainText = dataToEncrypt;
      Key key = Key.fromUtf8(ApiConstants.keyEncryptDecrypt);
      IV iv = IV.fromLength(16);

      Encrypter encrypter = Encrypter(AES(key));

      Encrypted encrypted = encrypter.encrypt(plainText, iv: iv);

      return encrypted;
    } catch (e) {
      rethrow;
    }
  }

  static String decrypt(String dataToDecrypt){
    try{
      Key key = Key.fromUtf8(ApiConstants.keyEncryptDecrypt);
      IV iv = IV.fromLength(16);

      Encrypter encrypter = Encrypter(AES(key));

      String decrypted = encrypter.decrypt64(dataToDecrypt, iv: iv);

      return decrypted;

    } catch (e) {
      rethrow;
    }
  }

}