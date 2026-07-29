class Workframe < Formula
  desc "Control plane for isolated agent Git worktrees"
  homepage "https://github.com/fschrhunt/workframe"
  url "https://github.com/fschrhunt/workframe/archive/refs/tags/v1.5.0.tar.gz"
  sha256 "8452eb49dc15a5cc4d6efaeb38fd5700c3e4bafa3d8ecec97aa72020cba55d76"
  license "Apache-2.0"

  def install
    libexec.install "VERSION", "bin", "contrib", "lib"
    bin.install_symlink libexec/"bin/workframe"
  end

  def caveats
    <<~EOS
      Homebrew manages this installation. Upgrade it with:
        brew upgrade workframe

      `workframe update` is for installations linked from a Git checkout.
    EOS
  end

  test do
    ENV["WORKFRAME_HOME"] = testpath/"store"
    ENV["WORKFRAME_COLOR"] = "0"

    system bin/"workframe", "agents", "add", "brewtest"
    assert_match "brewtest", shell_output("#{bin}/workframe agents list")
    assert_match version.to_s, shell_output("#{bin}/workframe version")
  end
end
