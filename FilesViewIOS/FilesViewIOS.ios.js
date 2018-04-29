/**
 * Created by guyblank on 4/29/18.
 */
import PropTypes from "prop-types";
import React from "react";
import { requireNativeComponent } from "react-native";

class FilesViewIOS extends React.Component {
  render() {
    return <RNFilesView {...this.props} />;
  }
}

FilesViewIOS.propTypes = {
  urls: PropTypes.array,
  onFileChange: PropTypes.func,
  previewBackgroundColor: PropTypes.string,
  initialIndex: PropTypes.number
};

var RNFilesView = requireNativeComponent("RNFilesView", FilesViewIOS);

module.exports = FilesViewIOS;
