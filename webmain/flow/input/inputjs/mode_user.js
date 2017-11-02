//流程模塊【user.用戶】下錄入頁面自定義js頁面,初始函數
function initbodys(){
	
}

function changesubmit(d){
	if(d.deptnames || d.rankings){
		var len1 = d.deptnames.split(',').length;
		var len2 = d.rankings.split(',').length;
		if(!d.deptnames)len1=0;
		if(!d.rankings)len2=0;
		if(len2!=len1)return '多部門和多職位的數量不一致';
	}
}