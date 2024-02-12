require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4535.0.0-darwin-x64.tar.gz"
    sha256 "800a4561b54958beea3a22eb74cad0df4685e14e442db1ab8ff5ee70117e3633"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4535.0.0-darwin-arm64.tar.gz"
      sha256 "55b108ef4bfb6447c6c5951156625ad21227d23a5586b5cbfe5620d97e4bfb92"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4535.0.0-linux-x64.tar.gz"
    sha256 "9de60f5acf9f60adc05e07fc1de04e9d625c4e6a37e2234923d8ef5942f54058"
  end
  version "4535.0.0"
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
