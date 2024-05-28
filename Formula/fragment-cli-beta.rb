require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5122.0.0-darwin-x64.tar.gz"
    sha256 "be8da9866a7cfc83afb168c839f9327b3efe642c385ff8bc90937623d4547789"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5122.0.0-darwin-arm64.tar.gz"
      sha256 "0cb16c1dba06e2447e1ae2f613cb6d8e9ad4f32144bcfc8de9ce01c847e35782"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5122.0.0-linux-x64.tar.gz"
    sha256 "8fab6937879a89146249c443152d6cd5bc07a6fd9e5fd53f69d73bc448b9ca01"
  end
  version "5122.0.0"
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
