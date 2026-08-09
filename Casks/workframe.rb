cask "workframe" do
  version "1.5.1"
  sha256 "2e8b4188188396882a2a2c448be1c48533a3ff0a5d0214dbf4a50589f8907d0e"

  url "https://github.com/fschrhunt/workframe/releases/download/v#{version}/Workframe-#{version}.zip"
  name "Workframe"
  desc "Control plane for isolated coding-agent worktrees"
  homepage "https://github.com/fschrhunt/workframe"

  depends_on macos: :sonoma

  app "Workframe.app"
  command_wrapper "workframe",
                  executable: "#{appdir}/Workframe.app/Contents/Resources/workframe/bin/workframe",
                  env: { "WORKFRAME_DISTRIBUTION" => "homebrew-cask" }
  command_wrapper "wf",
                  executable: "#{appdir}/Workframe.app/Contents/Resources/workframe/bin/workframe",
                  env: { "WORKFRAME_DISTRIBUTION" => "homebrew-cask" }

  caveats <<~EOS
    This release is unsigned and not notarized. macOS will show a security warning
    before opening Workframe.app. Install only if you trust this project and release.
  EOS
end
