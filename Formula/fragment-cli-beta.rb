require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3431.0.0-darwin-x64.tar.gz"
    sha256 "0f5cf7f8544bab0f79f92ec85886d474a9461872d176c6962ddbe7d22f991c77"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3431.0.0-darwin-arm64.tar.gz"
      sha256 "5db73eca5dd4b13732da8045785e8d7c6f094cedef8c95e517cb749c240d89e9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3431.0.0-linux-x64.tar.gz"
    sha256 "40981fe2397ee0007bc8f609e9b3c9c74e10e083e5dfd764f268400aa90cf8e6"
  end
  version "3431.0.0"
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
