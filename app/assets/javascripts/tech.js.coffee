# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready( ->
  $(".iconless-button").hover(
    (evt) ->
      target = $(evt.target).parents(".rating")
      target.find("div.full-star").addClass('hidden');
      target.find("div.empty-star").removeClass('hidden');

      rating = $(evt.target).parents(".review-form").data("star")
      for r in [0 .. rating]
        form = target.find(".review-form[data-star='#{r}']")
        form.find("div.full-star").removeClass('hidden')
        form.find("div.empty-star").addClass('hidden')
    , (evt) ->
      target = $(evt.target).parents(".rating")
      target.find("div.star").removeClass('hidden');
      target.find("div.no-star").addClass('hidden');
  )
)
