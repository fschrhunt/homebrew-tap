class Workframe < Formula
  desc "Control plane for isolated agent Git worktrees"
  homepage "https://github.com/fschrhunt/workframe"
  url "https://github.com/fschrhunt/workframe/archive/refs/tags/v1.5.0.tar.gz"
  sha256 "8452eb49dc15a5cc4d6efaeb38fd5700c3e4bafa3d8ecec97aa72020cba55d76"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/fschrhunt/homebrew-tap/releases/download/workframe-1.5.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "2fe2b880e5beca5efbe6ecadf6e7ab4790a8d03f1362082f5550bbc70686aa8e"
    sha256 cellar: :any_skip_relocation, sequoia:      "e559d5dacc26ad8f40b484e511a6a133bf343f7650e928f8592816f510bc5081"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bf84c28d01f1c6d9115cdd8e1037bc64379c112faa567753f4fe354d8ac12ffb"
  end

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
