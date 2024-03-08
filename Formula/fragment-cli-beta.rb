require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4735.0.0-darwin-x64.tar.gz"
    sha256 "dd74dbb8e1868fbeff237260124f7505fdb66a2aca323978568f7210c3662426"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4735.0.0-darwin-arm64.tar.gz"
      sha256 "1918bdba2515279c520ea67c0e67cee23b67661870dfc373f9c463d5301a6385"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4735.0.0-linux-x64.tar.gz"
    sha256 "2ab0f2f5711cda5c74bd3c77104d3a44e067067b6a1e708361de3115cf7832d8"
  end
  version "4735.0.0"
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
