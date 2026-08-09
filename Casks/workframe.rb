cask "workframe" do
  version "1.5.2"
  sha256 "6be2b3501bd6e0f6b01d6691d2a01180c39d87dba116a875b164f42bf8c6e82b"

  url "https://github.com/fschrhunt/workframe/releases/download/v#{version}/Workframe-#{version}.zip"
  name "Workframe"
  desc "Control plane for isolated coding-agent worktrees"
  homepage "https://github.com/fschrhunt/workframe"

  depends_on macos: :sonoma

  app "Workframe.app"
  command_wrapper "workframe",
                  executable: "#{appdir}/Workframe.app/Contents/Resources/workframe/bin/workframe",
                  env:        { "WORKFRAME_DISTRIBUTION" => "homebrew-cask" }
  command_wrapper "wf",
                  executable: "#{appdir}/Workframe.app/Contents/Resources/workframe/bin/workframe",
                  env:        { "WORKFRAME_DISTRIBUTION" => "homebrew-cask" }

  caveats <<~EOS
    This release is unsigned and not notarized. macOS will show a security warning
    before opening Workframe.app. Install only if you trust this project and release.
  EOS
end
