require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4211.0.0-darwin-x64.tar.gz"
    sha256 "19f7ec974518abf6b3935022455226f8f3d9e62fe86f9a80ee44f176bbbdfd35"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4211.0.0-darwin-arm64.tar.gz"
      sha256 "75371350aa8aabd5ac27043e77dde8e4c53c2192b0db09ccd0ce3f9cdb6eeaf4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4211.0.0-linux-x64.tar.gz"
    sha256 "9919000935e8f621799c8f9014146cafb34580820ca8510954fbccc4be92d743"
  end
  version "4211.0.0"
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
