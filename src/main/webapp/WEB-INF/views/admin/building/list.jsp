
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<c:url var="buildingAPI" value="/api/buildings" />
<html>
<head>
    <title>Danh sách tòa nhà</title>
</head>

<body>
    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Home</a>
                    </li>

                    <li>
                        <a href="#">UI &amp; Elements</a>
                    </li>
                    <li class="active">Content Sliders</li>
                </ul><!-- /.breadcrumb -->
            </div>

            <div class="page-content">

                <div class="page-header">
                    <h1>Dashboard</h1>
                </div><!-- /.page-header -->
                <div class="row">
                    <div class="widget-box" style="display: block">
                        <div class="widget-header">
                            <h4 class="widget-title">Tìm kiếm tòa nhà</h4>

                            <span class="widget-toolbar">
										<a href="#" data-action="reload">
											<i class="ace-icon fa fa-refresh"></i>
										</a>

										<a href="#" data-action="collapse">
											<i class="ace-icon fa fa-chevron-up"></i>
										</a>
									</span>
                        </div>

                        <div class="widget-body">
                            <div class="widget-main">
                                <form:form action="/admin/building-list" modelAttribute="modelSearch" method="GET" id="ListForm">
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <div class="form-group" style="display: block;">
                                                <label>Tên tòa nhà</label>
                                                <input type="text" class="form-control" name="name" value="${modelSearch.name}">
                                            </div>
                                        </div>
                                        <div class="col-xs-6">
                                            <div class="form-group" style="display: block;">
                                                <label>Diện tích sàn</label>
                                                <input type="number" class="form-control" name="floorArea" value="${modelSearch.floorArea}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-2">
                                            <div class="form-group" style="display: block;">
                                                <label>Quận</label>
                                                <form:select path="district" class="form-control">
                                                    <form:option value="" label="---Chọn quận---"/>
                                                    <form:options items="${districtCode}"/>
                                                </form:select>
                                            </div>
                                        </div>
                                        <div class="col-xs-5">
                                            <div class="form-group" style="display: block;">
                                                <label>Phường</label>
                                                <input type="text" class="form-control" name="ward" value="${modelSearch.ward}">
                                            </div>
                                        </div>
                                        <div class="col-xs-5">
                                            <div class="form-group" style="display: block;">
                                                <label>Đường</label>
                                                <input type="text" class="form-control" name="street" value="${modelSearch.street}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-4">
                                            <div class="form-group" style="display: block;">
                                                <label>Số tầng hầm</label>
                                                <input type="number" class="form-control" name="numberOfBasement" value="${modelSearch.numberOfBasement}">
                                            </div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="form-group" style="display: block;">
                                                <label>Hướng</label>
                                                <input type="text" class="form-control" name="direction" value="${modelSearch.direction}">
                                            </div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="form-group" style="display: block;">
                                                <label>Hạng</label>
                                                <input type="text" class="form-control" name="level" value="${modelSearch.level}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <div class="form-group" style="display: block;">
                                                <label>Diện tích từ</label>
                                                <input type="number" class="form-control" name="areaFrom" value="${modelSearch.areaFrom}">
                                            </div>
                                        </div>
                                        <div class="col-xs-3">
                                            <div class="form-group" style="display: block;">
                                                <label>Diện tích đến</label>
                                                <input type="number" class="form-control" name="areaTo" value="${modelSearch.areaTo}">
                                            </div>
                                        </div>
                                        <div class="col-xs-3">
                                            <div class="form-group" style="display: block;">
                                                <label>Giá tiền từ</label>
                                                <input type="number" class="form-control" name="rentPriceFrom" value="${modelSearch.rentPriceFrom}">
                                            </div>
                                        </div>
                                        <div class="col-xs-3">
                                            <div class="form-group" style="display: block;">
                                                <label>Giá tiền đến</label>
                                                <input type="number" class="form-control" name="rentPriceTo" value="${modelSearch.rentPriceTo}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-4">
                                            <div class="form-group" style="display: block;">
                                                <label>Tên quản lý</label>
                                                <input type="text" class="form-control" name="managerName" value="${modelSearch.managerName}">
                                            </div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="form-group" style="display: block;">
                                                <label>SĐT quản lý</label>
                                                <input type="text" class="form-control" name="managerPhone" value="${modelSearch.managerPhone}">
                                            </div>
                                        </div>
                                        <div class="col-xs-4">
                                            <div class="form-group" style="display: block;">
                                                <security:authorize access="hasRole('MANAGER')">
                                                    <label>Nhân viên phụ trách</label>
                                                    <form:select path="staffId" class="form-control">
                                                        <form:option value="" label="---Chọn nhân viên---"/>
                                                        <form:options items="${staffs}"/>
                                                    </form:select>
                                                </security:authorize>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <form:checkboxes path="typeCode" items="${typeCodes}"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <button class="btn btn-sm btn-primary" id="btnSearch">
                                                <i class="ace-icon glyphicon glyphicon-search"></i> Tìm kiếm
                                            </button>
                                        </div>
                                    </div>
                                </form:form>

                            </div>
                        </div>
                    </div>
                    <security:authorize access="hasRole('MANAGER')">
                        <div class="pull-right">
                            <a href="/admin/building-edit">
                                <button title="Thêm tòa nhà" class="btn btn-primary">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-fill-add" viewBox="0 0 16 16">
                                        <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                        <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v7.256A4.5 4.5 0 0 0 12.5 8a4.5 4.5 0 0 0-3.59 1.787A.5.5 0 0 0 9 9.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .39-.187A4.5 4.5 0 0 0 8.027 12H6.5a.5.5 0 0 0-.5.5V16H3a1 1 0 0 1-1-1zm2 1.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3 0v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zM4 5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M7.5 5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M4.5 8a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                    </svg>
                                </button>
                            </a>
                            <button title="Xóa tòa nhà" class="btn btn-danger" id="btnDeleteBuildings">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-fill-dash" viewBox="0 0 16 16">
                                    <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                                    <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v7.256A4.5 4.5 0 0 0 12.5 8a4.5 4.5 0 0 0-3.59 1.787A.5.5 0 0 0 9 9.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .39-.187A4.5 4.5 0 0 0 8.027 12H6.5a.5.5 0 0 0-.5.5V16H3a1 1 0 0 1-1-1zm2 1.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3 0v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zM4 5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M7.5 5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M4.5 8a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                </svg>
                            </button>
                        </div>
                    </security:authorize>

                </div>

                <div class="hr hr-18 dotted hr-double"></div>

                <div class="row">
                    <display:table name="buildings.listResult" cellspacing="0" cellpadding="0"
                                   requestURI="/admin/building-list" partialList="true" sort="external"
                                   size="${buildings.totalItems}" defaultsort="2" defaultorder="ascending"
                                   id="buildingList" pagesize="${buildings.maxPageItems}"
                                   export="false"
                                   class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                   style="margin: 3em 0 1.5em;">
                        <display:column title="<fieldset class='form-group'>
												   <input type='checkbox' id='checkAll' class='check-box-element'>
												</fieldset>"
                                        class="center select-cell"
                                        headerClass="center select-cell">
                            <fieldset>
                                <input type="checkbox" name="checkList" value="${buildingList.id}"
                                       id="checkbox_${buildingList.id}" class="check-box-element"/>
                            </fieldset>
                        </display:column>
                        <display:column property="name" title="Tên tòa nhà"/>
                        <display:column property="address" title="Địa chỉ"/>
                        <display:column property="numberOfBasement" title="Số tầng hầm"/>
                        <display:column property="managerName" title="Tên QL"/>
                        <display:column property="managerPhone" title="SĐT QL"/>
                        <display:column property="floorArea" title="D.T sàn"/>
                        <display:column  title="D.T trống"/>
                        <display:column property="rentArea" title="D.tích thuê"/>
                        <display:column property="rentPrice" title="Giá thuê"/>
                        <display:column property="serviceFee" title="Phí dịch vụ"/>
                        <display:column property="brokerageFee" title="Phí môi giới"/>
                        <display:column title="Thao tác">
                            <div>
                                <security:authorize access="hasRole('MANAGER')">
                                    <button
                                            class="btn btn-sm btn-success"
                                            title="Giao tòa nhà"
                                            onclick="assignmentBuilding(${buildingList.id})"
                                    >
                                        <i class="ace-icon glyphicon glyphicon-align-justify"></i>
                                    </button>
                                </security:authorize>
                                <a href="/admin/building-edit-${buildingList.id}" class="btn btn-sm btn-info" title="Sửa tòa nhà">
                                    <i class="ace-icon fa fa-pencil-square-o"></i>
                                </a>
                                <security:authorize access="hasRole('MANAGER')">
                                    <button
                                            class="btn btn-sm btn-danger"
                                            title="Xóa tòa nhà"
                                            onclick="btnDeleteBuilding(${buildingList.id})"
                                    >
                                        <i class="ace-icon glyphicon glyphicon-trash"></i>
                                    </button>
                                </security:authorize>
                            </div>
                        </display:column>
                    </display:table>

                </div>
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->

    <div class="modal fade" id="assignmentBuildingModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Danh sách nhân viên</h4>
                </div>
                <div class="modal-body">
                    <table class="table table-striped table-bordered table-hover" id="staffList">
                        <thead>
                        <tr>
                            <th class="center">
                                Chọn
                            </th>
                            <th class="center">Tên nhân viên</th>
                        </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                    <input type="hidden" id="buildingId" name="buildingId">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="btnAssignBuilding">Giao tòa nhà</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                </div>
            </div>

        </div>
    </div>
    <script>
        const assignmentBuilding = (buildingId) => {
            $('#assignmentBuildingModal').modal();
            $('#buildingId').val(buildingId);
            loadStaffs(buildingId);
        }

        const loadStaffs = (buildingId) => {
            $.ajax({
                type: "GET",
                url: "${buildingAPI}/" + buildingId + "/staffs",
                dataType: "json",
                success: (res) => {
                    var row = '';
                    $.each(res.data, (index, item) => {
                        row += '<tr>';
                        row += '<td class="center"><input type="checkbox" value=' + item.staffId + ' ' + item.checked + '></td>'
                        row += '<td class="text-center">' + item.fullName + '</td>'
                        row += '</tr>'
                    })
                    $('#staffList tbody').html(row);
                },
                error: (res) => {
                    console.log("failed")
                    console.log(res)
                }
            })
        }

        $("#btnAssignBuilding").click((e) => {
            e.preventDefault();
            var data = {};
            data['buildingId'] = $('#buildingId').val();
            var staffs = $('#staffList').find('tbody input[type=checkbox]:checked').map(function() {
                return $(this).val();
            }).get();
            data['staffs'] = staffs;

            $.ajax({
                type: "PUT",
                url: "${buildingAPI}",
                data: JSON.stringify(data),
                contentType: "application/json",
                //dataType: "json",
                success: (res) => {
                    alert("Giao tòa nhà thành công")
                },
                error: (res) => {
                    alert("Giao tòa nhà thất bại")
                }
            })
        })

        $('#btnDeleteBuildings').click((e) => {
            e.preventDefault();
            var data = {};
            var buildingIds = $('#buildingList').find('tbody input[type=checkbox]:checked').map(function() {
                return $(this).val();
            }).get();
            data['buildingIds'] = buildingIds;
            deleteBuilding(data)
        })

        const btnDeleteBuilding = (buildingId) => {
            var data = {};
            data['buildingIds'] = [buildingId];
            deleteBuilding(data)
        }

        const deleteBuilding = (data) => {
            $.ajax({
                type: "DELETE",
                url: "${buildingAPI}",
                data: JSON.stringify(data.buildingIds),
                contentType: "application/json",
                dataType: "text",
                success: (res) => {
                    alert("delete success")
                    window.location.replace("/admin/building-list")
                },
                error: (res) => {
                    console.log("failed")
                    console.log(res)
                }
            })
        }

        $('#btnSearch').click((e) => {
            e.preventDefault();
            $('#ListForm').submit();
        })

    </script>
</body>
</html>
