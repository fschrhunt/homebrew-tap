class Rmd < Formula
  include Language::Python::Virtualenv

  desc "Remove embedded metadata from files"
  homepage "https://github.com/fschrhunt/rmd"
  url "https://github.com/fschrhunt/rmd/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "efee08ac6d71f768fe055ecaa9a0d874df5c109577c24fbdffac9642b3eeb0d8"
  license "MIT"

  depends_on "exiftool"
  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "Remove embedded metadata", shell_output("#{bin}/rmd --help")
  end
end
