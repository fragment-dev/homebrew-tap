require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3078.0.0-darwin-x64.tar.gz"
    sha256 "b523b83207ec0538078d8c5373236cefe037eba0d2c496f64c53567f83d377b9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3078.0.0-darwin-arm64.tar.gz"
      sha256 "0e03bd051b899fbb52c5d0a7a11aeb44d3ca1ea5fb82d5df26570a0ec21166a6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3078.0.0-linux-x64.tar.gz"
    sha256 "24dc581b4516aff5f73304c277f9a713383201ca280c1b27518a36778635181a"
  end
  version "3078.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
