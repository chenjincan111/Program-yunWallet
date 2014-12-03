

	function modify(id) {
		$("#firstRow").hide();
		var whichTr = $("#modify_" + id).parent().parent();//TR
		var idTd = whichTr.children("#ID_" + id);//TD
		var nameTd = whichTr.children("#Name_" + id);//TD
		var addrTd = whichTr.children("#Addr_" + id);//TD

		if (nameTd.html().indexOf('value=') == -1) {
			idTd.html("<input id='address' type='input' name='id[" + id + "]' value='"
					+ idTd.html() + "' readonly=readonly size=6>");
			nameTd.html("<input id='amount' type='input' name='amount' value='"
					+ nameTd.html() + "' size=12>");
			telpTd.html("<input id='locked' type='input' name='locked' value='" + telpTd.html() + "' size=12>");
		} else {
			if (window.confirm('确定要提交吗？')) {
				//提交代码
				var amount = document.getElementById("amount").value;
				var locked = document.getElementById("locked").value;
				alert(amount+locked);
				window.location.reload("/SHS-test/update?amount="+amount+"&locked="+locked);
			}
		}
	}

	$(document).ready(function() {
		$("#btnAdd").click(function() {
			var whichEl = $("#firstRow");
			if (whichEl.css("display") == "none") {
				whichEl.show();
				$(this).val("取消新增");
			} else {
				whichEl.hide();
				$(this).val("新增");
			}
		});

		$("#submitCng").click(function() {
			if (window.confirm('确定要提交吗？')) {
				//提交代码
				$("#frmAdd").submit();
			}
		});
	});
