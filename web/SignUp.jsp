<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign up</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" href="./style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <style>
        .form-login-container {
            min-height: 800px; /* Adjust this value as needed */
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .form-control-custom {
            width: 100%;
            padding: 1.5rem 0;
            outline: 0;
            border: 0;
            border-bottom: 1px solid #ced4da;
            font-size: 1.25rem;
        }
        .form-control-custom::placeholder {
            font-size: 1.25rem;
        }
    </style>
</head>

<body>
    <section id="header" class="header-login">
        <div class="container">
            <div class="row align-items-center h-78">
                <div class="col-md-1">
                    <div class="header-logo">
                        <a href="Home.jsp"><img src="./images/Logo.jpg" alt="Logo"></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="signup-body">
        <form action="signup" method="post" class="mx-auto">
            <div class="bg-white p-5 form-login form-login-container">
                <h1 class="text-center fw-bold">Sign up</h1>
                <div class="">
                    <div class="d-flex mt-5">
                        <div class="me-3">
                            <div class="d-flex align-items-center fs-4 mt-3">
                                <input type="text" placeholder="First Name"
                                       style="${(first_name.equals("error")) ? "border-bottom: 1px solid red !important;" : ''}"
                                       value="${!first_name.equals("error")?first_name:""}" name="first_name"
                                       class="w-100 py-4 outline-0 border-0 ms-3 border-bottom" />
                            </div>
                        </div>
                        <div class="ms-3">
                            <div class="d-flex align-items-center fs-4 mt-3">
                                <input type="text" placeholder="Last Name"
                                       style="${(last_name.equals("error")) ? "border-bottom: 1px solid red !important;" : ''}"
                                       value="${!last_name.equals("error")?last_name:""}" name="last_name"
                                       class="w-100 py-4 outline-0 border-0 border-bottom" />
                            </div>
                        </div>
                    </div>
                    <div class="mt-5">
                        <div class="d-flex align-items-center fs-4 mt-3">
                            <i class='bx bx-envelope'></i>
                            <input type="text" placeholder="Email"
                                   style="${email.equals("error") ? "border-bottom: 1px solid red !important;" : ''}"
                                   value="${!email.equals("error")?email:""}" name="email"
                                   class="w-100 py-4 outline-0 border-0 ms-3 border-bottom" />
                        </div>
                    </div>
                    <div class="mt-5">
                        <div class="d-flex align-items-center fs-4 mt-3">
                            <i class='bx bx-phone'></i>
                            <input type="text" placeholder="Phone"
                                   style="${phone.equals("error") ? "border-bottom: 1px solid red !important;" : ''}"
                                   value="${!phone.equals("error")?phone:""}" name="phone"
                                   class="w-100 py-4 outline-0 border-0 ms-3 border-bottom" />
                        </div>
                    </div>
                    <div class="mt-5">
                        <div class="d-flex align-items-center fs-4 mt-3">
                            <i class='bx bx-calendar'></i>
                            <input type="text" placeholder="Date of Birth (dd/mm/yyyy)"
                                   style="${dateofbirth.equals("error") ? "border-bottom: 1px solid red !important;" : ''}"
                                   value="${!dateofbirth.equals("error")?dateofbirth:""}" name="dateofbirth"
                                   class="w-100 py-4 outline-0 border-0 ms-3 border-bottom" />
                        </div>
                    </div>
                                   
                                   
                    <div class="mt-5">
    <div class="d-flex align-items-center fs-4 mt-3">
        <i class='bx bx-male'></i>
        <select id="gender-select" name="gender" class="w-100 py-4 outline-0 border-0 ms-3 border-bottom">
            <option value="" disabled selected style="color: gray;">Select Gender</option>
            <option value="Male" ${gender.equals("Male") ? "selected" : ""}>Male</option>
            <option value="Female" ${gender.equals("Female") ? "selected" : ""}>Female</option>
            <option value="Other" ${gender.equals("Other") ? "selected" : ""}>Other</option>
        </select>
    </div>
</div>

<script>
    document.getElementById('gender-select').addEventListener('change', function() {
        let select = this;
        let selectGenderOption = select.querySelector('option[value=""]');

        if (select.value !== "") {
            if (selectGenderOption) {
                selectGenderOption.remove();
            }
        } else {
            // If needed, you can add back the "Select Gender" option
            if (!selectGenderOption) {
                let newOption = document.createElement('option');
                newOption.value = "";
                newOption.text = "Select Gender";
                newOption.disabled = true; // Keep it disabled
                newOption.style.color = "gray"; // Set the color to gray
                select.add(newOption, select.options[0]);
            }
        }
    });
</script>


                    <div class="border-bottom mt-5">
                        <div class="d-flex align-items-center fs-4 mt-3">
                            <i class='bx bx-lock'></i>
                            <input type="password" placeholder="Password"
                                   style="${password.equals("error") ? "border-bottom: 1px solid red !important;" : ''}"
                                   name="password"
                                   class="w-100 py-4 outline-0 border-0 ms-3" />
                        </div>
                    </div>
                    <div class="border-bottom mt-5">
                        <div class="d-flex align-items-center fs-4 mt-3">
                            <i class='bx bx-lock'></i>
                            <input type="password" placeholder="Confirm Password" name="confirmPassword"
                                   class="w-100 py-4 outline-0 border-0 ms-3" />
                        </div>
                    </div>
                </div>
                <div class="text-center mt-3 fs-5">
                    Already have an account?
                    <a href="login" class="text-black-weak text-info">Login</a>
                </div>
                <button type="submit" class="border-0 rounded-xl fs-4 fw-bold w-100
                        text-white py-3 mt-3 bg-red text-center bg-danger">
                    Sign up
                </button>
                <p class="text-center mt-3" style="color: red">${message}</p>
            </div>
        </form>
    </section>
</body>

</html>
