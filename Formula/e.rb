class E < Formula
  desc "Coding agent for your terminal"
  homepage "https://github.com/fschrhunt/e"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/fschrhunt/e/releases/download/v#{version}/e-aarch64-apple-darwin.tar.gz"
      sha256 "771c448ec8ebdbddbef6a6fac1709e1a55e04ae5b2100a1b0b491cebb109dd1b"
    end
    on_intel do
      url "https://github.com/fschrhunt/e/releases/download/v#{version}/e-x86_64-apple-darwin.tar.gz"
      sha256 "0a9ef5d32df95ebeed1d7f4784ede3bb651b26545a61f6464a55b4d78ffd57e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fschrhunt/e/releases/download/v#{version}/e-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bfc8d803fbdf847b1d7dbe3337646c24f0bc7d8d63bc137ca1717046b1f4cd48"
    end
    on_intel do
      url "https://github.com/fschrhunt/e/releases/download/v#{version}/e-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "343136ae4db20e795e77311a106e9cd017e296dcbad8f7b5b767307a65363664"
    end
  end

  def install
    bin.install "e"
  end

  test do
    assert_match "e #{version}", shell_output("#{bin}/e --version")
  end
end
