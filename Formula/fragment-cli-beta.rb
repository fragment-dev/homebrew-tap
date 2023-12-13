require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4147.0.0-darwin-x64.tar.gz"
    sha256 "11896157fe6ef3e2e5a2810f19b7ad3e3472cba7644a2a88b237920b09808aef"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4147.0.0-darwin-arm64.tar.gz"
      sha256 "4646f713f22575c01d0f956043711b381fe4be4b651be9cc0d5d45b426bff42e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4147.0.0-linux-x64.tar.gz"
    sha256 "5dd8b8fd8c5ee58c65890028c5733be467501ddf87ab50efc52d26f8d8ec3ec6"
  end
  version "4147.0.0"
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
