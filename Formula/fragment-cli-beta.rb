require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5346.0.0-darwin-x64.tar.gz"
    sha256 "9cca91ad15b1a71f6fa3de77c5d1cd523680cb5c71b896492cedd6f2dd439e3f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5346.0.0-darwin-arm64.tar.gz"
      sha256 "1beaaf5e8fc23ccd328cdf24e8ae602d0baa2b9f4ec8b85c10a2c752828449af"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5346.0.0-linux-x64.tar.gz"
    sha256 "6404330a4641f5b613b5cee48451ce9f28116813fcda36c599c1fc50bb67d15f"
  end
  version "5346.0.0"
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
