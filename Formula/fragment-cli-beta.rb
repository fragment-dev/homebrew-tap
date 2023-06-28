require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2956.0.0-darwin-x64.tar.gz"
    sha256 "fba879eb5de24e4679d395ca299a80d68ca1d984fc93f9875c14884a737e1b67"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2956.0.0-darwin-arm64.tar.gz"
      sha256 "9f75134d0919f82c4a24e4d8b3a3bdf2513c08eb16a6ecb577a2dcc1070cc5ea"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2956.0.0-linux-x64.tar.gz"
    sha256 "9317cb23389dde9fcc07154751eb40deed0741a62af556e5cf29c64192dd09cb"
  end
  version "2956.0.0"
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
