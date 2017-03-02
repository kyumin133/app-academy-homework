document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items
  document.querySelector(".favorite-submit").addEventListener("click", (e) => {
    e.preventDefault();
    let text = document.getElementsByClassName("favorite-input")[0].value;
    let li = document.createElement("li")
    li.innerHTML = text;
    document.getElementById("sf-places").appendChild(li);
    document.getElementsByClassName("favorite-input")[0].value = "";
  });
  // --- your code here!



  // adding new photos

  // --- your code here!
  document.querySelector(".photo-show-button").addEventListener("click", (e) => {
    e.preventDefault();
    if (document.querySelector(".photo-form-container").classList.contains("hidden")) {
      document.querySelector(".photo-form-container").className = "photo-form-container";
    } else {
      document.querySelector(".photo-form-container").className = "photo-form-container hidden";
    }
  });


  document.querySelector(".photo-url-submit").addEventListener("click", (e) => {
    e.preventDefault();
    let url = document.querySelector(".photo-url-input").value;
    let img = document.createElement("img");
    img.src = url;
    let li = document.createElement("li")
    li.appendChild(img);

    document.querySelector(".dog-photos").appendChild(li);
  });



});
