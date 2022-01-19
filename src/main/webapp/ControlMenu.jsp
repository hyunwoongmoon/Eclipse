<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페 주문 웹페이지</title>
</head>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<style>
table{
    margin-left: auto;
    margin-right: auto;
}
table.bound { /*bound라는 class는 table 안에서만 쓸 수 있다.*/
    border-collapse: collapse;
    border:1px solid black;
    height:450px;
    width:310px;
    background-color:#FFD2D7;
}
td.bound { /*이 bound는 td 안에서는 아래의 의미가 된다.*/
    border:1px solid black;
    background-color:FFDAD7;
}
#tb10 {
background-color: #FFD2D7;
}
#tb11 {
background-color: #FFD2D7;
}
#selMenu{
    width:300px;
    height:280px;
}
#selOrder{
    width:300px;
    height:280px;
}
#selSales{
    width:300px;
    height:400px;
}
#selMenu1{
    width:300px;
    height:200px;
}
#btnPlus,#btnDone,#btnAdd,#summary,#dlgSum,#dlgSum1,#dlgSum2{
    background-color: #FFE4E1;
}
#btnMinus,#btnCancel,#btnReset{
    background-color: #FFE4E1;
}
#selMenu,#selOrder,#selSales,#selMenu{
    background-color: #FFE4E1;
    font-size:20px;
}
#dlgMenu {
	background-color: #FFE4E1;
}
.a{
    text-align:center;
}
#menuname,#count,#price,#total,#mobile,#btnMenu{
    background-color:#FFE4E1;
}
#menu_code,#_menuname,#_price {
	background-color:white;
}
/* #caption { */
/* 	background-color:#ffd5d2; */
/* } */

body{
	background-image: url('https://th.bing.com/th/id/R.f5cd431f759065401b4940f0d26cfa6f?rik=SoV9mUsVCjbwMA&riu=http%3a%2f%2fpostfiles3.naver.net%2f20160216_146%2fcheekyhodori_14556274224374OQIR_PNG%2f1602179.png%3ftype%3dw1&ehk=zXJRaB9NXMLFd80fd0PbE9OwN6T4B1BvFjGMLJvmHeo%3d&risl=&pid=ImgRaw&r=0');
    background-size: 1920px 1080px;
    background-repeat: no-repeat;
}
</style>
<body>
<table>
        <tr>
            <td valign=top>
                <table class='bound' id=tblMenu>
                    <caption>메뉴목록</caption>
                    <tr>
                        <td colspan=2 align=right>
                       <button id=btnMenu>메뉴관리</button>
                        </td>	
                    </tr>
                <tr>
                    <td colspan=2>
                        <select id=selMenu size=13></select>
                    </td>
                </tr>
                <tr>
                    <td class='a'>메뉴명</td>
                    <td><input type=text id=menuname readonly></td>
                </tr>
                <tr>
                    <td class='a'>수량</td>
                    <td><input type=number id=count min=1 style='width:30px' value=1>잔</td>
                </tr>
                <tr>
                    <td class='a'>금액</td>
                    <td><input type=number id=price value=0 readonly>원</td>
                </tr>
                <tr>
                    <td><button id=btnReset>비우기</button></td>
                    <td align=right><button id=btnAdd>메뉴추가</button></td>
                </tr>
                </table>
            </td>
            <td valign=top>
                <table class='bound' id=tbl2>
                    <caption id=sel1>주문목록</caption>
                    <tr>
                        <td colspan=2 id=td2 value='123'>
                            <select id=selOrder size=13></select>
                        </td>
                    </tr>
                    <tr>
                        <td>총액&nbsp;&nbsp;&nbsp;&nbsp;<input type=number id=total style='width:140px';>원</td>
                    </tr>
                    <tr>
                        <td>모바일&nbsp;<input type=phone id=mobile size=15></td>
                    </tr>
                    <tr>
                        <td colspan=2>&nbsp;</td>
                    </tr>
                    <tr>
                        <td><button id=btnCancel>주문취소</button></td>
                        <td align=right><button id=btnDone>주문완료</button></td>
                    </tr>
                </table>
            </td>
            <td valign=top>
                <table class='bound'>
                    <caption id=sel>판매내역</caption>
                    <tr>
                        <td colspan=2 align=right>
                       <button id=summary>summary</button>
                        </td>	
                    </tr>
                    <tr>
                        <td>
                            <select id=selSales size=20></select>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div id=dlgMenu style='display:none;' title="메뉴관리">
        <table>
            <tr>
                <td>
                    <select id=selMenu1 size=10></select>
                </td>
                <td>
                    <table color=#FFE4E1;>
                    <tr>
                    	<td>코드</td><td><input type=text id=menu_code></td>
                    </tr>
                    <tr>
                        <td>메뉴명</td><td><input type=text id=_menuname style='width:120px'></td>
                    </tr>
                    <tr>
                        <td>가격</td><td><input type=number id=_price min=0 style='width:50px'>원</td>
                    </tr>
                    <tr>
                        <td colspan=2 align=center><button id=btnPlus>추가 및 삭제</button>&nbsp;
                        </td>
                    </tr>
                    </table>
                </td>
            </tr>  
            </table>
    </div>
    <div id=dlgSum style='display:none;' title="매출내역">
        <table id=tb10 align=left>
            <tr><td align=center>메뉴별 매출액</td></tr>
            <tr>
            	<td>
                    <select id=dlgSum1 size=12></select>
                </td>
            </tr>
        </table >
        <table id=tb11 align=right>
            <tr><td align=center>고객별 매출액</td></tr>
            <tr>
            	<td>
                	<select id=dlgSum2 size=12></select>
                </td>
            </tr>  
        </table>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script>
