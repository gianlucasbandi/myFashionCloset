$(document).ready(()=>{
    
    //----------- Follow/Unfollow --------------//
    $follow_btn = $("#follow-btn");
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
        var creator_id = $follow_btn.closest(".action").attr("id");
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



    function getMetaValue(name) {
        const element = document.head.querySelector(`meta[name="${name}"]`)
        return element.getAttribute("content")
    }
});