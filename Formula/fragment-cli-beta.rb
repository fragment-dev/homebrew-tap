require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4688.0.0-darwin-x64.tar.gz"
    sha256 "0091a94be60d071d01b8bcbfdb192e159bd8f3914c79bf743cbeb5f6ef1df2e0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4688.0.0-darwin-arm64.tar.gz"
      sha256 "41fcc37980fdf75ffda18efa5f47f6a244d09662dd90390d01d62205a696ce53"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4688.0.0-linux-x64.tar.gz"
    sha256 "49a19d2094609ef53250b53e769bad2da83e9cad4fb0ad3a9be3a87c2a3d3fc8"
  end
  version "4688.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
