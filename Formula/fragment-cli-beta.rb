require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3799.0.0-darwin-x64.tar.gz"
    sha256 "b7a8740f93d36314bd625e8a6cad5054cea5c08c0d16de1d6330e4c0948d323c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3799.0.0-darwin-arm64.tar.gz"
      sha256 "c32e2174cd0c7363b2b16994b62a3ee1428b73c4fd9ffd03a1a1caaefd59b22a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3799.0.0-linux-x64.tar.gz"
    sha256 "9255c85db2dedd667a3bda95d5c5221defc3669bc35186d5dea4d45b7e042f47"
  end
  version "3799.0.0"
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
