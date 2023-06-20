require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2882.0.0-darwin-x64.tar.gz"
    sha256 "ad4ab460df88dfc966286f77ef45a4b7abec7bd132cc8dc7e20d1fa291390db6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2882.0.0-darwin-arm64.tar.gz"
      sha256 "2a7927732cf77816dae86eac319238de78114c9af8bb5a8b3b8ec307a4aa9d5a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2882.0.0-linux-x64.tar.gz"
    sha256 "64d7564d12cb508837e80cacd4a7388495175658a4829fd2c6e6ea4aac9ade31"
  end
  version "2882.0.0"
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
