require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2367.0.0-darwin-x64.tar.gz"
    sha256 "f55e74e40be8ee9089bf143a0db68fe96b3f1a7c277a89219832207e43b73de6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2367.0.0-darwin-arm64.tar.gz"
      sha256 "784850fc08fe7993b97935721fb88a4b249fb8127567b105571639728f1f9803"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2367.0.0-linux-x64.tar.gz"
    sha256 "ba1684ec710529005c91100eb9b35fac257da585cf922f89798bcbf1cf6db3a2"
  end
  version "2367.0.0"
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
