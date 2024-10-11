require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5658.0.0-darwin-x64.tar.gz"
    sha256 "ead426248494e532f69a554ca7b0d5c6654c9c4af5607bd08257fe0ca3c2e231"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5658.0.0-darwin-arm64.tar.gz"
      sha256 "85dbcb8f54cbf5b1c236dc893b33609223d7eb397498c8fff53265ce7aae0426"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5658.0.0-linux-x64.tar.gz"
    sha256 "813f04fa07046248e0f0a18c0d0cef2279b68e007feb333b5a9e0575732cf15d"
  end
  version "5658.0.0"
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
