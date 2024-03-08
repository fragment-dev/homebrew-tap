require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4740.0.0-darwin-x64.tar.gz"
    sha256 "9ad6b1b3d580b876f13bf435687963c7af2f5019838cb21dcd1fdb8003ac69ea"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4740.0.0-darwin-arm64.tar.gz"
      sha256 "49d03b20ed1173c3f9c7c38e7ce84b9cde787e72b53c78d968d6a157b7d8b8f9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4740.0.0-linux-x64.tar.gz"
    sha256 "f04fd473bb9afbb94efe89df730d8554734b8b09fd3e04a898950dcb97804502"
  end
  version "4740.0.0"
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
