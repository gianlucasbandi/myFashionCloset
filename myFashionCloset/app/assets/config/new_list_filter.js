let NewListFilter = {
    filter_new: function () {
      // 'this' is *unwrapped* element that received event (checkbox)
      if ($(this).is(':checked')) {
        $('.new').hide();
      } else {
        $('.new').show();
      };
    },
    setup: function() {
      // construct checkbox with label
      let labelAndCheckbox =
        $('<label for="filter">New in: Clothes</label>' +
          '<input type="checkbox" id="filter"/>' );
      if (! $('#filter').length ) {
        labelAndCheckbox.insertBefore('#capos');
      }
      //$('#filter').change(MovieListFilter.filter_adult);
      $('#filter').on('change', NewListFilter.filter_new);
    }
}

$(NewListFilter.setup); // run setup function when document ready