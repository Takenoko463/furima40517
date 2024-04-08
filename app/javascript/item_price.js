window.addEventListener('turbo:load', () => {
    const priceInput = document.getElementById('item-price')
    priceInput.addEventListener("input", () => {
        const inputValue = priceInput.value;
        const addTaxDom = document.getElementById('add-tax-price');
        const tax_ratio = 0.1;
        const tax = Math.floor(inputValue * tax_ratio);
        if (typeof tax === 'number') {
            addTaxDom.innerHTML = `${tax}`;

            const taxDom = document.getElementById('profit');
            const profit = Math.floor(inputValue - tax);
            taxDom.innerHTML = `${profit}`;
        }


    })


});