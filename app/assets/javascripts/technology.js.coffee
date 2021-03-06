# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

select2ready= () ->
  $(".select2").select2()

iconlessButtonReady = () ->
    $(".iconless-button").mouseenter(
      (evt) ->
        target = $(evt.target).parents(".rating")
        target.find("div.full-star").addClass('hidden');
        target.find("div.empty-star").removeClass('hidden');

        rating = $(evt.target).parents(".review-form").data("star")
        for r in [0 .. rating]
          form = target.find(".review-form[data-star='#{r}']")
          form.find("div.full-star").removeClass('hidden')
          form.find("div.empty-star").addClass('hidden')
    )

    $(".iconless-button").mouseleave(
      (evt) ->
        target = $(evt.target).parents(".rating")
        target.find("div.star").removeClass('hidden');
        target.find("div.no-star").addClass('hidden');
    )

    $('.review-form').ajaxForm(() ->
        console.log("submitted");
    );

    $('.text-review').ajaxForm({
      success : (resp,status,xhr,elt) ->
        elt.remove()
    });

$(document).ready(select2ready)
$(document).on('page:load', select2ready);
$(document).ready(iconlessButtonReady)
$(document).on('page:load', iconlessButtonReady);