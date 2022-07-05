
var estrelas = 0;
var setarClassif= function(valor) {
    debugger
    estrelas = valor;
   
}

function actualizarComentarios(id_distrio) {
    $("#campoComentario").LoadingOverlay("hide", true);
    var data = {
        id_distrito: id_distrio,
       
    }

    $.ajax({
        method: "POST",
        url: "/PubDistrito/CarregarComentarios",
        data: data,

    })
            .done(function (msg) {
                if (msg == "false") {

                    $.LoadingOverlay("hide", true);
                    informarErro("Nao foi possivel cadastrar este Usuario");


                }
                else {
                    $.LoadingOverlay("hide", true);
                    $('.with-forms').find("input[type=text], textarea").val("");
                    informarSucesso("Comentario Adicionado com Sucesso");
                    actualizarComentarios('@Model.id');

                }

            });
}