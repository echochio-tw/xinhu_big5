//流程模塊【carms.車輛信息登記】下錄入頁面自定義js頁面,初始函數
function initbodys(){
	//c.fieldshide('money');
	$(form('otype')).change(function(){
		changeotype();
	});
	changeotype();
}
function changeotype(){
	var val = form('otype').value;
	if(val=='違章'||val=='事故'||val=='加油'){
		c.setfields('address',''+val+'地點');
	}else{
		c.setfields('address','地點');
	}
}
function changesubmit(d){
	if(d.enddt && d.enddt<=d.startdt)return '截止日期必須大于開始日期';
}