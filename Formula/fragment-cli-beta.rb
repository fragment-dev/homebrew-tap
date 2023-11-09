require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3988.0.0-darwin-x64.tar.gz"
    sha256 "e91456d008dcf1feaea96e7b954b4e3b006ca151c063ac719c97f9b83e0da26f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3988.0.0-darwin-arm64.tar.gz"
      sha256 "4352b2b61282227f4ab819dc98de6467f941c893b4324d3de1c2bde14350894f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3988.0.0-linux-x64.tar.gz"
    sha256 "ad7c323a97191858fe5792da480bc83b6e4893e58738ba592bdb8f5deb907e29"
  end
  version "3988.0.0"
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
