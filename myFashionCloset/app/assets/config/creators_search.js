$(document).ready(()=>{
    $search_btn = $("#search-btn");
    $contentDiv = $(".content-body");
    $search_input = $("#search-input");
    $contentDiv.empty();

    $search_btn.on("click",(event)=>{
        event.preventDefault();
        var name = $search_input.val();
        if(name != ""){
            $.ajax({
                type:"post",
                url: "/search",
                data: {"q":{"username_cont":name}},           //q[username_cont]
                credentials: "same-origin",
                headers: {
                    "X-CSRF-Token": getMetaValue("csrf-token")
                },
                success: (result)=>{

                    $contentDiv.empty();
                    for(i = 0;i<result.length;i++){
                        $newItem = $('<div class = "content-item"><div class = "username-item"><p>'+result[i].username+'</p></div>\
                        <div class="show-item"><a href= http://localhost:3000/creators/'+result[i].creator_id+'> Show profile</a></div></div>');
                        $contentDiv.prepend($newItem);
                    }
                }
            });
        }
    });



    
    function getMetaValue(name) {
        const element = document.head.querySelector(`meta[name="${name}"]`)
        return element.getAttribute("content")
    }
});