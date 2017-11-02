<?php

/**
 * 對公眾平台發送給公眾賬號的消息加解密示例代碼.
 *
 * @copyright Copyright (c) 1998-2014 Tencent Inc.
 */


include_once "sha1.php";
include_once "xmlparse.php";
include_once "pkcs7Encoder.php";
include_once "errorCode.php";

/**
 * 1.第三方回復加密消息給公眾平台；
 * 2.第三方收到公眾平台發送的消息，驗證消息的安全性，並對消息進行解密。
 */
class WXBizMsgCrypt
{
	private $m_sToken;
	private $m_sEncodingAesKey;
	private $m_sCorpid;

	/**
	 * 構造函數
	 * @param $token string 公眾平台上，開發者設置的token
	 * @param $encodingAesKey string 公眾平台上，開發者設置的EncodingAESKey
	 * @param $Corpid string 公眾平台的Corpid
	 */
	public function WXBizMsgCrypt($token, $encodingAesKey, $Corpid)
	{
		$this->m_sToken = $token;
		$this->m_sEncodingAesKey = $encodingAesKey;
		$this->m_sCorpid = $Corpid;
	}
	
    /*
	*驗證URL
    *@param sMsgSignature: 簽名串，對應URL參數的msg_signature
    *@param sTimeStamp: 時間戳，對應URL參數的timestamp
    *@param sNonce: 隨機串，對應URL參數的nonce
    *@param sEchoStr: 隨機串，對應URL參數的echostr
    *@param sReplyEchoStr: 解密之後的echostr，當return返回0時有效
    *@return：成功0，失敗返回對應的錯誤碼
	*/
	public function VerifyURL($sMsgSignature, $sTimeStamp, $sNonce, $sEchoStr, &$sReplyEchoStr)
	{
		if (strlen($this->m_sEncodingAesKey) != 43) {
			return ErrorCode::$IllegalAesKey;
		}

		$pc = new Prpcrypt($this->m_sEncodingAesKey);
		//verify msg_signature
		$sha1 = new SHA1;
		$array = $sha1->getSHA1($this->m_sToken, $sTimeStamp, $sNonce, $sEchoStr);
		$ret = $array[0];

		if ($ret != 0) {
			return $ret;
		}

		$signature = $array[1];
		if ($signature != $sMsgSignature) {
			return ErrorCode::$ValidateSignatureError;
		}

		$result = $pc->decrypt($sEchoStr, $this->m_sCorpid);
		if ($result[0] != 0) {
			return $result[0];
		}
		$sReplyEchoStr = $result[1];

		return ErrorCode::$OK;
	}
	/**
	 * 將公眾平台回復用戶的消息加密打包.
	 * <ol>
	 *    <li>對要發送的消息進行AES-CBC加密</li>
	 *    <li>生成安全簽名</li>
	 *    <li>將消息密文和安全簽名打包成xml格式</li>
	 * </ol>
	 *
	 * @param $replyMsg string 公眾平台待回復用戶的消息，xml格式的字符串
	 * @param $timeStamp string 時間戳，可以自己生成，也可以用URL參數的timestamp
	 * @param $nonce string 隨機串，可以自己生成，也可以用URL參數的nonce
	 * @param &$encryptMsg string 加密後的可以直接回復用戶的密文，包括msg_signature, timestamp, nonce, encrypt的xml格式的字符串,
	 *                      當return返回0時有效
	 *
	 * @return int 成功0，失敗返回對應的錯誤碼
	 */
	public function EncryptMsg($sReplyMsg, $sTimeStamp, $sNonce, &$sEncryptMsg)
	{
		$pc = new Prpcrypt($this->m_sEncodingAesKey);

		//加密
		$array = $pc->encrypt($sReplyMsg, $this->m_sCorpid);
		$ret = $array[0];
		if ($ret != 0) {
			return $ret;
		}

		if ($sTimeStamp == null) {
			$sTimeStamp = time();
		}
		$encrypt = $array[1];

		//生成安全簽名
		$sha1 = new SHA1;
		$array = $sha1->getSHA1($this->m_sToken, $sTimeStamp, $sNonce, $encrypt);
		$ret = $array[0];
		if ($ret != 0) {
			return $ret;
		}
		$signature = $array[1];

		//生成發送的xml
		$xmlparse = new XMLParse;
		$sEncryptMsg = $xmlparse->generate($encrypt, $signature, $sTimeStamp, $sNonce);
		return ErrorCode::$OK;
	}


	/**
	 * 檢驗消息的真實性，並且獲取解密後的明文.
	 * <ol>
	 *    <li>利用收到的密文生成安全簽名，進行簽名驗證</li>
	 *    <li>若驗證通過，則提取xml中的加密消息</li>
	 *    <li>對消息進行解密</li>
	 * </ol>
	 *
	 * @param $msgSignature string 簽名串，對應URL參數的msg_signature
	 * @param $timestamp string 時間戳 對應URL參數的timestamp
	 * @param $nonce string 隨機串，對應URL參數的nonce
	 * @param $postData string 密文，對應POST請求的數據
	 * @param &$msg string 解密後的原文，當return返回0時有效
	 *
	 * @return int 成功0，失敗返回對應的錯誤碼
	 */
	public function DecryptMsg($sMsgSignature, $sTimeStamp = null, $sNonce, $sPostData, &$sMsg)
	{
		if (strlen($this->m_sEncodingAesKey) != 43) {
			return ErrorCode::$IllegalAesKey;
		}

		$pc = new Prpcrypt($this->m_sEncodingAesKey);

		//提取密文
		$xmlparse = new XMLParse;
		$array = $xmlparse->extract($sPostData);
		$ret = $array[0];

		if ($ret != 0) {
			return $ret;
		}

		if ($sTimeStamp == null) {
			$sTimeStamp = time();
		}

		$encrypt = $array[1];
		$touser_name = $array[2];

		//驗證安全簽名
		$sha1 = new SHA1;
		$array = $sha1->getSHA1($this->m_sToken, $sTimeStamp, $sNonce, $encrypt);
		$ret = $array[0];

		if ($ret != 0) {
			return $ret;
		}

		$signature = $array[1];
		if ($signature != $sMsgSignature) {
			return ErrorCode::$ValidateSignatureError;
		}

		$result = $pc->decrypt($encrypt, $this->m_sCorpid);
		if ($result[0] != 0) {
			return $result[0];
		}
		$sMsg = $result[1];

		return ErrorCode::$OK;
	}

}

