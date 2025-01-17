<%-- 
    Document   : InsertProduct
    Created on : 21 Oct, 2023, 9:35:13 PM
    Author     : HP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.Normalizer" %>
<%@page import="java.util.regex.Pattern" %>
<%@page import="DAL.*" %>
<%@page import="Models.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Insert product</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
        <link rel="stylesheet" href="./style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer"
              />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script>

        </script>

    </head>
    <body>
        <%@include file="./Header.jsp" %>
        <section class="bg-weak">
            <div class="container bg-white">
                <form action="ManageProduct" method="post" enctype="multipart/form-data">
                    <div class="row px-5">
                        <div class="col-md-5 mt-5">
                            <h2 class="my-5 fw-bold">Image Book</h2>
                            <div class="">
                                <div class="border-dotted p-5 d-flex flex-column box-input-image w-90 position-relative justify-content-center">
                                    <i class='bx bx-image-add fs-1 text-danger'></i>
                                    <span class="text-danger fs-3">Add Image</span>
                                    <input type="file" 
                                           name="file"
                                           accept="image/gif, image/jpeg, image/png"
                                           onchange="inputImage(this)"
                                           class="form-control w-100 h-100 position-absolute top-0 start-0" style="z-index: 100; opacity: 0;" name="photo" placeholder="Enter photo">
                                    <img src="" alt="" class="position-absolute start-0" id="boxImage"/>

                                    <!-- <input onchange="chooseFile(this)" type="file" accept="image/gif, image/jpeg, image/png" class="w-100 bg-danger h-100 position-absolute top-0 end-0 opacity-0"> -->
                                </div>
                            </div>
                        </div>
                        <div class="col-md-7 mt-5">
                            <div>
                                <h2 class="my-5">INFORMATION PRODUCT</h2>
                                <div class="my-5">
                                    <div class="row mb-4 d-flex align-items-center">
                                        <div class="col-md-2 text-end">
                                            <label class="fs-4" for="product-name">Name</label>
                                        </div>
                                        <div class="col-md-10 insert-product-input">
                                            <input type="text" id="product-name" 
                                                   class="rounded-sm border w-100 fs-3 py-4 px-3" 
                                                   name="productName"
                                                   placeholder="Product name"/>  
                                        </div>
                                    </div>
                                    <div class="row mb-4 d-flex align-items-center">
                                        <div class="col-md-2 text-end px-3">
                                            <label class="fs-4" for="product-type">Category</label>
                                        </div>
                                        <div class="col-md-10">
                                            <select class="form-select py-3 fs-3" aria-label="Default select example"
                                                    name="category">
                                                <c:forEach var="category" items="${requestScope.listCategory}">
                                                    <option value="${category.category_id}">${category.category_name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row mb-4 d-flex align-items-center">
                                        <div class="col-md-2 text-end">
                                            <label class="fs-4" for="product-author">Author</label>
                                        </div>
                                        <div class="col-md-10 insert-product-input">
                                            <input type="text" id="product-author" 
                                                   class="rounded-sm border w-100 fs-3 py-4 px-3" 
                                                   name="author"
                                                   placeholder="Author name"/>  
                                        </div>
                                    </div>
                                    <div class="row mb-4 d-flex align-items-center">
                                        <div class="col-md-2 text-end">
                                            <label class="fs-4" for="product-price">Price</label>
                                        </div>
                                        <div class="col-md-10 insert-product-input">
                                            <input type="number" min="0" id="product-price"
                                                   name="pro_price"
                                                   class="rounded-sm border w-100 fs-3 py-4 px-3" placeholder="Price"/>  
                                        </div>
                                    </div>
                                    <div class="row mb-4 d-flex align-items-center">
                                        <div class="col-md-2 text-end">
                                            <label class="fs-4" for="product-quantity">Quantity</label>
                                        </div>
                                        <div class="col-md-10 insert-product-input">
                                            <input type="number" min="0" id="product-quantity"
                                                   name="quantity"
                                                   class="rounded-sm border w-100 fs-3 py-4 px-3" placeholder="Quantity"/>  
                                        </div>
                                    </div>
                                    <div class="row mb-4 d-flex align-items-center">
                                        <div class="col-md-2 text-end">
                                            <label class="fs-4" for="product-publisher">Publisher</label>
                                        </div>
                                        <div class="col-md-10 insert-product-input">
                                            <input type="text" id="product-publisher" 
                                                   class="rounded-sm border w-100 fs-3 py-4 px-3" 
                                                   name="publisher"
                                                   placeholder="Publisher"/>  
                                        </div>
                                    </div>
                                    <div class="row mb-4 d-flex align-items-center">
                                        <div class="col-md-2 text-end">
                                            <label class="fs-4" for="product-pages">Number of Pages</label>
                                        </div>
                                        <div class="col-md-10 insert-product-input">
                                            <input type="number" id="product-pages" 
                                                   class="rounded-sm border w-100 fs-3 py-4 px-3" 
                                                   name="numberPage"
                                                   placeholder="Number of Pages"/>  
                                        </div>
                                    </div>
                                    <div class="row mb-4 d-flex align-items-center">
                                        <div class="col-md-2 text-end">
                                            <label class="fs-4" for="product-language">Language</label>
                                        </div>
                                        <div class="col-md-10 insert-product-input">
                                            <input type="text" id="product-language" 
                                                   class="rounded-sm border w-100 fs-3 py-4 px-3" 
                                                   name="language"
                                                   placeholder="Language"/>  
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="Service" value="addProduct">
                    <div class="row py-5">
                        <button type="submmit" href="/cartegories.html" 
                                name="add"
                                value="add"
                                class="d-block mx-auto w-25 px-4 py-4
                                border-0 rounded-sm min-w20 text-center bg-success
                                text-white shadow-lg">
                            <span class="fs-3 fw-semibold">Insert</span>
                        </button>
                    </div>
                </form>
            </div>
        </section>
        <script>
            function inputImage(input) {
                var filePath = input.value;
                var fileName = filePath.split('\\').pop();

                var imagePreview = document.getElementById('boxImage');
                imagePreview.src = "./images/" + fileName;
                console.log(fileName);
            }
        </script>
        <!-- <script src="./js/app.js"></script> -->
    </body>
</html>
