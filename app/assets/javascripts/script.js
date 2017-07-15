<div class="job-route">
    <%= link_to 'Jobs - Add Boat', "/jobs/#{job.id}", remote: true %>
</div>


// ======= ======= ======= routes.rb ======= ======= =======
// ======= ======= ======= routes.rb ======= ======= =======
// ======= ======= ======= routes.rb ======= ======= =======
get "/jobs/:id" => "jobs#show"


// ======= ======= ======= jobs_controller.rb ======= ======= =======
// ======= ======= ======= jobs_controller.rb ======= ======= =======
// ======= ======= ======= jobs_controller.rb ======= ======= =======

// ======= select_job =======
def add_boats
    puts "\n******* add_boats *******"
    @boats = Boat.where(user_id:current_user)
    respond_to do |format|
        format.js { render :add_boats }
    end
end


// ======= ======= ======= select_job.js.erb ======= ======= =======
// ======= ======= ======= select_job.js.erb ======= ======= =======
// ======= ======= ======= select_job.js.erb ======= ======= =======

// ======= check selectors =======
console.log("params[:id]: <%= params[:id] %>");                                 // check params for job id
console.log("selected job div: ", $('#job-<%= params[:id] %>').attr('id'))      // job banner div
console.log("job buttons div: ", $('#orig-dest-<%= params[:id] %>').attr('id')) // job buttons container
var jobCount = '<%= @jobs.length %>'                                            // count number of jobs
console.log("jobCount: ", jobCount);

// ======= re-set all job banners =======
for (var i = 1; i < jobCount + 1; i++) {
    $('#job-' + i).css('background-color', 'lavender');     // change to normal bg-color
    $('#orig-dest-' + i).css('visibility', 'hidden')        // hide buttons
}

// ======= hilite selected job =======
$('#job-<%= params[:id] %>').css('background-color', 'thistle')     // change to hilite bg-color
$('#orig-dest-<%= params[:id] %>').css('visibility', 'visible')     // show buttons


// ======= ======= ======= new.js.erb ======= ======= =======
// ======= ======= ======= new.js.erb ======= ======= =======
// ======= ======= ======= new.js.erb ======= ======= =======

// == render new port html form
$('#port-form').html("<%= j (render 'form') %>");

// == reveal form via slide-down effect form
$('#port-form').slideDown(350);

// == change form display to block (from none)
$('#port-form').css('display', 'block');

// == activate form cancel button (button hides form)
$("#cancel-port").on("click", function() {
    console.log("== cancel-port ==");
    $('#port-form').slideUp(350);
});


// ======= ======= ======= create.js.erb ======= ======= =======
// ======= ======= ======= create.js.erb ======= ======= =======
// ======= ======= ======= create.js.erb ======= ======= =======

// ======= hide form =======
$('#port-form').slideUp(350);
$('#port-form').css('display', 'none');


// ======= ======= ======= application.html.erb ======= ======= =======
// ======= ======= ======= application.html.erb ======= ======= =======
// ======= ======= ======= application.html.erb ======= ======= =======

// ======= UJS link example =======
<%= link_to 'Toggle State', link_toggle_path, remote: true, confirm: "== ToggleState:click ==" %>
<div id="targetEl" data-state="prev">
    <p>data-state initialized to: prev</p>
</div>


// ======= ======= ======= routes.rb ======= ======= =======
// ======= ======= ======= routes.rb ======= ======= =======
// ======= ======= ======= routes.rb ======= ======= =======
get "/link_toggle" => "jobs#toggle"


// ======= ======= ======= toggle.js.erb ======= ======= =======
// ======= ======= ======= toggle.js.erb ======= ======= =======
// ======= ======= ======= toggle.js.erb ======= ======= =======

var targetElState = $('#targetEl').attr('data-state');
console.log("targetElState: ", targetElState);

if (targetElState == 'prev') {
    var targetElState = $('#targetEl').attr('data-state', 'next');
    $('#targetEl').html("<%= j render(partial: 'next') %>");
} else if (targetElState == 'next') {
    var targetElState = $('#targetEl').attr('data-state', 'prev');
    $('#targetEl').html("<%= j render(partial: 'prev') %>");
}
