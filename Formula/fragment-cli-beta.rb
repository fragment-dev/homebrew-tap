require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3711.0.0-darwin-x64.tar.gz"
    sha256 "2305dc649c7521eff8d984402a4b2b91251fa9df720dadb8235e22cbbcc3736a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3711.0.0-darwin-arm64.tar.gz"
      sha256 "99b70a9545578692e521033559ba837a2f0b670c2bcdfe8bfeaf1f16fdf064b2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3711.0.0-linux-x64.tar.gz"
    sha256 "e8b54d2f9833a9e665ddce575d56686eef85ca26d24a7f94f2ce4e93d9512bcb"
  end
  version "3711.0.0"
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
