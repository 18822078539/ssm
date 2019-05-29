<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 17489
  Date: 2019/5/7
  Time: 11:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.4.4.min.js"></script>

<script>
    $(function aa() {
        var code = $("input[name='code']").val().trim();
        $.ajax({
            url: "${pageContext.request.contextPath }/lostcard/status",
            type: "POST",
            dataType: 'json',
            data: {
                "code": code
            },
            success: function (data) {
                var result = "";
                $.each(data, function (i, el) {
                    result += "<tr>";
                    result += "<td>" + el.code + "</td>";
                    result += "<td>" + el.name + "</td>";
                    result += "<td>" + el.number + "</td>";
                    result += "<td><img class='pimg' src='/pic/" + el.img + "' width=100 height=100></td>";
                    result += "<td>" + el.handle + "</td>";
                    result += "<td>" + el.reviewe + "</td>";
                    result += "<td>" + el.recive + "</td>";
                    result += "<td><a href='${pageContext.request.contextPath}/lostcard/delete?code=" + el.code + "'>完成</a></td>";

                    result += "</tr>";
                });
                $("#list").html(result);
            },
            error: function () {
                alert("失败")
            },

        })
    })
</script>
<head>
    <title>填写挂失表</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 引入 Bootstrap -->
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>填写挂失表</small>
                </h1>
            </div>
        </div>
    </div>
    <form class="form-inline" role="form" action="${pageContext.request.contextPath}/lostcard/lostcard" method="post"
          enctype="multipart/form-data">
        <div class="form-group">
            <label for="code">学号:</label>
            <input type="text" name="code" value=${sessionScope.lost.codeid} class="form-control" id="code"
                   placeholder="请输入学号">
        </div>
        <div class="form-group">
            <label for="name">姓名:</label>
            <input type="text" name="name" value=${sessionScope.lost.name} class="form-control" id="name"
                   placeholder="请输入姓名">
        </div>
        <div class="form-group">
            <label for="number">手机号:</label>
            <input type="text" name="number" value=${sessionScope.lost.number} class="form-control" id="number"
                   placeholder="请输入手机号">
        </div>
    <br>
        <div class="form-group">
            <label for="inputfile">上传身份证:</label>
            <input type="file" name="filename" id="inputfile">
        </div>
        <button type="submit" class="btn btn-default">提交</button>
    </form>
    <div>${success}</div>
    <div>${exist}</div>
    <div>${fall2}</div>
    <div>${shibai}</div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>补办状态查询</small>
                </h1>
            </div>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>学号</th>
                    <th>姓名</th>
                    <th>手机号</th>
                    <th>身份证照片</th>
                    <th>处理</th>
                    <th>审核</th>
                    <th>可否领取</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="list"></tbody>
            </table>
        </div>
    </div>
</div>
</body>
<script>
    $("#click1").click(function () {

        window.location.href = "${pageContext.request.contextPath}/lostcard/back";
    })
</script>

</html>
