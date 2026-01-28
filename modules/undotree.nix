{
  # Enable the undotree plugin
  plugins.undotree = {
    enable = true;

    # Plugin settings
    settings = {
      # Window layout
      windowLayout = 3; # Use layout 3 (undotree on left, diff below)

      # Window width for undotree panel (30 cols)
      windowWidth = 30;

      # Whether to auto open diff window
      autoOpenDiff = true;

      # Focus on the undotree window when it's opened
      focusOnToggle = true;

      # Show help text
      helpLine = true;

      # Whether to show diff in a vertical split
      diffVertical = false;

      # Highlight changed text
      highlightChangedText = true;

      # Highlight changed saved text
      highlightChangedWithSign = true;

      # Automatically update diff when cursor moves
      autoUpdate = true;

      # Relative timestamp display
      relativeTimestamp = true;

      # Shortcut for help
      shortIndicators = false;

      # Tree node shape
      treeNodeShape = "●";

      # Tree vertical shape
      treeVertShape = "│";

      # Tree split shape
      treeSplitShape = "╱";

      # Tree return shape
      treeReturnShape = "╲";
    };
  };
}
