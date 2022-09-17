$(document).ready(()=>{
    $search_btn = $("#search-btn");
    $contentDiv = $(".content-body");
    $contentDivOut = $(".content-body-outfit");
    $search_input = $("#search-input");
    $search_input_out = $("#search-input-outfit");
    $contentDiv.empty();
    $contentDivOut.empty();

    $search_input.on("input",(event)=>{
        //event.preventDefault();
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
        else{
            $contentDiv.empty();
        }
    });

    $search_input_out.on("input",(event)=>{
        //event.preventDefault();
        var nameo = $search_input_out.val();
        if(nameo != ""){
            $.ajax({
                type:"post",
                url: "/searchoutfit",
                data: {"q":{"name_cont":nameo}},           //q[username_cont]
                credentials: "same-origin",
                headers: {
                    "X-CSRF-Token": getMetaValue("csrf-token")
                },
                success: (result)=>{
                    $contentDivOut.empty();
                    for(i = 0;i<result.length;i++){
                        $newItem = $('<div class = "content-item"><div class = "username-item"><p>'+result[i].name+'</p></div>\
                        <div class="show-item"><a href= http://localhost:3000/outfits/'+result[i].id+'> Show outfit</a></div></div>');
                        $contentDivOut.prepend($newItem);
                    }
                }
            });
        }
        else{
            $contentDivOut.empty();
        }
    });


    
    function getMetaValue(name) {
        const element = document.head.querySelector(`meta[name="${name}"]`)
        return element.getAttribute("content")
    }
});