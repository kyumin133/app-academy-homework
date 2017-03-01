console.log("Hello from the JavaScript console!");
// Your AJAX request here
$.ajax({
  url: "http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=bcb83c4b54aee8418983c2aff3073b3b",
  type: "GET",
  success: function(response) {
    let temperature_k = response.main.temp;
    let temperature_c = temperature_k - 273.15;
    let temperature_f = Math.floor((temperature_c * (1.8)) + 32);
    let location = response.name;
    console.log(`${temperature_f} degrees in ${location}.`);
    // console.log("Test");
  },
  error: function(response) {
    console.log("Error");
  }
});

// Add another console log here, outside your AJAX request
console.log("I'm down here.")
