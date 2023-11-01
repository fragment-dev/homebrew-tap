require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3953.0.0-darwin-x64.tar.gz"
    sha256 "6673d206175c4f7f73a40571c12cb6021987dd00e0f35f96ca1d2025a455163c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3953.0.0-darwin-arm64.tar.gz"
      sha256 "f7ce6e565641c00e7007aaaf12c0dbf2a62e7aa50b26510bff4628eedeffd275"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3953.0.0-linux-x64.tar.gz"
    sha256 "a6b1487c97a56359738965c9ae3473f3a28e0fbe8286514d2ae71f242991eabd"
  end
  version "3953.0.0"
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
