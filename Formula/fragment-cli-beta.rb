require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4447.0.0-darwin-x64.tar.gz"
    sha256 "68dee41e81ee8ee3021ce422053e6092b5cf99b9b336382253d15aafedbca4ca"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4447.0.0-darwin-arm64.tar.gz"
      sha256 "22bbf3f8cd031c44faae2935fc3e09790d2ad6f07387f7980457bca903822562"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4447.0.0-linux-x64.tar.gz"
    sha256 "454ae2ec9c8d1cdce98eaa80d0ae7394e1e1bc0ede821ed4bbab1554092301fe"
  end
  version "4447.0.0"
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
