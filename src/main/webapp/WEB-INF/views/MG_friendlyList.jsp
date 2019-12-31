<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/3/26
  Time: 20:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>明高网站后台</title>
    <%
        String rootPath = request.getContextPath();
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    %>
    <link rel="stylesheet" href="<%=rootPath%>/css/cssresets.css">
    <link rel="stylesheet" href="<%=rootPath%>/css/iconfont.css">
    <link rel="stylesheet" href="<%=rootPath%>/css/style.css">
    <link rel="stylesheet" href="<%=rootPath%>/css/laydate.css">
    <link rel="shortcut icon" href="<%=rootPath%>/image/favicon.ico" />
    <link rel="bookmark" href="<%=rootPath%>/image/favicon.ico"　/>
    <script type="text/javascript" src="<%=rootPath%>/scripts/webstyle/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="<%=rootPath%>/scripts/webstyle/laydate.js"></script>
    <script type="text/javascript" src="<%=rootPath%>/scripts/webstyle/iconfont.js"></script>
    <script type="text/javascript" src="<%=rootPath%>/scripts/webstyle/jquery.Modal.js"></script>
    <script type="text/javascript" src="<%=rootPath%>/scripts/checkstyle.js"></script>
</head>
<body class="MG-layout-body">
<div class="MG-layout MG-layout-admin">
    <!--header-->
    <header class="header-page MG-header"></header>
    <!--left-->
    <section class="MG-side">
        <div class="MG-side-scroll">
            <ul id="menu1" class="menu-xt">
                <li>
                    <svg class="icon svg-icon" aria-hidden="true">
                        <use xlink:href="#iconjibenxinxi"></use>
                    </svg>
                    <a href="<%=basePath%>/index">基本信息</a>
                </li>
                <li>
                    <svg class="icon svg-icon" aria-hidden="true">
                        <use xlink:href="#iconhuandengpian"></use>
                    </svg>
                    <a href="<%=basePath%>/page/MG_slide">幻灯片</a>
                </li>
                <%--<li>--%>
                    <%--<span class="icon-xf"></span>--%>
                    <%--<a href="MG_suspended.html">悬浮窗管理</a>--%>
                <%--</li>--%>
                <li >
                    <svg class="icon svg-icon" aria-hidden="true">
                        <use xlink:href="#iconlanmupeizhi"></use>
                    </svg>
                    <a href="<%=basePath%>/page/MG_columnList">栏目管理</a>
                </li>
                <li>
                    <span class="icon-mb"></span>
                    <a href="<%=basePath%>/page/MG_templateList">模板管理</a>
                </li>
                <li >
                    <svg class="icon svg-icon" aria-hidden="true">
                        <use xlink:href="#iconliucheng"></use>
                    </svg>
                    <a href="<%=basePath%>/page/MG_process">流程管理</a>
                </li>
                <li>
                    <span class="icon-yh"></span>
                    <a href="<%=basePath%>/page/MG_userlist">用户管理</a>
                </li>
                <li>
                    <span class="icon-lxwm"></span>
                    <a href="<%=basePath%>/page/MG_contactMe">联系我们</a>
                </li>
                <li class="select">
                    <svg class="icon svg-icon" aria-hidden="true">
                        <use xlink:href="#iconGroup-"></use>
                    </svg>
                    <a href="<%=basePath%>/page/MG_friendlyList">友情链接</a>
                </li>
                <%--<li>--%>
                    <%--<svg class="icon svg-icon" aria-hidden="true">--%>
                        <%--<use xlink:href="#icongenggaimima"></use>--%>
                    <%--</svg>--%>
                    <%--<a href="<%=basePath%>/page/MG_changePassword">更改密码</a>--%>
                <%--</li>--%>
            </ul>
        </div>
    </section>
    <section class="MG-body">
        <div class="page-title">
            <h1 class="title-left">友情链接</h1>

            <input id="ImgName" type="text" placeholder="链接类型">

            <input type="button" onclick="updatetable(1)" value="" class="search-btn">

            <a class="btn-add" id="btn-add" href="javascript:openDiv();">新增</a>

        </div>

        <table class="table2" cellpadding="0" cellspacing="0">
            <thead>
            <tr>
                <%--<th style="width: 100px;"></th>--%>
                <th>链接类型</th>
                <th width="16%">操作</th>
            </tr>
            </thead>
            <tbody id="livetable">

            </tbody>
        </table>

        <div class="pagination">
            <div class="pull-left paging">
                <select id="changePageSize" onchange="updatetable(1)">
                    <option value="15">15</option>
                    <option value="30">30</option>
                    <option value="60">60</option>
                    <option value="120">120</option>
                </select>
                &nbsp;&nbsp;第<span id="_indexNum"></span>
                /<span id="_totalPageSpan"></span>
                页&nbsp;&nbsp;
                <ul>
                    <li>
                        <i title="首页" id="disa0" class="page-icon1" onclick="skippage(0)"></i>
                    </li>
                    <li>
                        <i title="首页" id="disa1" class="page-icon2" onclick="skippage(1)"></i>
                    </li>
                    <li>
                        <span><input id="skipnum" maxlength="3" type="text"  ></span>
                    </li>
                    <li>
                        <i title="首页" id="disa2" class="page-icon3" onclick="skippage(2)"></i>
                    </li>
                    <li>
                        <i title="首页" dis="disa3" class="page-icon4" onclick="skippage(3)"></i>
                    </li>
                </ul>
            </div>
            <div class="pull-right">
                <span id="maxnum" align="right"></span>
            </div>
        </div>
    </section>
