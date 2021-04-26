<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Review Payment</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <form>
            <table>
                <tr>
                    <td colspan="2"><b>Transaction Details:</b></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td>${transaction.description}</td>
                </tr>
                <tr>
                    <td>Subtotal:</td>
                    <td>${transaction.amount.details.subtotal}</td>
                </tr>
                <tr>
                    <td>Tax:</td>
                    <td>${transaction.amount.details.tax}</td>
                </tr>
                <tr>
                    <td>Total:</td>
                    <td>${transaction.amount.details.total}</td>
                </tr>
                <tr><td><br/></td></tr>
                <tr>
                    <td colspan="2"><b>Payer Information:</b></td>
                    <td></td>
                </tr>
                <tr>
                    <td>First Name:</td>
                    <td>${payer.firstName}</td>
                </tr>
                <tr>
                    <td>Last Name: </td>
                    <td>${payer.lastName}</td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td>${payer.email}</td>
                </tr>
                
                <tr>
                    <td colspan="2"><b>Shipping Address: </b></td>
                    <td></td>
                </tr>
                
                <tr>
                    <td>Recipient Name: </td>
                    <td>${shippingAddress.recipientName}</td>
                </tr>
                <tr>
                    <td>Line 1: </td>
                    <td>${shippingAddress.line1}</td>
                </tr>
                <tr>
                    <td>City: </td>
                    <td>${shippingAddress.city}</td>
                </tr>
                <tr>
                    <td>State: </td>
                    <td>${shippingAddress.state}</td>
                </tr>
                <tr>
                    <td>Country Code: </td>
                    <td>${shippingAddress.countryCode}</td>
                </tr>
                <tr>
                    <td>Postal Code: </td>
                    <td>${shippingAddress.postalCode}</td>
                </tr>
                
                <div class="container text-center">
                    <button class="btn btn-outline-success">Pay Now</button>
                </div>
                
            </table>
        </form>
    </body>
</html>
