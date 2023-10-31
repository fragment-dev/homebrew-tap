require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3952.0.0-darwin-x64.tar.gz"
    sha256 "78e35dd62c61428cdb1b9cf556351e4546f01424adc2c93859b2b509d36d0b69"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3952.0.0-darwin-arm64.tar.gz"
      sha256 "077ea49a08089ac752a42cce76000d494c8a251e26dc87e241e5cd30c8d45233"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3952.0.0-linux-x64.tar.gz"
    sha256 "aa76e4720c6566c932753a6ab82232fa6d0bd9b20a68c6ba3102e480fe548484"
  end
  version "3952.0.0"
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
