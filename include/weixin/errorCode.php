<?php

/**
 * error code 說明.
 * <ul>
 *    <li>-40001: 簽名驗證錯誤</li>
 *    <li>-40002: xml解析失敗</li>
 *    <li>-40003: sha加密生成簽名失敗</li>
 *    <li>-40004: encodingAesKey 非法</li>
 *    <li>-40005: corpid 校驗錯誤</li>
 *    <li>-40006: aes 加密失敗</li>
 *    <li>-40007: aes 解密失敗</li>
 *    <li>-40008: 解密後得到的buffer非法</li>
 *    <li>-40009: base64加密失敗</li>
 *    <li>-40010: base64解密失敗</li>
 *    <li>-40011: 生成xml失敗</li>
 * </ul>
 */
class ErrorCode
{
	public static $OK = 0;
	public static $ValidateSignatureError = -40001;
	public static $ParseXmlError = -40002;
	public static $ComputeSignatureError = -40003;
	public static $IllegalAesKey = -40004;
	public static $ValidateCorpidError = -40005;
	public static $EncryptAESError = -40006;
	public static $DecryptAESError = -40007;
	public static $IllegalBuffer = -40008;
	public static $EncodeBase64Error = -40009;
	public static $DecodeBase64Error = -40010;
	public static $GenReturnXmlError = -40011;
}

?>