
<h1>Add a movie to your collection!</h1>

<% unless locals.empty? %>
  <%= message %>
<% end %>

<form action="/movies" method="post">
    <label for="title">Title:</label>
    <input id="title" type="text" name="movie[title]">

    <br>

    <h2>Genres:</h2>

    <% Genre.all.each do |genre| %>
        <input type="checkbox" name="movie[genre_ids][]" value="<%= genre.id %>">
        <%= genre.name %><br>
    <% end %>

    <br>

    <label for="actors">Actors:</label>
    <input id="actors" type="text" name="movie[actors][]">
    <input type="text" name="movie[actors][]">
    <input type="text" name="movie[actors][]">

    <br><br>

    <input type="submit" value="Create Movie">
</form>