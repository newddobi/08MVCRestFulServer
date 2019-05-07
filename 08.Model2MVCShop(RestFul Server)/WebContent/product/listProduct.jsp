<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title>��ǰ �����ȸ</title>
	
<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">

function fncGetProductList(currentPage){
	document.getElementById("currentPage").value = currentPage;
	document.detailForm.submit();
}
function fncAddZzim(prodNo){
	if(confirm("�� ��Ͽ� �����ðڽ��ϱ�?") == true){
		document.detailForm.action='/product/addZzim?userId=${user.userId}';
		document.getElementById("prodNo").value = prodNo;
		document.detailForm.submit();
	}else{
		return;
	}
	
}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">
			
<form name="detailForm" action="/product/listProduct?menu=${param.menu eq 'manage' ? "manage":"search"}" method="post">
<input type="hidden" id="prodNo" name="prodNo" value="">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
					<c:choose>
						<c:when test="${param.menu eq 'manage'}">
							��ǰ ����
						</c:when>
						<c:when test="${param.menu eq 'search'}">
							��ǰ��� ��ȸ
						</c:when>
						<c:when test="${param.menu eq 'cartList'}">
							��ٱ���
						</c:when>	
					</c:choose>
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td>
			<select name="pageCondition" class="ct_input_g" style="width:80px">
				<option value="" ${ ! empty search.pageSize && search.pageSize.equals("") ? "selected" : "" }>�Խù�����</option>
				<option value="4" ${ ! empty search.pageSize && search.pageSize==4 ? "selected" : "" }>4</option>
				<option value="5" ${ ! empty search.pageSize && search.pageSize==5 ? "selected" : "" }>5</option>
				<option value="6" ${ ! empty search.pageSize && search.pageSize==6 ? "selected" : "" }>6</option>
				<option value="7" ${ ! empty search.pageSize && search.pageSize==7 ? "selected" : "" }>7</option>
				<option value="8" ${ ! empty search.pageSize && search.pageSize==8 ? "selected" : "" }>8</option>
				<option value="9" ${ ! empty search.pageSize && search.pageSize==9 ? "selected" : "" }>9</option>
				<option value="10" ${ ! empty search.pageSize && search.pageSize==10 ? "selected" : "" }>10</option>
			</select>
		</td>
		<td align="right">
			<select name="orderCondition" class="ct_input_g" style="width:80px">
				<option value="" ${ ! empty search.orderCondition && search.orderCondition.equals("") ? "selected" : "" }>���þ���</option>
				<option value="1" ${ ! empty search.orderCondition && search.orderCondition==1 ? "selected" : "" }>�ֱٻ�ǰ</option>
				<option value="2" ${ ! empty search.orderCondition && search.orderCondition==2 ? "selected" : "" }>���ݳ�����</option>
				<option value="3" ${ ! empty search.orderCondition && search.orderCondition==3 ? "selected" : "" }>���ݳ�����</option>
				<option value="4" ${ ! empty search.orderCondition && search.orderCondition==4 ? "selected" : "" }>��ȸ����</option>
			</select>
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
				<option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
				<option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
				<c:if test="${user.userId eq 'admin' && param.menu eq 'manage'}">
					<option value="3" ${ ! empty search.searchCondition && search.searchCondition==3 ? "selected" : "" }>�����</option>
					<option value="4" ${ ! empty search.searchCondition && search.searchCondition==4 ? "selected" : "" }>��ۿϷ�</option>
					<option value="5" ${ ! empty search.searchCondition && search.searchCondition==5 ? "selected" : "" }>���ſϷ�</option>
				</c:if>
			</select>
			<input type="text" name="searchKeyword" value="${! empty search.searchCondition ? search.searchKeyword : "" }" class="ct_input_g" style="width:200px; height:19px" />
		</td>	
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetProductList('1');">�˻�</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
			���ݴ�� ã��
			<input type="text" name="searchMin" value="${! empty search.searchMin ? search.searchMin : "" }" class="ct_input_g" style="width:70px; height:19px" />
			-
			<input type="text" name="searchMax" value="${! empty search.searchMax ? search.searchMax : "" }" class="ct_input_g" style="width:70px; height:19px" />
		</td>
	</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >��ü ${resultPage.totalCount } �Ǽ�, ����  ${resultPage.currentPage } ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="80">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="80">��ǰ��ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="200">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">���</td>		
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<c:set var="i" value="0"/>
	<c:forEach var="product" items="${list }">
		<c:set var="i" value="${i+1 }"/>
		<tr class="ct_list_pop">
			<td align="center">${ i }</td>
			<td></td>			
			<td align="center">${product.prodNo}</td>
			<td></td>
			<td align="center">
			  <c:if test="${product.amount != 0}">
				<c:choose>
					<c:when test="${param.menu eq 'manage'}">
						<a href="/product/updateProductView?prodNo=${product.prodNo}&menu=manage">
					</c:when>
					<c:otherwise>
						<a href="/product/getProduct?prodNo=${product.prodNo }&menu=search">
					</c:otherwise>
				</c:choose>
			  </c:if>
				${product.prodName}</a>
			</td>
			<td></td>
			<td align="center">${product.price}</td>
			<td></td>

			<td align="center">${product.amount}</td>
			<td></td>
			<td align="center">
				<c:choose>
					<c:when test="${product.amount != 0}">
						�Ǹ���&nbsp;
							<c:if test="${user.userId != 'admin' }">
								<a href="javascript:fncAddZzim(${product.prodNo});">���ϱ�</a>
							</c:if>
						</c:when>
					<c:otherwise>
						������
					</c:otherwise>	
				</c:choose>
			</td>	
		</tr>
		<tr>
			<td colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
			<input type="hidden" id="currentPage" name="currentPage" value=""/>
			<jsp:include page="../common/pageNavigator.jsp">
				<jsp:param name="what" value="Product"/>
			</jsp:include>	
			
    	</td>
	</tr>
</table>
<!--  ������ Navigator �� -->
</form>
</div>

</body>
</html>

