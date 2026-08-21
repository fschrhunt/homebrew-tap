class E < Formula
  desc "Coding agent for your terminal"
  homepage "https://github.com/fschrhunt/e"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fschrhunt/e/releases/download/v#{version}/e-aarch64-apple-darwin.tar.gz"
      sha256 "1cb983e725be50534750886d19a6f72d85aaa0389eb3fbb5b65ac4e4a2a580ca"
    end
    on_intel do
      url "https://github.com/fschrhunt/e/releases/download/v#{version}/e-x86_64-apple-darwin.tar.gz"
      sha256 "5c6639a8df7c84f8f7f6429ee564eab8a84c5c038423a76d48c1302f85d42a27"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fschrhunt/e/releases/download/v#{version}/e-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "28e4b2b17ce6efff71aa14f962dd47bb9e7088245b1d68d65183cf8a63db830d"
    end
    on_intel do
      url "https://github.com/fschrhunt/e/releases/download/v#{version}/e-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5166941de7db7a32d94790bd31d6b6470aba3f7df1d57210b9c7c28f057615e4"
    end
  end

  def install
    bin.install "e"
  end

  test do
    assert_match "e #{version}", shell_output("#{bin}/e --version")
  end
end
