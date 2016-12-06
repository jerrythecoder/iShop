/*
 * Display the toast snackbar.
 */
function showToastBar(btnId) {
    var x = document.getElementById("snackbar")
    
    //$("div#snackbar").text("Product added to cart");
    
    x.className = "show";
    
    setTimeout(function(){
    	x.className = x.className.replace("show", "");
    }, 3000);
    
    
    /*
    var addBtn = document.getElementById(btnId);
    var rect = addBtn.getBoundingClientRect();
    
    alert(rect.top + ' ' + rect.right + ' ' + rect.bottom + ' ' + rect.left);
    
    x.style.position = "absolute";
    x.style.left = rect.left + 'px';
    x.style.top = rect.top + 30 +'px';
    */
}

function showToastBarRemoveItem(btnId) {
    var x = document.getElementById("snackbar-remove-item")
    
    x.className = "show";
    
    setTimeout(function(){
    	x.className = x.className.replace("show", "");
    }, 3000);
}