arMenu={};
total=0;
menu_code='';
$(document)
.ready(function(){
	loadMenu();
// 	Menu();
//     $.get('select', {}, function(txt) {
//        if (txt == "")
//           return false;
//        let rec = txt.split(';');
//        for (i = 0; i < rec.length; i++) {  /*위에서 구한 값들을 여기서 처리한다..각셀에 집어넣는다는 뜻*/
//           let field = rec[i].split(',');
//           let html ='<option>'+field[0]+' '+field[1]+' '+field[2]+'</option>';
//           $('#selMenu').append(html);
//        }
//     }, 'text');
 })

.on('click','#selMenu',function(){
    str=$('#selMenu option:selected').text();
    let ar=str.split(' ');
    $('#menuname').val(ar[1]);
    $('#count').val(1);
    $('#price').val(ar[2]);
  
})

.on('change','#count',function(){
    str=$('#selMenu option:selected').text();
    let ar=str.split(' ');
    p=$('#count').val();
    $('#price').val(ar[2]*p);
	
})

.on('click','#btnReset',function(){
    $('#menuname').val(null);
    $('#count').val(0);
    $('#price').val(null);
    
})

.on('click','#btnAdd',function(){
    total+=parseInt($('#price').val());
    if(menu_code!='') menu_code+=";";
    menu_code+=$('#selMenu option:selected').val();
    console.log(menu_code);
    console.log(total);
    strOrder='<option>'+$('#menuname').val()+' x '+$('#count').val()+' : '+$('#price').val()+'</option>';
//     strOrder=`<option value="${'menuname'}">${a}x${p}=${b}</option>`
    $('#selOrder').append(strOrder);
    $('#total').val(total);
    $('#btnReset').trigger('click');
    
})

.on('click','#btnCancel',function(){
    $("#selOrder").empty();
    $('#mobile').val(null);
    $("#total").val(0);
    
})

.on('click','#btnDone',function(){
		$('#selOrder option').each(function(){
			if($('#total').val() == 0) {
				alert('메뉴를 선택하세요.');
				return false;
			} else {
				str='<option>'+$('#mobile').val()+' '+$(this).text()+'</option>'
				$('#selSales').append(str);
			}
	   		let a=$(this).text();
	   		let rec=a.split(' ');
	   		console.log(rec);
			$.get('salesInsert',{menu_code : rec[0], mobile : $('#mobile').val(), qty : rec[2], total : rec[4]},
					function(txt){},'text');
		})
		$('#selOrder').empty();
		$('#total,#mobile').val('');
// 		total=0;
	})

// .on('click','#btnDone',function(){
// 	code=menu_code.split(';');
// 	menu_code='';
// 	console.log(code);
//     $('#selOrder option').each(function(){
// //     	str='<option>'+$('#mobile').val()+' --- '+$(this).text()+'</option>';
//     	str2=$(this).text().split(' ');
// //     	console.log(str2);
// //     	console.log("qty :"+str2[2]);
// //     	console.log("qty :"+str2[4]);
// 		console.log(str2)
// 		let oParam={mobile:$('#mobile').val(),
// 				 menu_code:code[$(this).index()],
// 				 qty:str2[2],
// 				 total:str2[4]};
// 		console.log(oParam);
//     	$.get('salesInsert',oParam,
//     			function(txt){
// 					console.log('txt ['+txt+']');
// // 	            	if (txt == "")
// // 	                  return false;
// 	            	html='<option>'+$('#mobile').val()+' '+str2.join(' ')+'</option>';
// 	            	console.log('html ['+html+']')
// // 	                $('#selMenu1').append(html); // selMenu1에 넣으면 안됨.
// 	            	$('#selSales').append(html); // 이 코드가 selMenu1추가 자리에 가야함.
// 	            	$('#selOrder').empty();
// 	            	$('#total,#mobile').val('');
// 	            	total=0;

