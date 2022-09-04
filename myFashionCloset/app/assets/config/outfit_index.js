$(document).ready(()=>{
    var working = false;

    $(window).scroll(()=>{
        if ($(this).scrollTop() + 1 >= $('body').height() - $(window).height()){
            if(working == false){
                working = true;
                var last = $("#main .card:last").attr("id");        //Getting last outfit loaded in main
                $.ajax({
                    type:"post",
                    url: "/outfits/load",
                    data: {"last":last,"lastIsFollowed":$("#main .card:last").hasClass("followed")},
                    credentials: "same-origin",
                    headers: {
                        "X-CSRF-Token": getMetaValue("csrf-token")
                    },
                    success: (result)=>{
                        var isFollowingOutfits = result[1];
                        var outfits = result[0];
                        
                        for(i = 0; i< outfits.length;i++){
                            $.ajax({
                                type:"post",
                                url: "/outfits/renderHTML/"+outfits[i].id,
                                data: {"last":last,"lastIsFollowed":$("#main .card:last").hasClass("followed")},
                                credentials: "same-origin",
                                headers: {
                                "X-CSRF-Token": getMetaValue("csrf-token")
                                },
                                success :(html)=>{          //Getting the html to display outfit
                                    console.log(html.string)
                                    var $newItem = $(html.string)
                                    $("#main").append($newItem);
                                }
                            });
                        }

                        //Timeout to not overload the server
                        setTimeout(() => {
                            working = false;
                        }, 4000);

                    }
                });
            }
        }
    });
});


function getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
}
