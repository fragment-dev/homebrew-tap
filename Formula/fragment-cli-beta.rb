require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5219.0.0-darwin-x64.tar.gz"
    sha256 "c4aafc8f4d47e04774c8f77a3e79885789d794c6299200d93021ecc92279ce7e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5219.0.0-darwin-arm64.tar.gz"
      sha256 "939400b3055dd745b7a495e0c61b67b3fdab71fa49a611f8081fe823d806bfed"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5219.0.0-linux-x64.tar.gz"
    sha256 "004626fdadc79e7c699fce2463fc8f6a790a46a6ed0da40a343233ccd78b5b7d"
  end
  version "5219.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
