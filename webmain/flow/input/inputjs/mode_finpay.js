//流程模塊【finpay.付款申請】下錄入頁面自定義js頁面,初始函數
function initbodys(){
	
}
function changesubmit(){
	var jg = parseFloat(form('money').value);
	if(jg<=0)return '付款金額不能小于0';
}