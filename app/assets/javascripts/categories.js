// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

function sortCategories(){
    $.get("/categories.json", 
        // sort Categories alphabetically
        function(data){
        let sortedCategories = data.sort(function(a, b) {
            var nameA = a.name.toUpperCase(); // ignore upper and lowercase
            var nameB = b.name.toUpperCase(); // ignore upper and lowercase
            if (nameA < nameB) {
              return -1;
            }
            if (nameA > nameB) {
              return 1;
            }
          
            // names must be equal
            return 0;
          })

          // render sorted categories
          renderCategories(sortedCategories);
    });
}

function renderCategories(list) {
    // create category divs
    let categoriesDiv= list.map(category => {
        return `
            <div class="category-square">
                    <a href="${category.link}">${category.name}</a><br>
                    <img class="category-image" src="${category.img_url}"><br>
            </div>
        `
        }).join(' ');

    // set HTML content of categories container
    $(".categories-container").html(categoriesDiv)
}