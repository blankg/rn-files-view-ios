/**
 * Created by guyblank on 4/29/18.
 */
import React from "react";
import { requireNativeComponent } from "react-native";

class FilesViewIOS extends React.Component {
  render() {
    return <RNFilesView {...this.props} />;
  }
}

var RNFilesView = requireNativeComponent("RNFilesView", FilesViewIOS);

module.exports = FilesViewIOS;
