require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v8211.0.0-darwin-x64.tar.gz"
    sha256 "8a82600f413b72cae916d6e4634439a4e9fe320cc8e8d4aa6f1f8033fb13a988"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v8211.0.0-darwin-arm64.tar.gz"
      sha256 "f42cad21a81e3ac1891448d47ad1e2a2cefaa5357894de9ee711ad0b09e556e0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v8211.0.0-linux-x64.tar.gz"
    sha256 "f4cc2b36376c1c9e3242b83e5175871a1a86abb72f9e491815f0504cb1da61fc"
  end
  version "8211.0.0"
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
