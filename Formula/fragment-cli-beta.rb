require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2357.0.0-darwin-x64.tar.gz"
    sha256 "fc96a3b3b07b7ea9b5fcd1ba0409e740f40fb4b4f039d09cdfb8556ab4123b30"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2357.0.0-darwin-arm64.tar.gz"
      sha256 "7430eab53eae4728992d2317782c663a8da7438a510453a85c62e00d53c3b01b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2357.0.0-linux-x64.tar.gz"
    sha256 "cf841083ebe077e3bdd0e9e96a09b9e9d7089dfc811d04054b065b622b27f713"
  end
  version "2357.0.0"
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
