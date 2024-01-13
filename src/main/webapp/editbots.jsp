<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.dbcon"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>RCS BOT</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.4.2/css/fontawesome.min.css" integrity="sha384-BY+fdrpOd3gfeRvTSMT+VUZmA728cfF9Z2G42xpaRkUGu2i3DyzpTURDo5A6CaLK" crossorigin="anonymous">
        <!-- Vendor CSS Files -->
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="assets/css/style24.css" rel="stylesheet">


    </head>

    <body>

        <%@include file="header.jsp" %>
        <!-- ======= Hero Section ======= -->
        <section id="hero1" class="d-flex align-items-center">
            <div class="container" data-aos="fade-up" data-aos-delay="100">
                <div class="row justify-content-left">
                    <div class="col-md-12 col-sm-12 colxs-12 table-responsive">
                        <div class="main-table">


                            <%
                                try {
                                    dbcon db = new dbcon();
                                    db.getCon("VNS_RCS");

                                    String Query = "Select bot_message_types,bot_name,brand_name,short_description,color,phone_number,labelPhoneNumber from rbm_table order by id DESC LIMIT 1";
                                    //select * from rbm_table order by id DESC LIMIT 5;
                                    //Select bot_name,bot_message_types,brand_name from rbm_tableorder by id DESC LIMIT 5
                                    Statement st = db.getStmt();
                                    ResultSet rs = st.executeQuery(Query);

                                    while (rs.next()) {
                            %>

                            <!-- Bot Message Type Section -->
                            <div class="col-md-12 col-sm-12">
                                <h3 for="botMessageType">Bot Message Type*</h3>
                                <label for="OTP">OTP</label>
                                <input type="radio" id="OTP" name="botMessageType" value="OTP" <%=(rs.getString("bot_message_types").equals("OTP")) ? "checked" : ""%>>

                                <label for="Transactional">Transactional</label>
                                <input type="radio" id="Transactional" name="botMessageType" value="Transactional" <%=(rs.getString("bot_message_types").equals("Transactional")) ? "checked" : ""%>>

                                <label for="Promotional">Promotional</label>
                                <input type="radio" id="Promotional" name="botMessageType" value="Promotional" <%=(rs.getString("bot_message_types").equals("Promotional")) ? "checked" : ""%>>


                            </div>
                            <br>
                            <div class="col-md-12 col-sm-12 full-width">
                                <!-- Bot Name Section -->
                                <h3 class="title1" for="brandName">Bot Name*</h3>
                                <p>Enter the name of the chatbot that the user will see at the top of the message thread (40 chars. max)</p>
                                <input type="text" id="botname" name="botname" maxlength="40" oninput="updateCharCount(this.value)" value="<%=rs.getString("bot_name")%>" required>
                                <div id="charCount">40 characters left</div>
                            </div>

                            <div class="col-md-12 col-sm-12 full-width">
                                <!-- Brand Name Section -->
                                <h3 class="title" for="brandName">Brand Name*</h3>
                                <p>Enter the brand name with which your chatbot will be associated.</p>
                                <input type="text" id="brandName" name="brandName" maxlength="100" oninput="updateBrandCharCount(this.value)" value="<%=rs.getString("brand_name")%>" required>
                                <div id="charCountbrand">100 characters left</div>
                            </div>

                            <div class="col-md-12 col-sm-12 full-width">
                                <!-- Short Description Section -->
                                <h3 class="title" for="shortdescription">Short Description*</h3>
                                <input type="text" id="shortdescription" name="shortdescription" maxlength="100" oninput="updateshortdescription(this.value)" value="<%=rs.getString("short_description")%>" required>
                                <div id="charCountshortdescription">100 characters left</div>
                            </div>
                            <br>

                            <div class="row">
                                <div class="col-md-12 col-sm-12 full-w">
                                    <h3 class="title1" for="favcolor">color*</h3>

                                    <p>Specify a color for your agent with a minimum 4.5 : 1 contrast ratio relative to white.<a href="https://webaim.org/resources/contrastchecker/">Learn More</a></p>
                                    <input type="color" id="favcolor" name="favcolor" value="#00000">
                                    <input type="text" id="favcolors" name="favcolors" oninput="updateColor()" value="<%=rs.getString("color")%>">
                                </div>

                            </div>
                        </div>

                        <div style="height:24px;"></div><!-- comment -->
                        <div class="row" id="phoneNumbersContainer">
                            <div class="col-md-1 mt-10">
                                <div class="form-group">
                                    <select class="form-select" aria-label="Default select example">
                                        <option value="AF">India</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-4 ">
                                <label for="exampleInputPassword1">Primary phone number*</label>
                                <input type="number" class="form-control" id="exampleInputphone" name="primaryPhoneNumber" aria-describedby="emailHelp" placeholder="+91" value="<%=rs.getString("phone_number")%>" required>
                            </div>
                            <div class="col-md-4">
                                <label for="exampleInputPassword1">Label for Primary phone number*</label>
                                <input type="text" class="form-control" id="exampleInputphone" name="labelPhoneNumber" aria-describedby="emailHelp" value="<%=rs.getString("labelPhoneNumber")%>" required>
                                <!--                            <p class="chter">25 Characters left</p>-->
                            </div>
                        </div>
                        <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                        </tbody>

                    </div>
                </div>
            </div>

        </div>
    </section>


</body>



</html>