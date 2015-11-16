$('.actn-index').on('click', '[data-hook~=tourney-delete]', deleteTournament )

function deleteTournament () {
	event.preventDefault();
	var request = $.ajax({
      url: '/api/tournaments',
      type: 'DELETE',
      data: { id: $(this).val() },
      success: tournamentsIndex
    });
};