require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4784.0.0-darwin-x64.tar.gz"
    sha256 "82b81251d9c18e8f64665ef8b9ea7dac1f73fe3044bb12f05c070d27242f7ee0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4784.0.0-darwin-arm64.tar.gz"
      sha256 "57bb31aa75b1a58f09c01df1ca2b373e4d603a480c1bf19383ba178426fce020"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4784.0.0-linux-x64.tar.gz"
    sha256 "87628717dbafcc62fd074732f79c0dd77b0c3731135572686040ddfbb0bd3a99"
  end
  version "4784.0.0"
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
