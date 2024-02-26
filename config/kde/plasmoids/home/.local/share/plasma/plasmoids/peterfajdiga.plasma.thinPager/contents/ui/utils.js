function colorAlpha(color, alpha) {
    return Qt.rgba(color.r, color.g, color.b, alpha);
}

function getThickness(item, vertical) {
    if (item === null) {
        return 0;
    }
    return vertical ? item.width : item.height;
}

function hasWindows(pageModel) {
    if (pageModel.TasksModel === undefined) {
        return false;
    }
    return pageModel.TasksModel.hasChildren();
}

function updatePageState(pageModel, pageItem) {
    pageItem.hasWindows = hasWindows(pageModel);
}
