$(document).ready(()=>{
    $capoBtn = $("#capo-btn");
    $outfitBtn = $("#outfit-btn");


    $(".card").hide();


    $outfitBtn.on("click",()=>{
        $capoBtn.removeClass("disabled");
        $outfitBtn.addClass("disabled");

        $(".capo").hide();
        $(".card").show();
    });


    $capoBtn.on("click",()=>{
        $outfitBtn.removeClass("disabled");
        $capoBtn.addClass("disabled");

        $(".capo").show();
        $(".card").hide();
    });


});