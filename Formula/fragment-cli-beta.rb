require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4314.0.0-darwin-x64.tar.gz"
    sha256 "dd6873beed9382a609602b8c026b04d679e9873f6ffe77c482c1fe111214ebb3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4314.0.0-darwin-arm64.tar.gz"
      sha256 "f8175ec900fd2d7ed8ebc00687e7e8183a801bc4e01a603bfe9fed27c75caee3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4314.0.0-linux-x64.tar.gz"
    sha256 "cf3b6433971b0dc4993f92e61905c199f4a60e888d580dec55eb426489d8cca3"
  end
  version "4314.0.0"
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
