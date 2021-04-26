function add_to_cart(pid, pname, pprice) {

    let cart = localStorage.getItem("cart");

    if (cart == null) {
        let products = [];
        let product = {productId: pid, productName: pname, productQuantity: 1, prodcuctPrice: pprice};
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        console.log("product is added for the first time");
        showToast('Product is added to cart');
    } else {
        //cart is already present
        let pcart = JSON.parse(cart);
        let oldProduct = pcart.find((item) => item.productId == pid);

        if (oldProduct) {
            //we have to increase the quantity
            oldProduct.productQuantity += 1;

            pcart.map((item) => {
                if (item.productId == oldProduct.productId) {
                    item.productQuantity = oldProduct.productQuantity;
                }
            })
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("product quanitity is increased");
            showToast(oldProduct.productName + ' quantity is increased');
        } else {
            // we have to add the product;
            let product = {productId: pid, productName: pname, productQuantity: 1, prodcuctPrice: pprice};
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("product is added");
            showToast('Product is added to cart');
        }
    }
    update_cart();
}

//update cart
function update_cart() {
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    let totalPrice = 0;
    if (cart == null || cart.length == 0) {
        console.log("Cart is empty !");
        $(".cart-items").html("");
        $(".cart-body").html("<h3>Card is Empty :(</h3>");
        $(".checkout-btn").attr('disabled', true);
    } else {
        //there is something in the cart to show
        console.log(cart);
        $(".cart-items").html(`${cart.length}`);

        let table = `
                  <table class='table'>
                  <thead class='thead-light'>
                    <tr>
                        <th> Name </th>
                        <th> Price </th>
                        <th> Quantity </th>
                        <th> Total Price </th>
                        <th> Action </th>
                    </tr>
                  </thead>
                 `;

        cart.map((item) => {
            table += `
                       
                       <tr>
                        <td> ${item.productName}</td>
                        <td> ${item.prodcuctPrice}</td>
                        <td> ${item.productQuantity}</td>
                        <td> ${item.productQuantity * item.prodcuctPrice}</td>
                        <td> <button onclick='delete_item_from_cart(${item.productId})' class="btn btn-outline-danger ">Remove</button></td>
                       </tr>
                        `;
            totalPrice += item.productQuantity * item.prodcuctPrice;
        })

        table = table + `
                  
                  <tr><td colspan ='4' class='text-right font-weight-bold'>Total Price : ${totalPrice}</td></tr>
                  
                  </table>`
        $(".cart-body").html(table);
        $(".checkout-btn").attr('disabled', false);
    }
    document.getElementById("total").value = totalPrice;
    document.getElementById("subtotal").value = totalPrice;
    
    cart.map((item)=> {
         document.getElementById("product").value = item.productName;
    })
}
// delete item
function delete_item_from_cart(pid) {
    let cart = JSON.parse(localStorage.getItem('cart'));

    let newCart = cart.filter((item) => item.productId != pid)

    localStorage.setItem('cart', JSON.stringify(newCart));
    update_cart();
    showToast('Product is removed from cart');
}
$(document).ready(function() {
    update_cart();
})

function showToast(content) {
    $('#toast').addClass("display");
    $('#toast').html(content)
    setTimeout(() => {
        $('#toast').removeClass('display');
    }, 2000)
}

function goToCheckout() {
    window.location = "checkout.jsp";
}
