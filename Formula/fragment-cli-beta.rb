require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3717.0.0-darwin-x64.tar.gz"
    sha256 "4e2ebb09c8d9cc90ac4b713729dd78108eaeb3dc836a1a4cecda5e8eb995e75c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3717.0.0-darwin-arm64.tar.gz"
      sha256 "6aae4a2fef85322bd82b1800f4baaf3f0cb6e6ce5ca9f2552893ce4945048bf7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3717.0.0-linux-x64.tar.gz"
    sha256 "bcc1e2c96002a0822944d6457a032419c923278ab682f895d47fb7d328281896"
  end
  version "3717.0.0"
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
