<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-header with-border">
							<h3 class="box-title">게시판</h3>
						</div>
						<div class="box-body">
							<div id="board"	class="dataTables_wrapper form-inline dt-bootstrap">
								<table id="boardTable" class="table table-bordered table-hover dataTable" role="grid">
									<thead>
										<tr role="row">
											<th class="sorting_asc" tabindex="0">BNO</th>
											<th class="sorting" tabindex="0">TITLE</th>
											<th class="sorting" tabindex="0">WRITER</th>
											<th class="sorting" tabindex="0">REGDATE</th>
											<th class="sorting" tabindex="0">VIEWCNT</th>
										</tr>
									</thead>
									<tbody id="boardBody">
										<c:choose>
											<c:when test="${result eq null}">
												<td colspan="5" style="text-align:center;">데이터가 없습니다.</td>
											</c:when>
											<c:otherwise>
												<c:forEach items="${result}" var="result1">
													<tr>
														<td>${result1.bno}</td>
														<td><a href='boardRead?bno=${result1.bno}'>${result1.title}</a></td>
														<td>${result1.writer}</td>
														<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
																value="${result1.regdate}" /></td>
														<td><span class="badge bg-red">${result1.viewcnt}</span></td>
												</c:forEach>	
											</c:otherwise>
										</c:choose>
										
									</tbody>
								</table>
							</div>
							<div>
								<a href="/board/boardWrite/">
									<input type="button" style="float:right;" value="글쓰기"/>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</section>
</div>

<%@ include file="../include/footer.jsp"%>