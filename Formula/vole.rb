class Vole < Formula
  desc "Deep clean, update, and maintain your Linux box or Mac from the terminal"
  homepage "https://github.com/fschrhunt/vole"
  url "https://github.com/fschrhunt/vole/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "1301647e426275e1d642d74a64d530e4b3938a602e724314338b59868a4cda9e"
  license "GPL-3.0-or-later"

  def install
    # vole resolves its own directory with `readlink -f "${BASH_SOURCE[0]}"`,
    # so the symlinks below land it in libexec and it finds bin/ and lib/
    # there. install.sh and tests/ are for working from a clone; neither is
    # useful once Homebrew owns the install.
    libexec.install "vole", "bin", "lib"
    bin.install_symlink libexec/"vole"
    bin.install_symlink libexec/"vole" => "vo"
  end

  def caveats
    <<~EOS
      Update Vole with:
        vole update

      That is Vole itself. To update the software on your machine:
        vole upgrade
    EOS
  end

  test do
    ENV["NO_COLOR"] = "1"

    # The reported version must track the tag, or `vole update` tells people
    # they are current when they are not.
    assert_match "Vole v#{version}", shell_output("#{bin}/vole version")

    # Both names are installed and resolve to the same script.
    assert_match "Vole v#{version}", shell_output("#{bin}/vo version")

    # libexec wiring: `help` only renders if lib/core/*.sh got sourced.
    assert_match "vole upgrade", shell_output("#{bin}/vole help")
    assert_match "Available tasks:", shell_output("#{bin}/vole optimize --list")
    assert_match "broken_prefs", shell_output("#{bin}/vole optimize --list")

    # The update/upgrade split, including the guard that catches the old
    # pre-0.2.0 invocation instead of silently doing something else.
    assert_match "Updates Vole itself", shell_output("#{bin}/vole update --help")
    assert_match "use: vole upgrade all",
      shell_output("#{bin}/vole update all 2>&1", 1)
  end
end
