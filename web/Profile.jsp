<%-- 
    Document   : Profile
    Created on : 31 Oct, 2023, 8:05:34 AM
    Author     : HP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@page import="java.text.Normalizer" %>
    <%@page import="java.util.regex.Pattern"%>
    <%@page import="DAL.*" %>
    <%@page import="Models.*" %>
    <%@page import="java.util.*" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <link rel="stylesheet" href="./style.css">
        <link rel="stylesheet" type="text/css" href="path/to/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer">
    </head>
    <body>
        <%@include file="./Header.jsp" %>
        <section>
            <div class="w-60 m-auto">
                <h1 class="my-4">Profile</h1>
                <div class="mt-5">
                    <ul class="d-flex py-4 border-top border-bottom text-center px-3">
                        <c:forEach var="service" items="${listService}">
                            <li class="me-5">
                                <a href="profile?Service=${service}"
                                   <c:if test="${service == current}">
                                       style="border-bottom: 5px solid var(--pink-color); text-decoration: none;"
                                   </c:if>
                                   <c:if test="${service != current}">
                                       style="text-decoration: none;"
                                   </c:if>
                                   class="fs-3 text-dark">${service}</a>
                            </li>
                        </c:forEach>

                    </ul>
                </div>
                <div class="">
                    <!-- Message of action -->
                    <c:if test="${isSuccess != null}">
                        <div class="fs-4 alert ${isSuccess ? 'alert-success' : 'alert-danger'}" role="alert">
                            ${mess}
                        </div>
                    </c:if>

                    <!-- Form for Account Info -->
                    <c:if test="${'Account info'.equals(current)}">
                        <form action="profile" method="post">
                            <input name="Service" value="updateInfo" type="hidden">
                            <div class="h-100vh mt-5">
                                <h1 class="fw-bold">Account information</h1>
                                <div class="row py-5">
                                    <div class="col-md-3 h-100">
                                        <div class="account-img position-relative">
                                            <c:choose>
                                                <c:when test="${account.account_image == null}">
                                                    <img src="./images/avata.jpg" alt="" id="boxImage">
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="./images/${account.account_image}" alt="" id="boxImage">
                                                </c:otherwise>
                                            </c:choose>
                                            <div class="change-userImg">
                                                <i class='bx bx-image-add fs-3'></i>
                                                <span>Change image</span>
                                            </div>
                                            <input type="file" 
                                                   onchange="inputImage(this)"
                                                   accept="image/gif, image/jpeg, image/png, image/jpg"
                                                   class="input-userImg"
                                                   name="accountImage">
                                            <input value="${account.account_image}" name="beforeImage" type="hidden"/>
                                        </div> 

                                        <script>
                                            function inputImage(input) {
                                                if (input.files && input.files[0]) {
                                                    const reader = new FileReader();
                                                    reader.onload = function (e) {
                                                        document.getElementById('boxImage').src = e.target.result;
                                                    }
                                                    reader.readAsDataURL(input.files[0]);
                                                }
                                            }
                                        </script>

                                    </div>
                                    <div class="col-md-9">
                                        <div class="user-info">
                                            <div class="mt-5">
                                                <h3 class="fw-medium">First name</h3>
                                                <div class="input-group flex-nowrap">
                                                    <input type="text" name="first_name"
                                                           value="${account.first_name}" class="form-control px-4 py-3 fs-3 rounded-xl" placeholder="First name">
                                                </div>
                                            </div>
                                            <div class="mt-5">
                                                <h3 class="fw-medium">Last name</h3>
                                                <div class="input-group flex-nowrap">
                                                    <input type="text" name="last_name"
                                                           value="${account.last_name}" class="form-control px-4 py-3 fs-3 rounded-xl" placeholder="Last name">
                                                </div>
                                            </div>

                                            <div class="mt-5" style="color: black;">
                                                <h3>Email</h3>
                                                <div class="input-group mb-3 rounded-xl">
                                                    <span class="input-group-text p-4" id="basic-addon1">
                                                        <i class="fa-regular fa-envelope fs-3" style="color: #808080;"></i>
                                                    </span>
                                                    <input type="text" name="account_email" readonly value="${account.email}" class="form-control px-4 py-3 fs-3" placeholder="Email" aria-label="Email" aria-describedby="basic-addon1" style="color: #808080;">
                                                </div>
                                            </div>

                                            <div class="mt-5">
                                                <h3>Address</h3>
                                                <div class="input-group mb-3 rounded-xl">
                                                    <span class="input-group-text p-4" id="basic-addon1">
                                                        <i class="fa-solid fa-location-dot fs-3"></i>
                                                    </span>
                                                    <input type="text" name="account_address"
                                                           value="${account.address}" class="form-control px-4 py-3 fs-3" placeholder="Address" aria-label="Address" aria-describedby="basic-addon1">
                                                </div>
                                            </div>

                                            <div class="mt-5" style="color: black;">
                                                <h3>Gender</h3>
                                                <div class="input-group mb-3 rounded-xl">
                                                    <span class="input-group-text p-4" id="basic-addon1">
                                                        <i class="fa-solid fa-user fs-3" style="color: #808080;"></i>
                                                    </span>
                                                    <input type="text" name="gender" readonly value="${account.gender}" class="form-control px-4 py-3 fs-3" placeholder="Gender" aria-label="Gender" aria-describedby="basic-addon1" style="color: #808080;">
                                                </div>
                                            </div>


                                            <div class="mt-5">
                                                <h3>Phone</h3>
                                                <div class="input-group mb-3 rounded-xl">
                                                    <span class="input-group-text p-4" id="basic-addon1">
                                                        <i class="fa-solid fa-phone fs-3"></i>
                                                    </span>
                                                    <input type="text" name="account_phone"
                                                           value="${account.phone}"  class="form-control px-4 py-3 fs-3" placeholder="Phone" aria-label="Phone" aria-describedby="basic-addon1">
                                                </div>
                                            </div>



                                            <div class="mt-5">
                                                <h3>About you</h3>
                                                <div class="input-group mb-3">
                                                    <textarea name="account_description" id="account_description" cols="30" rows="10" class="w-100" style="font-size: 16px;">${account.description}</textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mt-5">
                                            <button type="submit" class="border-0 px-5 py-4 fs-4 bg-dark text-white rounded-xl fw-bold">Update information</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </c:if>

                    <!-- Form for Change Password -->
                    <c:if test="${'Change password'.equals(current)}">
                        <div class="h-100vh mt-5">
                            <h1 class="fw-bold">Update your password</h1>
                            <div class="row py-5">
                                <div class="col-md-12">
                                    <form action="profile" method="post">
                                        <input name="Service" value="updatePassword" type="hidden" />
                                        <div class="change-password">
                                            <div class="mt-5">
                                                <h3 class="fw-medium">Current password</h3>
                                                <div class="input-group flex-nowrap">
                                                    <input type="password" name="currentPassword"
                                                           class="form-control px-4 py-3 fs-3 rounded-xl" placeholder="Current password">
                                                </div>
                                            </div>
                                            <div class="mt-5">
                                                <h3 class="fw-medium">New password</h3>
                                                <div class="input-group flex-nowrap">
                                                    <input type="password" name="newPassword"
                                                           class="form-control px-4 py-3 fs-3 rounded-xl" placeholder="New password">
                                                </div>
                                            </div>
                                            <div class="mt-5">
                                                <h3 class="fw-medium">Confirm password</h3>
                                                <div class="input-group flex-nowrap">
                                                    <input type="password" name="confirmPassword"
                                                           class="form-control px-4 py-3 fs-3 rounded-xl" placeholder="Confirm password">
                                                </div>
                                            </div>
                                            <div class="mt-5">
                                                <button type="submit" class="border-0 px-5 py-4 fs-4 bg-dark text-white rounded-xl fw-bold">Update password</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <!--My Order-->

                    <c:if test="${requestScope.current.equals('My order')}">
                        <c:forEach var="order" items="${myOrder}">
                            <div class="box-shadow1 py-2 px-3 rounded-sm mt-5 d-flex flex-column">
                                <c:choose>
                                    <c:when test="${order.status eq 'process'}">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div>
                                                <span class="fs-3 fw-bold">Status: </span> 
                                                <span class="text-warning fs-4">${order.status}</span>
                                            </div>
                                            <span class="ms-auto fs-4 fw-medium text-black">Order date: ${order.order_date}</span>
                                        </div>
                                    </c:when>
                                    <c:when test="${order.status eq 'wait'}">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div>
                                                <span class="fs-3 fw-bold">Status: </span> 
                                                <span class="text-danger fs-4">${order.status}</span>
                                            </div>
                                            <span class="ms-auto fs-4 fw-medium text-black">Order date: ${order.order_date}</span>
                                        </div>
                                        <!-- Add button to cancel order -->
                                        <form action="profile" method="post" style="margin-left: 10px;">
                                            <input type="hidden" name="Service" value="updateStatus">
                                            <input type="hidden" name="oId" value="${order.o_id}">
                                            <input type="hidden" name="status" value="cancel">
                                            <button type="submit" class="btn btn-danger">Cancel Order</button>
                                        </form>
                                    </c:when>
                                    <c:when test="${order.status eq 'done'}">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div>
                                                <span class="fs-3 fw-bold">Status: </span> 
                                                <span class="text-success fs-4">${order.status}</span>
                                            </div>
                                            <span class="ms-auto fs-4 fw-medium text-black">Order date: ${order.order_date}</span>
                                        </div>
                                        <div class="d-flex justify-content-end mt-2">
                                            <span class="fs-4 fw-medium text-black">Receive date: ${order.receive_date}</span>
                                        </div>
                                    </c:when>
                                    <c:when test="${order.status eq 'cancel'}">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div>
                                                <span class="fs-3 fw-bold">Status: </span> 
                                                <span class="text-secondary fs-4">${order.status}</span>
                                            </div>
                                            <span class="ms-auto fs-4 fw-medium text-black">Order date: ${order.order_date}</span>
                                        </div>
                                    </c:when>
                                </c:choose>
                            </div>

                            <!-- Khởi tạo biến để tính tổng giá trị đơn hàng -->
                            <c:set var="totalOrderPrice" value="0" scope="page"/>

                            <c:forEach var="orderItem" items="${myOrderItem}">
                                <c:if test="${order.o_id == orderItem.o_id}">
                                    <div class="h-100vh mt-5">
                                        <div class="col-md-12 border-end border-start pe-5">
                                            <div class="row order-item pb-5">
                                                <div class="col-2">
                                                    <a href="BookDetail?Pid=${orderItem.getBook().id}" class="d-block h-100">
                                                        <img src="${orderItem.getBook().image}" alt="" class="rounded-lg object-fit-cover">
                                                    </a>
                                                </div>
                                                <div class="col-9 d-flex flex-fill flex-column justify-content-between ">
                                                    <div class="h-50 d-flex align-items-center justify-content-between flex-fill">
                                                        <div class="">
                                                            <h3 class="fw-bold">${orderItem.getBook().name}</h3>
                                                            <div class="d-flex align-items-center position-relative hover-change">
                                                                <div class="">
                                                                    <i class="fa-solid fa-fill-drip me-3"></i>
                                                                    <span class="text-black"> a </span>
                                                                </div>
                                                                <div class="border-line border-l mx-3"></div>
                                                                <div class="">
                                                                    <i class="fa-solid fa-store me-3"></i>
                                                                    <span class="text-black"> FPT </span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="">
                                                            <span class="fs-4">$ ${orderItem.price}</span>
                                                        </div>
                                                        <div class="d-flex align-items-center">
                                                            <label class="quantity-label d-block">Quantity:</label>
                                                            <div class="box-input">
                                                                <button class="border-0 bg-white" onclick="decreaseValue()" style="display: none;">
                                                                    <a class="p-3 text-black"><i class="fa-solid fa-minus fs-5"></i></a>
                                                                </button>
                                                                <input type="text" value="${orderItem.quantity}" class="input-number" id="numberValue" readonly />
                                                                <button class="border-0 bg-white" onclick="increaseValue()" style="display: none;">
                                                                    <a class="p-3 text-black"><i class="fa-solid fa-plus fs-5"></i></a>
                                                                </button>
                                                            </div>
                                                        </div>
                                                        <div class="fs-4">
                                                            <span class="text-danger">Total: $ ${orderItem.orderItemPrice()}</span>
                                                        </div>
                                                    </div>
                                                    <div class="h-50 d-flex align-items-center justify-content-between">
                                                        <c:if test="${orderItem.getDiscount() > 0}">
                                                            <span class="text-white p-1 mx-2 fs-5 fw-bold bg-danger tag-sale">sale ${orderItem.getDiscount()}%</span>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Cộng dồn giá trị của từng sản phẩm vào tổng giá trị đơn hàng -->
                                    <c:set var="totalOrderPrice" value="${totalOrderPrice + orderItem.orderItemPrice()}" scope="page"/>
                                </c:if>
                            </c:forEach>

                            <!-- Hiển thị tổng giá trị đơn hàng với viền đen -->
                            <div class="mt-4 text-end fs-4 fw-bold" style="border: 2px solid black; padding: 10px; display: inline-block;">
                                Total Order Price: $ ${totalOrderPrice}
                            </div>
                        </c:forEach>
                    </c:if>

                </div>
            </div>
        </section>
        <%@include file="./Footer.jsp" %>
    </body>
</html>
<!--<CSS>-->

<style>
    .btn {
        font-size: 16px;
        padding: 10px 20px;
        border: none;
        cursor: pointer;
        border-radius: 5px;
        transition: background-color 0.3s, box-shadow 0.3s;
    }

    .btn-danger {
        background-color: #dc3545;
        color: white;
    }

    .btn-danger:hover {
        background-color: #c82333;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    .btn-danger:active {
        background-color: #bd2130;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    }
    .quantity-label {
        font-weight: bold;
        color: #ff00a6;
        font-size: 15px; /* Thay đổi cỡ chữ theo ý muốn */
    }
    .total-order-price {
        border: 2px solid black; /* Đóng khung viền đen */
        padding: 10px; /* Thêm khoảng cách bên trong khung viền */
        display: inline-block; /* Hiển thị dưới dạng khối inline để phù hợp với nội dung */
    }
</style>
