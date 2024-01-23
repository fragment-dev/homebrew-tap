require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4402.0.0-darwin-x64.tar.gz"
    sha256 "b4b0e869dbb9bbc6824d8e409fb24a07c8e95a894fb4a48efdd36478f0eca88b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4402.0.0-darwin-arm64.tar.gz"
      sha256 "fbd351fbfc4c6b59eeb2af9af9193fc34a36b33c5d98b82c442b49b969def6fb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4402.0.0-linux-x64.tar.gz"
    sha256 "a1687594cd553e1a7930f530bca07783c0fd9c813e6d1a20a83728c48958e1e7"
  end
  version "4402.0.0"
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
