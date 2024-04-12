function get_price() {
    const priceInput = document.getElementById('item-price')
    priceInput.addEventListener("input", () => {
        const inputValue = parseFloat(priceInput.value);
        if (!Number.isNaN(inputValue)) {
            const addTaxDom = document.getElementById('add-tax-price');
            const tax_ratio = 0.1;
            const tax = Math.floor(inputValue * tax_ratio);
            addTaxDom.innerHTML = `${tax}`;

            const taxDom = document.getElementById('profit');
            const profit = Math.floor(inputValue - tax);
            taxDom.innerHTML = `${profit}`;
        }
    });
};
window.addEventListener('turbo:load', get_price)
window.addEventListener('turbo:render', get_price)