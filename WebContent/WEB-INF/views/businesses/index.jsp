<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content" >
        <c:if test="${flush != null}">
            <div id="flush_success">
               <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2>商談状況 一覧</h2>
        <table id="businesses_list">
            <tbody>
                <tr>
                    <th class="business_name">氏名</th>
                    <th class="business_date">日付</th>
                    <th class="business_title">タイトル</th>
                    <th class="business_action">操作</th>
                </tr>
                <c:forEach var="business" items="${businesses}" varStatus="status">
                   <tr class="row${status.count % 2}">
                       <td class="business_name"><c:out value="${business.employee.name}" /></td>
                       <td class="business_date"><fmt:formatDate value='${business.business_date}' /></td>
                       <td class="business_title">${business.title}</td>
                       <td class="business_action"><a href="<c:url value='/businesses/show?id=${business.id}' />">詳細を見る</a></td>
                   </tr>
                </c:forEach>
            </tbody>
        </table>

        <div id="pagination">
             (全 ${businesses_count} 件) <br />
            <c:forEach var="i" begin="1" end="${((businesses_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                          <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href=<c:url value='/businesses/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <p><a href="<c:url value='/businesses/new' />">新規商談の登録</a></p>

</c:param>
</c:import>