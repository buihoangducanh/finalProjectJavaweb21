$(".btn-minus, .btn-plus").click(function () {
  // get input quantity elem
  const inputQuantity = $(this)
    .parents(".input-group.quantity")
    .find("input.quantity");
  const alertQuantity = $(this)
    .parents(".quantity-buy")
    .parent()
    .find("#alert-quantity");

  let quantityValue = inputQuantity.attr("value");
  //   increasing or decreasing
  if ($(this).hasClass("btn-plus")) {
    quantityValue++;
    alertQuantity.text("");
  } else {
    if (quantityValue <= 1) {
      //   //alert quantity
      alertQuantity.text("Số lượng sản phẩm không nhỏ hơn 0");
      quantityValue = 1;
    } else {
      alertQuantity.text("");
      quantityValue--;
    }
  }

  inputQuantity.attr("value", quantityValue);
  inputQuantity.val(inputQuantity.attr("value"));
});

enterProductQuantity();
function enterProductQuantity() {
  $("input.quantity").on("input", function () {
    $(this).attr("value", Number($(this).val()));
    const alertQuantity = $(this)
      .parents(".quantity-buy")
      .parent()
      .find("#alert-quantity");
    if ($(this).attr("value") <= 0) {
      alertQuantity.text("Số lượng sản phẩm không nhỏ hơn 0");
      $(this).attr("value", 1);
    } else {
      alertQuantity.text("");
    }
  });
}
