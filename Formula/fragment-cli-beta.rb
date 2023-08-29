require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3427.0.0-darwin-x64.tar.gz"
    sha256 "58b7b1e02a1cd35abd304245eec90d98880131d75becf4e1c499100f04179028"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3427.0.0-darwin-arm64.tar.gz"
      sha256 "77438c39720203c46d941ec3f875c6988a1c13ebc26fe19cd0b62b312a632660"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3427.0.0-linux-x64.tar.gz"
    sha256 "cac083a71729793ba4c19859ce80c389f839d0cd0315b34604d79166b8eda4ac"
  end
  version "3427.0.0"
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
