/////////////////////////////////////////////////////////////////////////
/// 
/// Description: Articles Javascript Module.
///
////////////////////////////////////////////////////////////////////////
var articles = (function () {
    //Privates Vars
    var options = {};

    //Init Method
    var initialize = function (opts) {
        $.extend(options, opts);
        switch (options.view) {
            case "NEW":
                AddArticles();
                break;
            case "EDIT":
                ModifyArticles();
                break;
        }                
    };
    //Add Articles Handler function
    var AddArticles = function () {
        $('#btnSave').off('click.btnSave').on('click.btnSave', function () {
            var $thisform = $('#addArt');
            if ($thisform.valid()) {
                var ArticlesBE = {                   
                    Name: $('#Name').val(),
                    Description: $('#Description').val(),
                    Price: $('#Price').val(),
                    Total_in_self: $('#Total_in_self').val(),
                    Total_in_vault: $('#Total_in_vault').val(),
                    StoreId: $('#StoreId').val()
                };
                $.ajax({
                    type: "POST",
                    url: options.url.save,
                    data: JSON.stringify(ArticlesBE),
                    processData: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (result) {
                        window.location.replace(options.url.index);
                    },
                    error: function (jqXHR) {
                        alert(jqXHR.responseText + ' - ' + jqXHR.status)
                    }
                });
            }
        });
    };
    //Modify Articles Handler function
    var ModifyArticles = function () {
        $('#btnSave').off('click.btnSave').on('click.btnSave', function () {
            var $thisform = $('#modArt');
            if ($thisform.valid()) {
                var ArticlesBE = {
                    ArticleId: $('#ArticleId').val(),
                    Name: $('#Name').val(),
                    Description: $('#Description').val(),
                    Price: $('#Price').val(),
                    Total_in_self: $('#Total_in_self').val(),
                    Total_in_vault: $('#Total_in_vault').val(),
                    StoreId: $('#StoreId').val()
                };
                $.ajax({
                    type: "POST",
                    url: options.url.save,
                    data: JSON.stringify(ArticlesBE),
                    processData: false,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (result) {
                        window.location.replace(options.url.index);
                    },
                    error: function (jqXHR) {
                        alert(jqXHR.responseText + ' - ' + jqXHR.status)
                    }
                });
            }
        });
    };

    //Init the program
    return {
        init: initialize
    }
})();