require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4962.0.0-darwin-x64.tar.gz"
    sha256 "55bae9136a459030d57eef056ba3a1b02eeac6175f58ba7354bf83923468481d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4962.0.0-darwin-arm64.tar.gz"
      sha256 "f1480f5b60c32bdfb43e0af6eb19a2b23ba1dffdeb26932ede77551921b2f538"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4962.0.0-linux-x64.tar.gz"
    sha256 "424f1ddf494ad0a9f36024f131a44d7bcd42894fc3552dd5030a91a1459e9d77"
  end
  version "4962.0.0"
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
