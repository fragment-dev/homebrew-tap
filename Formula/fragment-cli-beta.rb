require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4232.0.0-darwin-x64.tar.gz"
    sha256 "f03afa08dae187d49b2810cb27e9627a17a0709f2f1063847cb71a76e2eb09f8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4232.0.0-darwin-arm64.tar.gz"
      sha256 "d821e0a9eec1f105ea13f8a816cacd9c05657e459ebc3504601cd02c27e93c32"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4232.0.0-linux-x64.tar.gz"
    sha256 "42a1bab78518e633eac487219b54631616aa496c59cb4b4b19ec262374f5e60a"
  end
  version "4232.0.0"
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
