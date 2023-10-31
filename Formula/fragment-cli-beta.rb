require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3949.0.0-darwin-x64.tar.gz"
    sha256 "467fd81b185b38a9031f8f388997e3a3b871174dd8ce5fb05f3298e6a85c97a6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3949.0.0-darwin-arm64.tar.gz"
      sha256 "712838b16cf5a34ef5cf0be3baa6c729b4e30d00c9271f0d11e9cf5d7fd533b2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3949.0.0-linux-x64.tar.gz"
    sha256 "f941c00b00952015d11258532b531692b5ad0f2b48573f03adc9001773514738"
  end
  version "3949.0.0"
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
