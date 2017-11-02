//流程模塊【carmwx.車輛維修】下錄入頁面自定義js頁面,初始函數
function initbodys(){
	
}

function changesubmit(d){
	if(d.enddt && d.enddt<=d.startdt)return '截止時間必須大于維修時間';
}