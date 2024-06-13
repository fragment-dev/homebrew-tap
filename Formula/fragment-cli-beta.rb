require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5270.0.0-darwin-x64.tar.gz"
    sha256 "37b07a2666954c773c43042c7914f9a02a942080f016ea5688995f025c36b878"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5270.0.0-darwin-arm64.tar.gz"
      sha256 "9d980eb48880bddbac875b2aadfa455ad3b2499b20a4d2c0aaefecff9bda8c06"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5270.0.0-linux-x64.tar.gz"
    sha256 "06404436cfa1082519a50424886521a7a0b8b90e5016ed836e2ad5bfebb05561"
  end
  version "5270.0.0"
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
