function addToCart(id, name,price){
    fetch('/api/cart',{
        method:'post',
        body: JSON.stringify({
            'id':id,
            'name':name,
            'price':price
        }),
        header: {
            'Content-Type':'application/json'
        }
    }).then(res=>res.json()).then(data=>{
        console.info(data);
        var cart=document.getElementById('cart-info');
        cart.innerText='${data.total_quantity}-${data.total'
    })
}