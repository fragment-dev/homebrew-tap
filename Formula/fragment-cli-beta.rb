require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3340.0.0-darwin-x64.tar.gz"
    sha256 "053c1a975c0d8c792cf3d5c6b21e04434860fc2fcaeff2e87f8c1a71354a9a4a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3340.0.0-darwin-arm64.tar.gz"
      sha256 "1cf5a8dad9330fe544ead77f8a0da1434ec64d05bd42305e86c7c2adc1534493"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3340.0.0-linux-x64.tar.gz"
    sha256 "0191f65f473c27f23e444e9b0cac5a35fcda1b38eb2ba2772cf2f4871c588533"
  end
  version "3340.0.0"
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
