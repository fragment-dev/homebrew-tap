require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5656.0.0-darwin-x64.tar.gz"
    sha256 "b5fbf2c734f6712ab6759b8d32518000a090037e5d2ccaa60a6151c3e289858e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5656.0.0-darwin-arm64.tar.gz"
      sha256 "20d3cec07214efabfd604c18c006794e1d3302ec9ca064687a17be778bd0d009"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5656.0.0-linux-x64.tar.gz"
    sha256 "f7acc4ba42def949b39af19a22ee0d8106b6affdebc0cea4bf02af4f9f91af42"
  end
  version "5656.0.0"
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
