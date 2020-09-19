<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 86183
  Date: 2020/8/29
  Time: 8:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工列表</title>
    <%
        pageContext.setAttribute("ctp",request.getContextPath());
    %>
    <script type="text/javascript" src="${ctp}/static/js/jquery-1.12.4.min.js"></script>
    <link href="${ctp}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${ctp}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <%--    标题    --%>
        <div class="row">
            <div class="col-md-12">
                <h1>SSM-CRUD</h1>
            </div>
        </div>
        <%--    按钮    --%>
        <div class="row">
            <div class="col-md-4 col-md-offset-8">
                <button class="btn btn-primary">新增</button>
                <button class="btn btn-danger">删除</button>
            </div>
        </div>
        <%--    表格数据    --%>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th>Id</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>

                    <c:forEach items="${pageInfo.list}" var="employee">
                        <tr>
                            <th>${employee.empId}</th>
                            <th>${employee.empName}</th>
                            <th>${employee.gender=="M"?"男":"女"}</th>
                            <th>${employee.email}</th>
                            <th>${employee.department.deptName}</th>
                            <th>
                                <button class="btn btn-primary btn-sm">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    编辑
                                </button>
                                <button class="btn btn-danger btn-sm">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                    删除
                                </button>
                            </th>
                        </tr>
                    </c:forEach>

                </table>
            </div>
        </div>
        <%--    分页    --%>
        <div class="row">
            <%--     分页文字信息       --%>
            <div class="col-md-6">
                当前第${pageInfo.pageNum}页,总${pageInfo.pages}页,总${pageInfo.total}条记录
            </div>
            <%--     分页条信息       --%>
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <c:if test="${pageInfo.pageNum == 1}">
                           <li class="disabled"><a href="#">首页</a></li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum != 1}">
                            <li><a href="${ctp}/emps?pn=1">首页</a></li>
                        </c:if>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <li>
                                <a href="${ctp}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>


                        <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                            <c:if test="${page_Num == pageInfo.pageNum}">
                                <li class="active"><a href="#">${page_Num}</a></li>
                            </c:if>
                            <c:if test="${page_Num != pageInfo.pageNum}">
                                <li><a href="${ctp}/emps?pn=${page_Num}">${page_Num}</a></li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${pageInfo.hasNextPage}">
                            <li>
                                <a href="${ctp}/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum == pageInfo.pages}">
                            <li class="disabled"><a href="#">末页</a></li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum != pageInfo.pages}">
                            <li><a href="${ctp}/emps?pn=${pageInfo.pages}">末页</a></li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

</body>
</html>