</div>
<div id="modalDiv" >
    <div id="popContainer" class="MG-modal">
        <div id="checkName" class="MG-modal-title" id="divtitle" >
            新增
        </div>
        <div class="MG-modal-body" >
            <table class="table-dialog " cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <label>链接类型<span>*</span>:</label>
                        <input id="linkType" type="text" placeholder="" maxlength="50">
                        <input id="frlinkId" type="hidden" >
                    </td>
                </tr>
            </table>
        </div>
        <div class="MG-modal-bottom">
            <button  class="btn-upload" onclick="post();"><strong>保存</strong ></button >
            <button  class="btn-upload btn-bg-dark" onclick ="closeDiv();">取消</button >
        </div>
        <a href="javascript:void(0);" class="close-MG-modal" onclick ="closeDiv();"></a >
    </div>
</div>
</body>
<script>
    var pageindex=1;     //当前的分页的下标页
    var maxindexnum=0;   //当前页面所存在数据支持的最大分页的下标页
    var temp=undefined;

    $('#skipnum').bind('keyup', function(event) {
        if (event.keyCode == "13") {
            //回车执行查询
            blurFunc();
        }
    });

    $('#ImgName').bind('keyup', function(event) {
        if (event.keyCode == "13") {
            //回车执行查询
            updatetable(1);
        }
    });


    $(function(){
        //头部页面加载
        $(".header-page").load("<%=basePath%>/page/header");
        updatetable();
    });

    //日历控件调用
    $('.test-date').each(function(){
        laydate.render({
            elem: this
        });
    });

    function updatetable(testType){ //对列表的数据进行更新的函数
        var ImgName=$("#ImgName").val();

        if(testType==1){
            $("#skipnum").val("1");
            pageindex=1;
        }

        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/FriLinkType/getFriLinkTypeList",
            data:{
                currentpage:pageindex,
                pageSize:$("#changePageSize").val(),
                ImgName:ImgName
            },
            success:function(result){
                if(result.FriLinkTypeList == null){
                    alert("所选区间超越数据极限");
                    return;
                }

                $("#livetable").empty();
                var xx=new Array("linkType","frlinkId");
                var htmltable=getMessage(result.FriLinkTypeList,xx,2);
                $("#_indexNum").text(pageindex);
                $("#livetable").html(htmltable);
                setMaxindex(result,parseInt($("#changePageSize").val()));
            }
        })
    }


    //分页一直位于内容底部
    function setheight() {
        var container=document.getElementById('container');
        var cliHeight = document.documentElement.clientHeight;
        // 如果 #right 小于屏幕的高度, 则设置 #main 的高度为屏幕高度
        // 同时, #left 让它有滚动条
        if($('.right').outerHeight() < cliHeight){
            $(container).css('height', cliHeight  - 100 + 'px');
            /*$('.left').css( {'overflow-y':'scroll', 'height':cliHeight-113+'px'} );*/
        }
    }
    setheight();


    function  openDiv(){
        $("#checkName").html("新增");
        $("#linkType").css("border","");
        clear();
        $.openMgModal("popContainer",{closeClickOverlay:true,width:400,height:200});
    }
    function closeDiv(){
        $.closeMgModal("popContainer");
        clear();
        updatetable();
    }

    function post(id){

        $("#linkType").css("border","");


        if($("#linkType").val().indexOf("&nbsp")>-1){
            alert("非法字符！");
            $("#linkType").css("border","1px solid red");
            return;
        }

        if(temp != undefined){
            uncheckcode(temp);
        }

        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/FriLinkType/setFriTypeMessage",
            data:{
                frlinkId:$("#frlinkId").val(),
                linkType:$("#linkType").val()
            },
            success:function(result){
                if(result !== "" && result !==3 && result !==0 && result !==1){
                    checkcode(result);
                    temp=result;
                }else if(result === 3){
                    alert("保存失败，类型名称已经存在，请重新输入");
                    $("#linkType").css("border","1px solid red");
                }else if(result === 0 || result === 1){
                    temp=undefined;
                    alert("操作成功");
                    closeDiv();
                    window.location.reload();
                }else{
                    alert("会话过期，请重新登录");
                }
            }
        })
    }

    function upda(id){
        openDiv();
        $("#checkName").html("修改");
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/FriLinkType/getFriLinkTypeSingle",
            data:{
                frlinkId:id
            },
            success:function(result){
                $("#frlinkId").val(result.frlinkId);
                $("#linkType").val(result.linkType);
            }
        })
    }


    function del(id){
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/FriLinkType/deleteMessage",
            data:{
                frlinkId:id
            },
            success:function(result){
                if(result != null){
                    alert("操作成功");
                    updatetable();
                }
            }
        })
    }

    function set(id){
        window.location.href ="${pageContext.request.contextPath}/FriLinkType/updatePage?updateid="+id;
    }

    function clear(){
        $("#frlinkId").val("");
        $("#linkType").val("");
    }

</script>
</html>