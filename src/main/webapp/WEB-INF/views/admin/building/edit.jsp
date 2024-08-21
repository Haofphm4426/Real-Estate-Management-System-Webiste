
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingEditURL" value="/admin/building-edit"/>
<html>
<head>
    <title>Thông tin tòa nhà</title>
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

                <div class="nav-search" id="nav-search">
                    <form class="form-search">
                        <span class="input-icon">
                            <input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
                            <i class="ace-icon fa fa-search nav-search-icon"></i>
                        </span>
                    </form>
                </div><!-- /.nav-search -->
            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1>Sửa thông tin tòa nhà</h1>
                </div><!-- /.page-header -->

                <div class="row">
                    <form:form modelAttribute="buildingEdit" action="${buildingEditURL}" class="form-horizontal" id="form-edit">
                        <div class="col-xs-12">
                                <div class="form-group">
                                    <div class="col-xs-3">
                                        <label for="">Tên tòa nhà</label>
                                    </div>
                                    <div class="col-xs-9">
<%--                                        <input type="text" class="form-control" name="name">--%>
                                        <form:input path="name" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-3">
                                        <label for="">Quận</label>
                                    </div>
                                    <div class="col-xs-4">
<%--                                        <select name="" id="" class="form-control">--%>
<%--                                            <option value="">---Chọn quận---</option>--%>
<%--                                            <option value="">Quận 1</option>--%>
<%--                                            <option value="">Quận 2</option>--%>
<%--                                            <option value="">Quận 3</option>--%>
<%--                                            <option value="">Quận 4</option>--%>
<%--                                            <option value="">Quận 5</option>--%>
<%--                                        </select>--%>
                                            <form:select path="district" class="form-control">
                                                <form:option value="" label="---Chọn quận---"/>
                                                <form:options items="${districtCode}"/>
                                            </form:select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-3">
                                        <label for="">Phường</label>
                                    </div>
                                    <div class="col-xs-9">
                                        <form:input path="ward" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-3">
                                        <label for="">Đường</label>
                                    </div>
                                    <div class="col-xs-9">
                                        <form:input path="street" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-3">
                                        <label for="">Kết cấu</label>
                                    </div>
                                    <div class="col-xs-9">
                                        <form:input path="structure" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-3">
                                        <label for="">Số tầng hầm</label>
                                    </div>
                                    <div class="col-xs-9">
                                        <input type="number" class="form-control" name="numberOfBasement" value="${buildingEdit.numberOfBasement}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-3">
                                        <label for="">Diện tích sàn</label>
                                    </div>
                                    <div class="col-xs-9">
                                        <input type="number" class="form-control" name="floorArea" value="${buildingEdit.floorArea}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-3">
                                        <label for="">Hướng</label>
                                    </div>
                                    <div class="col-xs-9">
                                        <form:input path="direction" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-3">
                                        <label for="">Hạng</label>
                                    </div>
                                    <div class="col-xs-9">
                                        <form:input path="level" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-3">
                                        <label for="">Diện tích thuê</label>
                                    </div>
                                    <div class="col-xs-9">
                                        <form:input path="rentArea" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-3">
                                        <label for="">Giá thuê</label>
                                    </div>
                                    <div class="col-xs-9">
                                        <input type="number" class="form-control" name="rentPrice" value="${buildingEdit.rentPrice}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-3">
                                        <label for="">Mô tả giá</label>
                                    </div>
                                    <div class="col-xs-9">
                                        <input type="text" class="form-control" name="rentPriceDescription" value="${buildingEdit.rentPriceDescription}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-3">
                                        <label for="">Phí dịch vụ</label>
                                    </div>
                                    <div class="col-xs-9">
                                        <input type="text" class="form-control" name="serviceFee" value="${buildingEdit.serviceFee}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-3">
                                        <label for="">Phí ô tô</label>
                                    </div>
                                    <div class="col-xs-9">
                                        <input type="text" class="form-control" name="carFee" value="${buildingEdit.carFee}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-3">
                                        <label for="">Phí mô tô</label>
                                    </div>
                                    <div class="col-xs-9">
                                        <input type="text" class="form-control" name="motoFee" value="${buildingEdit.motoFee}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-3">
                                        <label for="">Phí ngoài giờ</label>
                                    </div>
                                    <div class="col-xs-9">
                                        <input type="text" class="form-control" name="overtimeFee" value="${buildingEdit.overtimeFee}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-3">
                                        <label for="">Tiền điện</label>
                                    </div>
                                    <div class="col-xs-9">
                                        <input type="text" class="form-control" name="electricityFee" value="${buildingEdit.electricityFee}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-3">
                                        <label for="">Đặt cọc</label>
                                    </div>
                                    <div class="col-xs-9">
                                        <input type="text" class="form-control" name="deposit" value="${buildingEdit.deposit}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-3">
                                        <label for="">Thanh toán</label>
                                    </div>
                                    <div class="col-xs-9">
                                        <input type="text" class="form-control" name="payment" value="${buildingEdit.payment}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-3">
                                        <label for="">Thời hạn thuê</label>
                                    </div>
                                    <div class="col-xs-9">
                                        <input type="text" class="form-control" name="rentTime" value="${buildingEdit.rentTime}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-3">
                                        <label for="">Thời gian trang trí</label>
                                    </div>
                                    <div class="col-xs-9">
                                        <input type="text" class="form-control" name="decorationTime" value="${buildingEdit.decorationTime}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-3">
                                        <label for="">Tên quản lý</label>
                                    </div>
                                    <div class="col-xs-9">
                                        <input type="text" class="form-control" name="managerName" value="${buildingEdit.managerName}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-3">
                                        <label for="">SĐT quản lý</label>
                                    </div>
                                    <div class="col-xs-9">
                                        <input type="text" class="form-control" name="managerPhone" value="${buildingEdit.managerPhone}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-3">
                                        <label for="">Phí môi giới</label>
                                    </div>
                                    <div class="col-xs-9">
                                        <input type="number" class="form-control" name="brokerageFee" value="${buildingEdit.brokerageFee}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-3">
                                        <label for="">Loại tòa nhà</label>
                                    </div>
                                    <div class="col-xs-9">
                                            <form:checkboxes path="typeCode" items="${typeCodes}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-3">
                                        <label for="">Ghi chú</label>
                                    </div>
                                    <div class="col-xs-9">
                                        <input type="text" class="form-control" name="note" value="${buildingEdit.note}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-3">
                                        <label for="">Hình đại diện</label>
                                    </div>
                                    <input class="col-sm-3 no-padding-right" type="file" id="uploadImage"/>
                                    <div class="col-sm-9">
                                        <c:if test="${not empty buildingEdit.image}">
                                            <c:set var="imagePath" value="/repository${buildingEdit.image}"/>
                                            <img src="${imagePath}" id="viewImage" width="300px" height="300px" style="margin-top: 50px">
                                        </c:if>
                                        <c:if test="${empty buildingEdit.image}">
                                            <img src="/admin/image/default.png" id="viewImage" width="300px" height="300px">
                                        </c:if>
                                    </div>
                                </div>

                            <div class="form-group">
                                <label for="" class="col-xs-3"></label>
                                <div class="col-xs-9">
                                    <security:authorize access="hasRole('MANAGER')">
                                        <c:if test="${empty buildingEdit.id}">
                                            <a class="btn btn-primary" id="btnAddOrUpdateBuilding" onclick="handleAddOrUpdateBuilding(null)">
                                                Thêm tòa nhà
                                            </a>
                                        </c:if>
                                        <c:if test="${not empty buildingEdit.id}">
                                            <a class="btn btn-primary" id="btnAddOrUpdateBuilding" onclick="handleAddOrUpdateBuilding(${buildingEdit.id})">
                                                Sửa tòa nhà
                                            </a>
                                        </c:if>
                                    </security:authorize>
                                    <a href="/admin/building-list" class="btn btn-primary">
                                        Hủy thao tác
                                    </a>
                                    <img src="/img/loading.gif" style="display: none; height: 100px" id="loading_image">
                                </div>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>


        </div><!-- /.page-content -->
        <c:forEach var="item" items="${transactionType}">
            <div class="col-xs-12">
                <div class="col-sm-12">
                    <h3 class="header smaller lighter blue">${item.value}</h3>
                    <button class="btn btn-lg btn-primary">
                        <i class="orange ace-icon fa fa-location-arrow bigger-130"></i>Add
                    </button>
                </div>
            </div>
            <c:if test="${item.key == 'CSKH'}">
                <div class="col-xs-12">
                    <table id="simple-table" class="table table-stripped table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Ngày tạo</th>
                                <th>Người tạo</th>
                                <th>Ngày sửa</th>
                                <th>Người sửa</th>
                                <th>Chi tiết giao dịch</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </c:if>
        </c:forEach>
    </div>
    <script>
        var imageBase64 = '';
        var imageName = '';
        const handleAddOrUpdateBuilding = (id) => {
            var data = {id: id};
            var typeCode = []
            var formData = $('#form-edit').serializeArray();

            $.each(formData, (i, it) => {
                if(it.name !== 'typeCode') {
                    data[it.name] = it.value;
                }
                else {
                    typeCode.push(it.value)
                }
                if ('' !== imageBase64) {
                    data['imageBase64'] = imageBase64;
                    data['imageName'] = imageName;
                }
            })
            data['typeCode'] = typeCode
            if(typeCode.length === 0) {
                alert("Thiếu loại toà nhà")
                return;
            }
            if(data.rentArea === '') {
                alert("Thiếu diện tích thuê")
                return;
            }
            btnAddOrUpdate(data);

        }

        $('#uploadImage').change(function (event) {
            var reader = new FileReader();
            var file = $(this)[0].files[0];
            reader.onload = function(e){
                imageBase64 = e.target.result;
                imageName = file.name; // ten hinh khong dau, khoang cach. Dat theo format sau: a-b-c
            };
            reader.readAsDataURL(file);
            openImage(this, "viewImage");
        });

        function openImage(input, imageView) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#' +imageView).attr('src', reader.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        const btnAddOrUpdate = (data) => {
            $('#loading_image').show();
            $.ajax({
                type: "POST",
                url: "/api/buildings",
                data: JSON.stringify(data),
                contentType: "application/json",
                dataType: "text",
                success: (res) => {
                    alert("Thêm tòa nhà thành công")
                    window.location.replace("/admin/building-list")
                },
                error: (res) => {
                    console.log("failed")
                    console.log(res)
                }
            })
        }






    </script>
</body>
</html>
