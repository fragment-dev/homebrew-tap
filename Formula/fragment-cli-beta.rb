require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3420.0.0-darwin-x64.tar.gz"
    sha256 "56be51d91c9e31633c240a886d3412e1477f3f0104963966eb20685c98979036"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3420.0.0-darwin-arm64.tar.gz"
      sha256 "d22e86fb9d8b46b384ce68af793b3435c1b365668144c902a232d1ae4c7e1789"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3420.0.0-linux-x64.tar.gz"
    sha256 "aaf4526e50260e6912d5eb61aed0ff09944e5ee00a98a8c4884795a3f4eea62e"
  end
  version "3420.0.0"
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
