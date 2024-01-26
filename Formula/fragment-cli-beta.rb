require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4448.0.0-darwin-x64.tar.gz"
    sha256 "0fdeb9fbd2663e9e4fb98067664b84489e753b9ce7338451976caf56ae3dbd3b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4448.0.0-darwin-arm64.tar.gz"
      sha256 "6f6de1d3fd0ca00e8f74f33933143015ef8499bf1fc51fb33bfa6ac09c46b8e1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4448.0.0-linux-x64.tar.gz"
    sha256 "fb5ad8c313f2fa6510f16d1d18ea91bf7e1fb66dfaf0c11523a33017083a42a0"
  end
  version "4448.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
