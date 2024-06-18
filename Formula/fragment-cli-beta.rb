require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5295.0.0-darwin-x64.tar.gz"
    sha256 "4a7da869258f236373feca6d2f5e2daca4defd56405c93c22d803a83caba9f10"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5295.0.0-darwin-arm64.tar.gz"
      sha256 "9a90dd7961977504bd7e56cbffef2bd169c6413b348317505cb73a2c37f9d3a4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5295.0.0-linux-x64.tar.gz"
    sha256 "d6c1af943ffd41a11e92fc22133601218c253329ac68d7c10b1145bb309548ed"
  end
  version "5295.0.0"
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
