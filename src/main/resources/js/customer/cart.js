$(".delete-btn").click(function () {
  $(this).parents(".product-in-cart").remove();
  calculateCart();
});
calculateTotalEach();
function calculateTotalEach() {
  $(".product-in-cart").each(function () {
    let quantity = $(this).find(".quantity");
    let quantityValue = Number(quantity.val());
    let pricePerOne = $(this).find(".price-per-one").attr("value");
    pricePerOne = Number(pricePerOne);
    let totalEach = $(this).find(".total-each");
    totalEach.attr("value", pricePerOne * quantityValue);
    totalEach.text(formatMoneyJS(totalEach.attr("value")));
    calculateCart();
  });
}

$(".js-btn-plus, .js-btn-minus").each(function () {
  const quantity = $(this).parents(".product-in-cart").find(".quantity");

  $(this).click(function () {
    quantity.attr("value", quantity.val());
    let quantityValue = Number(quantity.attr("value"));

    if ($(this).hasClass("js-btn-plus")) {
      quantityValue++;
    } else {
      quantityValue--;
      if (quantityValue == 0) {
        $(this).parents(".product-in-cart").remove();
      }
    }
    quantity.attr("value", quantityValue);
    quantity.val(quantityValue);
    calculateTotalEach();
    calculateCart();
  });
});
calculateCart();
function calculateCart() {
  const cartValue = $("#cart-value");
  let sum = 0;
  $(".total-each").each(function () {
    sum += Number($(this).attr("value"));
  });
  cartValue.attr("value", sum);
  cartValue.text(formatMoneyJS(cartValue.attr("value")));
}

// input keyboard quantity
$(".quantity").each(function () {
  $(this).on("input", function () {
    $(this).attr("value", $(this).val());
    calculateTotalEach();
    calculateCart();
  });
});
// format money by js
function formatMoneyJS(money) {
  return new Intl.NumberFormat("vi-VN", {
    style: "currency",
    currency: "VND",
  }).format(money);
}
