require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2396.0.0-darwin-x64.tar.gz"
    sha256 "e784ff9f2b7cb0489085488eb5c700edf594e09a40cd38383944760fc8ca590a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2396.0.0-darwin-arm64.tar.gz"
      sha256 "feb69b750d8ee06c45d030c84103730ae9e0617f8d38b5aa84a9fc11e7535e3b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2396.0.0-linux-x64.tar.gz"
    sha256 "97f9925de5b70f9768d550db48e6f4df91989fe104bde2547968f1ceb8fa69a4"
  end
  version "2396.0.0"
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
