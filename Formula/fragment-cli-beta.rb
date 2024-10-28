require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5709.0.0-darwin-x64.tar.gz"
    sha256 "f30b81fb666eee6080423f3b8dd09a9f52048b1c1414dc3046a86a47ec82eaa2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5709.0.0-darwin-arm64.tar.gz"
      sha256 "c0ab5acca8886c3245a3dab62827e380585e4526c2d5407f24f286ca43f67ad8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5709.0.0-linux-x64.tar.gz"
    sha256 "5763b3919634d60802248c07f6b368561e2f82e702051cccda06bccfa7578bcf"
  end
  version "5709.0.0"
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
