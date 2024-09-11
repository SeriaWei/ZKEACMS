function dropdownTreeLoaded(e) {
    var dropdownTree = $(e.target).closest(".dropdown-tree");

    var currentValue = $("input", dropdownTree).val();
    if (!currentValue) return;

    var selectedNode = $(".jstree-anchor[id='" + currentValue + "']", e.target);
    if (selectedNode.length == 0) return;

    var id = selectedNode.attr("id");
    $(e.target).jstree('select_node', id);
    $(".dropdown-toggle .form-control", dropdownTree).text(selectedNode.attr("title")).attr("title", selectedNode.attr("title"));
    dropdownTree.addClass("selected");
}
function dropdownTreeSelectted(e, selected) {
    var dropdownTree = $(e.target).closest(".dropdown-tree");
    $("input", dropdownTree).val(selected.node.a_attr.id);
    $(".dropdown-toggle .form-control", dropdownTree).text(selected.node.a_attr.title).attr("title",selected.node.a_attr.title);
    dropdownTree.addClass("selected");
}
$(document).on("click", ".dropdown-tree .close", function () {
    var dropdownTree = $(this).closest(".dropdown-tree");
    var hiddenInput = $("input", dropdownTree);
    var selectedNode = $(".jstree-anchor[id='" + hiddenInput.val() + "']", dropdownTree);

    dropdownTree.removeClass("selected");
    $(".jstree", dropdownTree).jstree('deselect_node', selectedNode.attr("id"));
    hiddenInput.val("");
    $(".dropdown-toggle .form-control", dropdownTree).text("");
}).on("click", ".dropdown-tree .dropdown input", function () {
    var dropdown = $(this).closest(".dropdown-tree").find(".dropdown-toggle");
    dropdown.dropdown('toggle')
});