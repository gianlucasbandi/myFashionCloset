$(document).ready(()=>{

    /*----------Creation form-----------------*/
    $add_btn = $(".add-btn");
    $capos_list = $(".capos-list");
    $remove_btn = $(".remove-btn");
    $submit_btn = $("#submit-btn");
    $name = $("#name");
    $description = $("#description");

    //Adding capo to capos-list
    $add_btn.on("click",(event)=>{
        addCapoToOutfit(event);
    });

    
    function addCapoToOutfit(event){

        $btn = $(event.target);
        $btn.prop("disabled",true)

        id = $btn.attr("id")
        imgUrl = $btn.closest("tr").find("td").first().attr("id");
        description = $btn.closest("td").text();

        $newCapo = $('<div class="field capo" id= '+id+'> \
                        <div class = "capo-item" > \
                            <img src = '+imgUrl+' width="130" height="130" > \
                        </div> \
                        <div class = "capo-item" >\
                            <p>'+description+'</p>\
                        </div> \
                        <div class="capo-item"> \
                            <button type ="button" class="remove-btn">Remove</button> \
                        </div> \
                    </div>');   

        $capos_list.append($newCapo);
        $remove_btn = $(".remove-btn");
        
        $remove_btn.on("click",(event)=>{       //On click remove selected capo from outfit
            $target = $(event.target);
            $target.closest(".field").remove();
            btn_id = $target.closest(".capo").attr("id");
            $("#"+btn_id).prop("disabled",false);
        });
    }

    //Creating the outfit (via ajax call to create method) 
    $submit_btn.on("click",(event)=>{
        event.preventDefault();
        data = [];          //ids selected capos
        $capos = $(".capo");

        if($capos.length == 0){     
            alert("No capo selected :Gestire meglio");  //Gestire meglio
            return;
        }
        
        if($name.val() == ""){
            alert("Insert a name :Gestire meglio");     //Gestire meglio
            return;
        }

        if($description.val() == ""){        //Gestire meglio
            alert("Insert a description :Gestire meglio");
            return;
        }

        for( i = 0;i < $capos.length;i++){
            data.push($capos[i].id)
        }
        
        $.ajax({
            type: "POST",
            url : "/outfits/new",
            data: {"ids":data,"name": $name.val(),"description": $description.val()},
            credentials: "same-origin",
            headers: {
                "X-CSRF-Token": getMetaValue("csrf-token")
            },
            success: (result)=>{
                if("done")window.location.href = "http://localhost:3000";
            }
        });
        
    });

    /*----------Search form-----------------*/
    $search_btn = $("#search-btn");
    $divCapos = $("#capos");
    $nome_cont = $("#nome-cont");
    $categoria_cont = $("#categoria-cont");

    $search_btn.on("click",(event)=>{
        event.preventDefault();

        //if($nome_cont.val() == "" && $categoria_cont.val() == "")return;

        $.ajax({
            type: "post",
            url : "/outfits/search",
            data: {"nome_cont": $nome_cont.val(),"categoria_cont": $categoria_cont.val()},
            credentials: "same-origin",
            headers: {
                "X-CSRF-Token": getMetaValue("csrf-token")
            },
            success: (result)=>{
                $divCapos.empty();      //Remove old searched capos

                for(i = 0;i<result.length;i++){
                    console.log(result[i].immagine);
                    $newCapo = $('<table><tr><td id='+result[i].immagine+'><p><img src='+result[i].immagine+' width="130" height="130" ></p></td> \
                                <td>'+result[i].nome+'<br><br><button class="add-btn" id='+result[i].id+'>Add to outfit</button></td></tr></table>');
                
                    $divCapos.append($newCapo);
                }

                $add_btn = $(".add-btn");
                $add_btn.on("click",(event)=>{
                    addCapoToOutfit(event);
                });
            }
        });
        //"q"=>#<ActionController::Parameters {"nome_cont"=>"smocked", "categoria_cont"=>"dress"
    });


    function getMetaValue(name) {
        const element = document.head.querySelector(`meta[name="${name}"]`)
        return element.getAttribute("content")
    }

});