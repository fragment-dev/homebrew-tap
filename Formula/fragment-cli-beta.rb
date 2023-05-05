require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2596.0.0-darwin-x64.tar.gz"
    sha256 "7515bb2ba805652766d4af5da133944047f835c6ec9c15d281bb12df10d41365"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2596.0.0-darwin-arm64.tar.gz"
      sha256 "f9d2fd1db6530396f756431be22b53c7c8f5ba82536346b288fb47475fa051b3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2596.0.0-linux-x64.tar.gz"
    sha256 "35eb0284a924bb660bd5455e8f69bca4dd47515eef6f7cb758d48b91cc41fcf7"
  end
  version "2596.0.0"
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