//                 },'text')
// 	});
// })
/*
 .on('click','#btnOrder',function() {
     $('#selOrder option').each(function(){
	$.get('salesInsert', {mobile:mobile,menu_code:code,qty:qty,total:total},function(){
	})
     })
})

 */

.on('click','#btnMenu',function(){ 
            $('#dlgMenu').dialog({
            width:650,
            open:function(){ 
               $.get('select',{},function(txt){
                  if (txt == "")
                     return false;
                  let rec = txt.split(';');
                  for (i = 0; i < rec.length; i++) {
                     let field = rec[i].split(',');
                     let html ='<option>'+field[0]+' '+field[1]+' '+field[2]+'</option>';
                     $('#selMenu1').append(html);
                  }
               })
            },
            close:function(){
               $('#selMenu').empty();
               $('#selMenu1').empty();
               loadMenu();
            }
            });
})


.on('click','#summary',function(){
    $('#dlgSum').dialog({
        width:560,
        open:function(){
        	 $('#dlgSum1').empty();
        	 $('#dlgSum2').empty();
        	$.get('selectclient',{},function(txt){
        		if (txt == "") return false;
                let rec = txt.split(';');
                for (i = 0; i < rec.length; i++) {
                   let field = rec[i].split(',');
                   let html ='<option>'+field[0]+' '+field[1]+'</option>';
                   $('#dlgSum2').append(html);
                }
            }, 'text')
            $.get('selectmenu',{},function(txt) {
    
            	if (txt == "") return false;
                let rec = txt.split(';');
                for (i = 0; i < rec.length; i++) {
                   let field = rec[i].split(',');
                   let html ='<option>'+field[0]+' '+field[1]+' '+field[2]+'</option>';
                   $('#dlgSum1').append(html);
                }
            }, 'text')
         },
         close:function(){
        	 
         }
	});
})


.on('click','#selMenu1',function(){
    let str=$('#selMenu1 option:selected').text();
    let ndx=$('#selMenu1 option:selected').index();
    // 2번 let ndx=$(this).index();
    let ar=str.split(' ');
    $('#menuname').val(ar[0]);
    $('#price').val(ar[1]);
})

.on('click','#btnPlus',function() {
         $('#selMenu1').empty();
               let operation = '';
               if ($('#menu_code').val()=='') {
                  if ($('#_menuname').val()!='' && $('#_price').val() != '') {
                     operation = "insert";
                  } else {
                     alert('입력값이 모두 채워지지 않았습니다.');
                     return false;
                  }
               } else {
                  if ($('#_menuname').val() != '' && $('#_price').val() != '') {
                     operation = "update";          
                  } else {
                     operation = "delete";
                  }
               }
               console.log($('#menu_code').val()+','+$('#_menuname').val()+','+$('#_price').val());
               $.get(operation, {
                  code : $('#menu_code').val(),
                  name : $('#_menuname').val(),
                  price : $('#_price').val()
               }, 
               function(txt) {
                   $('#menu_code,#menuname,price').val("");
                   $.get('select',{},function(txt){
                      if (txt == "")
                         return false;
                      let rec = txt.split(';');
                      for (i = 0; i < rec.length; i++) {
                         let field = rec[i].split(',');
                         html = '<option>'+field[0]+' '+field[1]+' '+field[2]+'</option>';
                         $('#selMenu1').append(html);
                      }
                   })
                   }, 'text');
                   $('#menu_code').val('');
                   $('#menuname').val('');
                   $('#price').val('');
                return false;
});
             
function loadMenu(){
	   $('#selMenu').empty();
       $.get('select',{},function(txt){
          if (txt == "")
             return false;
          let rec = txt.split(';');
          for (i = 0; i < rec.length; i++) {
             let field = rec[i].split(',');
			 let html = '<option>' + field[0] + ' ' + field[1] + ' '
						+ field[2] + '</option>';
             $('#selMenu').append(html);
          }
       });
};

// function Menu(){
// 	$('#selSales').empty();
// 	$.get('selsales',{},function(txt){
// 		if (txt ==""){
// 			return false;
// 		}
// 		let rec = txt.split(';');
// 		for (i = 0; i < rec.length; i++) {
// 			let field = rec[i].split(',');
// 			let html = '<option>' + field[0] + ' ' + field[1] + ' '
// 					+ field[2]+ ' ' + field[3] + ' ' + field[4] +'</option>';
// 			$('#selSales').append(html);
// 		}
// 	})
// }
</script>
</html>