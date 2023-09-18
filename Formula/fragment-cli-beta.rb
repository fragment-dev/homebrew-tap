require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3602.0.0-darwin-x64.tar.gz"
    sha256 "185443ae0185ed2ae1bec024c035e9da3a8db2eb92b05dda5fcc629d414e8997"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3602.0.0-darwin-arm64.tar.gz"
      sha256 "753c039fa9c3035552847e410e5e90f3c1d9d09b0bf17f368cdd07df6fe0fce2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3602.0.0-linux-x64.tar.gz"
    sha256 "6d8cd0feafee620e9bd94b9a0d70966947d5f412d5f1a3d6a243a895ac684331"
  end
  version "3602.0.0"
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
