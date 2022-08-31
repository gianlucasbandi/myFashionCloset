$(document).ready(()=>{
    //----------- Follow/Unfollow --------------//

    $follow_btn = $("#follow-btn");
    var creator_id = $follow_btn.closest(".action").attr("id");
    $unfollow_btn = $("#unfollow-btn");

    $follow_btn.on("click",()=>{
        var creator_id = $follow_btn.closest(".action").attr("id");
        $.ajax({
            type: "post",
            url : "/creators/"+creator_id+"/follow",
            data: {},
            credentials: "same-origin",
            headers: {
                "X-CSRF-Token": getMetaValue("csrf-token")
            },
            success: (result)=>{
                $follow_btn.hide();
                $unfollow_btn.show();
            }
        });
    });

    
   $unfollow_btn.on("click",()=>{
        $.ajax({
            type: "post",
            url : "/creators/"+creator_id+"/unfollow",
            data: {},
            credentials: "same-origin",
            headers: {
                "X-CSRF-Token": getMetaValue("csrf-token")
            },
            success: (result)=>{
                $follow_btn.show();
                $unfollow_btn.hide();
            }
        });
    });


    //------------ Report --------------------//
    $report_btn = $("#report-btn");
    $reportModal = $("#reportModal");
    $inputAbout = $("#inputAbout");
    $inputDescription = $("#inputDescription");


    $report_btn.on("click",()=>{
        if($inputAbout.val() == "" || $inputDescription.val() == ""){
            alert("Insert about and description");
        }
        else{
            //Getting info
            var about = $inputAbout.val();
            var description = $inputDescription.val();
            
            //Letting the controller do the work
            $.ajax({
                type: "post",
                url : "/creators/"+creator_id+"/report",
                data: {"about":about,"description":description},
                credentials: "same-origin",
                headers: {
                    "X-CSRF-Token": getMetaValue("csrf-token")
                },
                success: (result)=>{
                    alert("Report sent! "+result);
                    $('.modal.in').modal('hide');   //Hiding the modal
                }
            });

            
        }
        $inputAbout.val("");
        $inputDescription.val("");
    });


    //------------ Other --------------------//
    function getMetaValue(name) {
        const element = document.head.querySelector(`meta[name="${name}"]`)
        return element.getAttribute("content")
    }
});