/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ass1;

/**
 *
 * @author wyy
 */
import java.security.Key;
import javax.crypto.Cipher;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;
import javax.crypto.spec.PBEParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.util.concurrent.TimeUnit;


/**
 * Example of using Password-based encryption 
 */
 
public class ass1
{
    public static void main(
        String[]    args)
        throws Exception
    {
           PBEKeySpec pbeKeySpec; 
           PBEParameterSpec pbeParamSpec; 
           SecretKeyFactory keyFac; 
//Initialization of the password
char[]  password = "Thisiswyy".toCharArray();
//Initialization of plaintext 
byte[]  cleartext = "Thisisplaintext".getBytes(); 
byte[]  ciphertext = null;
long Etotal=0;
long Dtotal=0;
String StringPlaintext=null;



for(int x = 1; x < 6; x = x+1) {
  long Start = System.nanoTime();  
// Salt 
           byte[] salt = { (byte)0xc7, (byte)0x73, (byte)0x21, 
                      (byte)0x8c, (byte)0x7e, (byte)0xc8, (byte)0xee, (byte)0x99 };
           
// Iteration count 
          int count = 2048; 

// Create PBE parameter set 
          pbeParamSpec = new PBEParameterSpec(salt, count); 

//Create parameter for key generation 
          pbeKeySpec = new PBEKeySpec(password); 

// Create instance of SecretKeyFactory for password-based encryption 
// using DES and MD5    
          keyFac = SecretKeyFactory.getInstance("PBEWithMD5AndDES"); 

// Generate a key 
     Key pbeKey = keyFac.generateSecret(pbeKeySpec); 

// Create PBE Cipher 
  Cipher pbeCipher = Cipher.getInstance("PBEWithMD5AndDES");
 
 // Initialize PBE Cipher with key and parameters 
        pbeCipher.init(Cipher.ENCRYPT_MODE, pbeKey, pbeParamSpec);



//Record the start time of Encryption
long EstartTime = System.nanoTime();
// Encrypt the plaintext 
ciphertext = pbeCipher.doFinal(cleartext); 
//Record the end time of Encryption and the start time of Decryption
long MidTime = System.nanoTime();

// Initialize PBE Cipher with key and parameters
pbeCipher.init(Cipher.DECRYPT_MODE, pbeKey, pbeParamSpec);

// decrypt the ciphertext
byte[] plaintext = pbeCipher.doFinal(ciphertext);
//Record the end time of Decryption
long DendTime = System.nanoTime();

//Calculate the time of Encryption
long Encryptiontime = MidTime - Start;
System.out.println(x+"Encryption time is "+ Encryptiontime/1000+" microseconds" );
Etotal=Etotal+Encryptiontime;

//Calculate the time of Decryption
long Decryptiontime = DendTime -EstartTime+ MidTime-Start;
StringPlaintext = new String (plaintext);
Dtotal=Dtotal+Decryptiontime;
System.out.println(x+"Dencryption time is "+ Decryptiontime/1000+" microseconds" );




}
long Davg=Dtotal/5;
System.out.println("Average Decryption time is " + Davg/1000+"microseconds");
System.out.println("Plain text: "+StringPlaintext);
long Eavg=Etotal/5;
System.out.println("Average encryption time is " + Eavg/1000+"microseconds");
System.out.println("cipher : " + Utils.toHex(ciphertext));



    }
}