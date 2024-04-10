const pay = () => {
    const payjp = Payjp(ENV["PAYJP_PUBLIC_KEY"]) // PAY.JPテスト公開鍵
    const form = document.getElementById('charge-form')
    form.addEventListener("submit", (e) => {
        console.log("フォーム送信時にイベント発火")
        e.preventDefault();
    });
};

window.addEventListener("load", pay);