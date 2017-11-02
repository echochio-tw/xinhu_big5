function AmountInWords(dValue, maxDec)
{
// 驗證輸入金額數值或數值字符串：
dValue = dValue.toString().replace(/,/g, ""); dValue = dValue.replace(/^0+/, "");      // 金額數值轉字符、移除逗號、移除前導零
if (dValue == "") { return "零元整"; }      // （錯誤：金額為空！）
else if (isNaN(dValue)) { return "錯誤：金額不是合法的數值！"; }

var minus = "";                             // 負數的符號“-”的大寫：“負”字。可自定義字符，如“（負）”。
var CN_SYMBOL = "";                         // 幣種名稱（如“人民幣”，默認空）
if (dValue.length > 1)
{
if (dValue.indexOf('-') == 0) { dValue = dValue.replace("-", ""); minus = "負"; }   // 處理負數符號“-”
if (dValue.indexOf('+') == 0) { dValue = dValue.replace("+", ""); }                 // 處理前導正數符號“+”（無實際意義）
}

// 變量定義：
var vInt = ""; var vDec = "";               // 字符串：金額的整數部分、小數部分
var resAIW;                                 // 字符串：要輸出的結果
var parts;                                  // 數組（整數部分.小數部分），length=1時則僅為整數。
var digits, radices, bigRadices, decimals; // 數組：數字（0~9零~玖）；基（十進制記數系統中每個數字位的基是10拾,佰,仟）；大基（萬,億,兆,京,垓,杼,穰,溝,澗,正）；輔幣 （元以下，角/分/釐/毫/絲）。
var zeroCount;                              // 零計數
var i, p, d;                                // 循環因子；前一位數字；當前位數字。
var quotient, modulus;                      // 整數部分計算用：商數、模數。

    // 金額數值轉換為字符，分割整數部分和小數部分：整數、小數分開來搞（小數部分有可能四舍五入後對整數部分有進位）。
var NoneDecLen = (typeof(maxDec) == "undefined" || maxDec == null || Number(maxDec) < 0 || Number(maxDec) > 5);     // 是否未指定有效小數位（true/false）
parts = dValue.split('.');                      // 數組賦值：（整數部分.小數部分），Array的length=1則僅為整數。
if (parts.length > 1)
{
vInt = parts[0]; vDec = parts[1];           // 變量賦值：金額的整數部分、小數部分

if(NoneDecLen) { maxDec = vDec.length > 5 ? 5 : vDec.length; }                                  // 未指定有效小數位參數值時，自動取實際小數位長但不超5。
var rDec = Number("0." + vDec);    
rDec *= Math.pow(10, maxDec); rDec = Math.round(Math.abs(rDec)); rDec /= Math.pow(10, maxDec); // 小數四舍五入
var aIntDec = rDec.toString().split('.');
if(Number(aIntDec[0]) == 1) { vInt = (Number(vInt) + 1).toString(); }                           // 小數部分四舍五入後有可能向整數部分的個位進位（值1）
if(aIntDec.length > 1) { vDec = aIntDec[1]; } else { vDec = ""; }
}
else { vInt = dValue; vDec = ""; if(NoneDecLen) { maxDec = 0; } }
if(vInt.length > 44) { return "錯誤：金額值太大了！整數位長【" + vInt.length.toString() + "】超過了上限44位/千正/10^43（注：1正=1萬澗=1億億億億億，10^40）！"; }

// 準備各字符數組 Prepare the characters corresponding to the digits:
digits = new Array("零", "壹", "貳", "參", "肆", "伍", "陸", "柒", "捌", "玖");         // 零~玖
radices = new Array("", "拾", "佰", "仟");                                              // 拾,佰,仟
bigRadices = new Array("", "萬", "億", "兆", "京", "垓", "杼", "穰" ,"溝", "澗", "正"); // 萬,億,兆,京,垓,杼,穰,溝,澗,正
decimals = new Array("角", "分", "釐", "毫", "絲");                                     // 角/分/釐/毫/絲

resAIW = ""; // 開始處理

// 處理整數部分（如果有）
if (Number(vInt) > 0)
{
zeroCount = 0;
for (i = 0; i < vInt.length; i++)
{
p = vInt.length - i - 1; d = vInt.substr(i, 1); quotient = p / 4; modulus = p % 4;
if (d == "0") { zeroCount++; }
else
{
if (zeroCount > 0) { resAIW += digits[0]; }
zeroCount = 0; resAIW += digits[Number(d)] + radices[modulus];
}
if (modulus == 0 && zeroCount < 4) { resAIW += bigRadices[quotient]; }
}
resAIW += "元";
}

// 處理小數部分（如果有）
for (i = 0; i < vDec.length; i++) { d = vDec.substr(i, 1); if (d != "0") { resAIW += digits[Number(d)] + decimals[i]; } }

// 處理結果
if (resAIW == "") { resAIW = "零" + "元"; }     // 零元
if (vDec == "") { resAIW += "整"; }             // ...元整
resAIW = CN_SYMBOL + minus + resAIW;            // 人民幣/負......元角分/整
var len	= resAIW.length;
if(resAIW.substr(len-1)=='角')resAIW+='整';
return resAIW;
}