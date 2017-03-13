let shoppingList = {
	title: "Shopping List",
	tasks:
		[
			{
				taskName: "Fish",
				complete: false
			},
			{
				taskName: "Toys",
				complete: false
			},
			{
				taskName: "Rocks",
				complete: false
			},
			{
				taskName: "Boxes",
				complete: false
			},
			{
				taskName: "Tesla Model 3",
				complete: false
			}
		]
};

let visit = {
	title: "Places I Want to Visit Someday",
	tasks:
		[
			{
				taskName: "Egypt",
				complete: false
			},
			{
				taskName: "New Zealand",
				complete: false
			},
			{
				taskName: "Sumatra",
				complete: true
			},
			{
				taskName: "The Moon",
				complete: false
			}
		]
};
let workout = {
	title: "Workout Plan",
	tasks:
		[
			{
				taskName: "800 arm curls",
				complete: true
			},
			{
				taskName: "Contortion",
				complete: true
			},
			{
				taskName: "Dunk a basketball on a regulation hoop",
				complete: false
			},
			{
				taskName: "100 meter swim",
				complete: true
			}
		]
};
let favoriteQuotes = {
	title: "Favorite Quotes",
	quotes:
		[
			{
				quote: "When everything seems to be going against you, remember that the airplane takes off against the wind, not with it.",
				speaker: "Henry Ford"
			},
			{
				quote: "The future belongs to those who believe in the beauty of their dreams.",
				speaker: "Eleanor Roosevelt"
			},
			{
				quote: "All emotions are pure which gather you and lift you up; that emotion is impure which seizes only one side of your being and so distorts you.",
				speaker: "Rainer Maria Rilke"
			},
			{
				quote: "There is no time for cut-and-dried monotony. There is time for work. And time for love. That leaves no other time!",
				speaker: "Coco Chanel"
			}
		]
};
let lists = [shoppingList, visit, workout, favoriteQuotes];


$( document ).ready(function() {
  $(".lists-ul").on("click", (e) => {
    let idx = $(e.target).index();

    displayList(idx);
  });

  displayList = (idx) => {
    let list = lists[idx];
    $(".list-details").empty();
    let title = $(`<h1>${list.title}</h1>`);
    $(".list-details").append(title);
    let ul = $("<ul>");
    if (list.quotes === undefined) {
      ul.addClass("tasks");
      for (let i = 0; i < list.tasks.length; i++) {
        if (list.tasks[i].complete) {
          ul.append($(`<li class="complete">${list.tasks[i].taskName}</li>`))
        } else {
          ul.append($(`<li>${list.tasks[i].taskName}</li>`))
        }
      }
    } else {
      ul.addClass("quotes");
      for (let i = 0; i < list.quotes.length; i++) {
        ul.append($(`<li>${list.quotes[i].quote}<span> - ${list.quotes[i].speaker}</span></li>`))
      }
    }
    $(".list-details").append(ul)
  };
});
